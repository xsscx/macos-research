// Modified by @h02332 David Hoyt to aid in Debugging in Jackalope
// Modified main.cpp for Live Debugging Mode Implementation
// Should be used with your Stub Programs in CMakeLists.txt until Stable
// Ninja Mode with bleeded edge code

#include "common.h"
#include "fuzzer.h"
#include "mutator.h"
#include "mersenne.h"
#include "mutators/grammar/grammar.h"
#include "mutators/grammar/grammarmutator.h"
#include "mutators/grammar/grammarminimizer.h"
#include <iostream>
#include <csignal>
#include <fstream>  // For std::ofstream
#include <execinfo.h> // For backtrace and backtrace_symbols, available on Unix-like systems
#include <cstring> // For strerror
#include <cerrno>  // For errno

// Global debug flag
bool debugMode = true;
int verbosityLevel = 1; // 0: Errors only, 1: Info, 2: Debug, 3: Verbose Debug

std::ofstream debugLogFile("fuzzer_debug_log.txt", std::ios::app);

void LogDebug(const std::string& message, int level) {
    if (debugMode && level <= verbosityLevel) {
        auto now = std::chrono::system_clock::now();
        auto now_time_t = std::chrono::system_clock::to_time_t(now);
        debugLogFile << "{ \"time\": \"" << std::ctime(&now_time_t)
                     << "\", \"level\": \"" << level
                     << "\", \"message\": \"" << message << "\" }\n";
    }
}

void DebugBreakpoint(const std::string& message) {
    if (debugMode) {
        std::cout << "[DEBUG BREAK] " << message << "\n";
        std::cout << "Press enter to continue...\n";
        std::cin.get();
    }
}

// In the SignalHandler function, wrap the usage of backtrace and backtrace_symbols with ifdef checks
void SignalHandler(int signal) {
    std::cout << "Caught signal " << signal << "\n";
    switch(signal) {
        case SIGINT:
            LogDebug("Interrupt signal received.", 1);
            break;
        case SIGSEGV:
#ifdef __GNUC__
            void* callstack[128];
            int frames = backtrace(callstack, 128);
            char** strs = backtrace_symbols(callstack, frames);
            LogDebug("Segmentation fault. Generating stack trace...", 1);
            for (int i = 0; i < frames; ++i) {
                debugLogFile << strs[i] << std::endl;
            }
            free(strs);
#else
            LogDebug("Segmentation fault. Stack trace not available.", 1);
#endif
            break;
        // Add more cases as necessary
    }
    debugMode = true;
}

void SetupDebugMode() {
    signal(SIGINT, SignalHandler);
    signal(SIGSEGV, SignalHandler); // Catch segmentation faults
}

class BinaryFuzzer : public Fuzzer {
  Mutator *CreateMutator(int argc, char **argv, ThreadContext *tc) override;
  bool TrackHotOffsets() override { return true; }
};

