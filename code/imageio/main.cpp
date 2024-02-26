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
#include <fstream>
#include <execinfo.h>
#include <unistd.h>
#include <ctime>
#include "instrumentation.h"

std::ofstream debugLogFile("fuzzer_debug_log.txt", std::ios::app);

void LogDebug(const std::string& message) {
    debugLogFile << message << std::endl;
}

void DebugBreakpoint(const std::string& message) {
    std::cout << "[DEBUG BREAK] " << message << std::endl;
    std::cout << "Press enter to continue..." << std::endl;
    std::cin.get();
}

void SignalHandler(int signal) {
    std::cout << "Caught signal " << signal << std::endl;
    void* array[10];
    size_t size;

    // get void*'s for all entries on the stack
    size = backtrace(array, 10);
    // print out all the frames to stderr
    fprintf(stderr, "Error: signal %d:\n", signal);
//    backtrace_symbols_fd(array, size, STDERR_FILENO);
    backtrace_symbols_fd(array, static_cast<int>(size), STDERR_FILENO);

    exit(1);
}

void SetupSignalHandlers() {
    signal(SIGINT, SignalHandler);
    signal(SIGSEGV, SignalHandler);
}

// BinaryFuzzer and GrammarFuzzer class implementations remain unchanged

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
    // Setup signal handlers for debugging
    Instrumentation::SetupDebugMode();

    // Log start of the program with timestamp, program name, and arguments
    Instrumentation::LogDebug("Program started with arguments:", 1);
    for (int i = 0; i < argc; ++i) {
        Instrumentation::LogDebug(std::string(argv[i]), 1);
    }

    Fuzzer* fuzzer = nullptr;

    char* grammar = GetOption("-test_grammar", argc, argv);
    if (grammar) {
        TestGrammar(grammar); // Ensure this function exists and is implemented
        Instrumentation::LogDebug("TestGrammar completed.", 1);
        return 0;
    }

    grammar = GetOption("-grammar", argc, argv);
    if (grammar) {
        fuzzer = new GrammarFuzzer(grammar); // Ensure the constructor for GrammarFuzzer is defined
    } else {
        fuzzer = new BinaryFuzzer(); // Ensure the default constructor for BinaryFuzzer is defined
    }

    if (fuzzer) {
        fuzzer->Run(argc, argv);
        Instrumentation::LogDebug("Fuzzing completed.", 1);
    } else {
        Instrumentation::LogDebug("Failed to initialize fuzzer.", 1);
        return 1; // Indicates an error occurred
    }

    // Log end of the program with timestamp
    Instrumentation::LogDebug("Program ended.", 1);

    return 0;
}