Mutator * BinaryFuzzer::CreateMutator(int argc, char **argv, ThreadContext *tc) {
  bool use_deterministic_mutations = true;
  if(GetBinaryOption("-server", argc, argv, false)) {
    // don't do deterministic mutation if a server is specified
    use_deterministic_mutations = false;
  }
  use_deterministic_mutations = GetBinaryOption("-deterministic_mutations",
                                                argc, argv,
                                                use_deterministic_mutations);

  bool deterministic_only = GetBinaryOption("-deterministic_only",
                                            argc, argv,
                                            false);

  int nrounds = GetIntOption("-iterations_per_round", argc, argv, 1000);

  char* dictionary = GetOption("-dict", argc, argv);

  // a pretty simple mutation strategy

  PSelectMutator *pselect = new PSelectMutator();

  // select one of the mutators below with corresponding
  // probablilities
  pselect->AddMutator(new ByteFlipMutator(), 0.8);
  pselect->AddMutator(new ArithmeticMutator(), 0.2);
  pselect->AddMutator(new AppendMutator(1, 128), 0.2);
  pselect->AddMutator(new BlockInsertMutator(1, 128), 0.1);
  pselect->AddMutator(new BlockFlipMutator(2, 16), 0.1);
  pselect->AddMutator(new BlockFlipMutator(16, 64), 0.1);
  pselect->AddMutator(new BlockFlipMutator(1, 64, true), 0.1);
  pselect->AddMutator(new BlockDuplicateMutator(1, 128, 1, 8), 0.1);

  InterestingValueMutator *iv_mutator = NULL;
  if(dictionary) {
    iv_mutator = new InterestingValueMutator(false);
    iv_mutator->AddDictionary(dictionary);
  } else {
    iv_mutator = new InterestingValueMutator(true);
  }
  pselect->AddMutator(iv_mutator, 0.1);

  // SpliceMutator is not compatible with -keep_samples_in_memory=0
  // as it requires other samples in memory besides the one being
  // fuzzed.
  if (GetBinaryOption("-keep_samples_in_memory", argc, argv, true)) {
    pselect->AddMutator(new SpliceMutator(1, 0.5), 0.1);
    pselect->AddMutator(new SpliceMutator(2, 0.5), 0.1);
  }

  Mutator* pselect_or_range = pselect;

  // if we are tracking ranges, insert a RangeMutator
  // between RepeatMutator and individual mutators
  if (GetBinaryOption("-track_ranges", argc, argv, false)) {
    RangeMutator* range_mutator = new RangeMutator(pselect);
    pselect_or_range = range_mutator;
  }

  // potentially repeat the mutation
  // (do two or more mutations in a single cycle
  // 0 indicates that actual mutation rate will be adapted
  RepeatMutator *repeater = new RepeatMutator(pselect_or_range, 0);

  if(!use_deterministic_mutations && !deterministic_only) {
    
    // and have nrounds of this per sample cycle
    NRoundMutator *mutator = new NRoundMutator(repeater, nrounds);
    return mutator;
    
  } else {
    
    MutatorSequence *deterministic_sequence = new MutatorSequence(false, true);
    // do deterministic byte flip mutations (around hot bits)
    deterministic_sequence->AddMutator(new DeterministicByteFlipMutator());
    // ..followed by deterministc interesting values
    deterministic_sequence->AddMutator(new DeterministicInterestingValueMutator(true));
    
    size_t deterministic_rounds, nondeterministic_rounds;
    if (deterministic_only) {
      deterministic_rounds = nrounds;
    } else {
      deterministic_rounds = nrounds / 2;
    }
    nondeterministic_rounds = nrounds - deterministic_rounds;

    // do 1000 rounds of derministic mutations, will switch to nondeterministic mutations
    // once deterministic mutator is "done"
    DtermininsticNondeterministicMutator *mutator =
      new DtermininsticNondeterministicMutator(
        deterministic_sequence,
        deterministic_rounds,
        repeater,
        nondeterministic_rounds);

    return mutator;
  }
}

class GrammarFuzzer : public Fuzzer {
public:
  GrammarFuzzer(const char *grammar_file);
protected:
  Grammar grammar;
  Mutator* CreateMutator(int argc, char** argv, ThreadContext* tc) override;
  Minimizer* CreateMinimizer(int argc, char** argv, ThreadContext* tc) override;
  bool OutputFilter(Sample* original_sample, Sample* output_sample, ThreadContext* tc) override;

  bool IsReturnValueInteresting(uint64_t return_value) override;
};

GrammarFuzzer::GrammarFuzzer(const char* grammar_file) {
  if (!grammar.Read(grammar_file)) {
    FATAL("Error reading grammar");
  }
}

Mutator* GrammarFuzzer::CreateMutator(int argc, char** argv, ThreadContext* tc) {
  GrammarMutator* grammar_mutator = new GrammarMutator(&grammar);

  NRoundMutator* mutator = new NRoundMutator(grammar_mutator, 20);

  return mutator;
}

Minimizer* GrammarFuzzer::CreateMinimizer(int argc, char** argv, ThreadContext* tc) {
  return new GrammarMinimizer(&grammar);
}

bool GrammarFuzzer::OutputFilter(Sample* original_sample, Sample* output_sample, ThreadContext* tc) {
  uint64_t string_size = *((uint64_t*)original_sample->bytes);
  if (original_sample->size < (string_size + sizeof(string_size))) {
    FATAL("Incorrectly encoded grammar sample");
  }

  output_sample->Init(original_sample->bytes + sizeof(string_size), string_size);
  return true;
}

bool GrammarFuzzer::IsReturnValueInteresting(uint64_t return_value) {
  return (return_value == 0);
}

void TestGrammar(char* grammar_path) {
  Grammar grammar;
  grammar.Read(grammar_path);
  PRNG* prng = new MTPRNG();
  Grammar::TreeNode *tree = grammar.GenerateTree("root", prng);
  if (!tree) {
    printf("Grammar failed to generate sample\n");
  } else {
    std::string out;
    grammar.ToString(tree, out);
    printf("Generated sample:\n%s\n", out.c_str());
  }
}

int main(int argc, char **argv) {
    SetupDebugMode();

    Fuzzer* fuzzer;

    char* grammar = GetOption("-test_grammar", argc, argv);
    if (grammar) {
        TestGrammar(grammar);
        return 0;
    }

    grammar = GetOption("-grammar", argc, argv);
    if (grammar) {
        fuzzer = new GrammarFuzzer(grammar);
    } else {
        fuzzer = new BinaryFuzzer();
    }

    fuzzer->Run(argc, argv);

    DebugBreakpoint("Fuzzing session ended.");

    return 0;
}
