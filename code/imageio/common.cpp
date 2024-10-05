/**
 *  @file common.cpp
 *  @brief Jackalope- arm64 Program Modifications
 *  @author @h02332 | David Hoyt
 *  @date 04 MAR 2024
 *  @version 1.0.3
 *
 *  This program is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program. If not, see <http://www.gnu.org/licenses/>.
 *
 *  @section CHANGES
 *  - 03/03/2024, h02332: Initial commit.
 *
 *  @section TODO
 *  - Continue Fixes for Null Pointer Derefs
 */

#pragma mark - Headers

/**
 *  @brief Core and external libraries necessary for the fuzzer functionality.
 *  @discussion This section includes the necessary headers for the Foundation framework, UIKit, Core Graphics,
 *  standard input/output, standard library, memory management, mathematical functions,
 *  Boolean type, floating-point limits, and string functions. These libraries support
 *  image processing, UI interaction, and basic C operations essential for the application.
 */
#include <stdio.h>
#include <stdlib.h>
#include <inttypes.h>
#include <list>
#include <chrono>

#include "common.h"

// FATAL macro
// #define FATAL(msg) do { fprintf(stderr, "%s\n", msg); exit(EXIT_FAILURE); } while (0)

#pragma mark - Time Utilities

/*!
 @function GetCurTime
 @abstract Gets the current time in milliseconds.
 @discussion This function returns the current system time since epoch in milliseconds.
 @result The current system time in milliseconds.
 */
uint64_t GetCurTime(void) {
  auto duration =  std::chrono::system_clock::now().time_since_epoch();
  auto millis = std::chrono::duration_cast<std::chrono::milliseconds>(duration).count();
  return millis;
}

#pragma mark - Option Parsing Utilities

/*!
 @function BoolFromOptionValue
 @abstract Converts a string option value to a boolean.
 @discussion This function interprets "off", "false", and "0" as false; anything else as true.
 @param value The string value to interpret.
 @result The boolean interpretation of the value.
 */
bool BoolFromOptionValue(char *value) {
  if (_stricmp(value, "off") == 0) return false;
  if (_stricmp(value, "false") == 0) return false;
  if (_stricmp(value, "0") == 0) return false;
  return true;
}

/*!
 @function GetBinaryOption
 @abstract Retrieves a binary (true/false) option value from command line arguments.
 @discussion If the option is found and has a value, the value is interpreted as a boolean. If the option is found without a value, returns true. Otherwise, returns the default value.
 @param name The option name to look for.
 @param argc The argument count.
 @param argv The argument vector.
 @param default_value The default value to return if the option is not found.
 @result The boolean value of the option, or the default value if the option is not found.
 */
bool GetBinaryOption(const char *name, int argc, char** argv, bool default_value) {
  for (int i = 0; i < argc; i++) {
    if (strcmp(argv[i], "--") == 0) break;
    if (strcmp(argv[i], name) == 0) {
      if ((i + 1) < argc && strcmp(argv[i + 1], "--")) {
        return BoolFromOptionValue(argv[i + 1]);
      }
      return true;
    }
    if (strncmp(argv[i], name, strlen(name)) == 0) {
      if (argv[i][strlen(name)] == '=') {
        return BoolFromOptionValue(argv[i] + strlen(name) + 1);
      }
    }
  }
  return default_value;
}

/*!
 @function GetOptionAll
 @abstract Collects all values of a specified option from command line arguments.
 @discussion Values are added to a provided list. If an option has multiple occurrences, all are collected.
 @param name The option name to look for.
 @param argc The argument count.
 @param argv The argument vector.
 @param results A list to which the option's values will be added.
 */
char *GetOption(const char *name, int argc, char** argv) {
  for (int i = 0; i < argc; i++) {
    if(strcmp(argv[i], "--") == 0) return NULL;
    if(strcmp(argv[i], name) == 0) {
      if ((i + 1) < argc && strcmp(argv[i + 1], "--")) {
        return argv[i + 1];
      } else {
        return NULL;
      }
    }
    if (strncmp(argv[i], name, strlen(name)) == 0) {
      if (argv[i][strlen(name)] == '=') {
        return argv[i] + strlen(name) + 1;
      }
    }
  }
  return NULL;
}

/*!
 @function GetIntOption
 @abstract Retrieves an integer option value from command line arguments.
 @discussion Returns the integer value associated with an option if it exists, or a default value otherwise.
 @param name The option name to look for.
 @param argc The argument count.
 @param argv The argument vector.
 @param default_value The default value to return if the option is not found.
 @result The integer value of the option, or the default value if the option is not found.
 */
void GetOptionAll(const char *name, int argc, char** argv, std::list<char *> *results) {
  for (int i = 0; i < argc; i++) {
    if (strcmp(argv[i], "--") == 0) return;
    if (strcmp(argv[i], name) == 0) {
      if ((i + 1) < argc && strcmp(argv[i + 1], "--")) {
        results->push_back(argv[i + 1]);
      } else {
        return;
      }
    }
    if (strncmp(argv[i], name, strlen(name)) == 0) {
      if (argv[i][strlen(name)] == '=') {
        results->push_back(argv[i] + strlen(name) + 1);
      }
    }
  }
}

#pragma mark - Option Handling

/**
 Retrieves the integer value of a command-line option.

 This function searches for an option named `name` in the `argv` array, which is passed from the command line. If the option is found and it has a value, the function returns the value as an integer. If the option is not found, it returns a default value.

 @param name The name of the option to search for.
 @param argc The number of command-line arguments.
 @param argv The array of command-line arguments.
 @param default_value The default value to return if the option is not found.

 @return The integer value of the option if found; otherwise, the default value.

 ## Examples

 Consider the command line: `./program --option=42`. To retrieve the value of `--option`:

 ```cpp
 int value = GetIntOption("--option", argc, argv, 10);
 // value would be 42
If --option is not specified, value would be 10.

@remark This function uses strtol to convert the option string to an integer. Ensure the option value is a valid integer string.
/
int GetIntOption(const char name, int argc, char argv, int default_value) {
char *option = GetOption(name, argc, argv);
if (!option) return default_value;
return (int)strtol(option, NULL, 0);
}
 */
int GetIntOption(const char *name, int argc, char** argv, int default_value) {
  char *option = GetOption(name, argc, argv);
  if (option == NULL) {
    return default_value;
  } else {
    return (int)strtol(option, NULL, 0);
  }
}

#pragma mark - Command Line Argument Escaping

/*!
 @function ArgvEscapeWindows
 @abstract Escapes command line arguments for Windows.
 @discussion This function escapes spaces, tabs, newlines, vertical tabs, and backslashes in command line arguments for Windows, adding quotes around the argument if necessary.
 @param in The input argument string to escape.
 @param out The output buffer to store the escaped string; if NULL, only the required size is calculated.
 @result The size of the escaped string including the null terminator.
 */

size_t ArgvEscapeWindows(char *in, char *out) {
  int needs_quoting = 0;
  size_t size = 0;
  char *p = in;
  size_t i;

  //check if quoting is necessary
  if (strchr(in, ' ')) needs_quoting = 1;
  if (strchr(in, '\"')) needs_quoting = 1;
  if (strchr(in, '\t')) needs_quoting = 1;
  if (strchr(in, '\n')) needs_quoting = 1;
  if (strchr(in, '\v')) needs_quoting = 1;
  if (!needs_quoting) {
    size = strlen(in);
    if (out) memcpy(out, in, size);
    return size;
  }

  if (out) out[size] = '\"';
  size++;

  while (*p) {
    size_t num_backslashes = 0;
    while ((*p) && (*p == '\\')) {
      p++;
      num_backslashes++;
    }

    if (*p == 0) {
      for (i = 0; i < (num_backslashes * 2); i++) {
        if (out) out[size] = '\\';
        size++;
      }
      break;
    }
    else if (*p == '\"') {
      for (i = 0; i < (num_backslashes * 2 + 1); i++) {
        if (out) out[size] = '\\';
        size++;
      }
      if (out) out[size] = *p;
      size++;
    }
    else {
      for (i = 0; i < num_backslashes; i++) {
        if (out) out[size] = '\\';
        size++;
      }
      if (out) out[size] = *p;
      size++;
    }

    p++;
  }

  if (out) out[size] = '\"';
  size++;

  return size;
}

/*!
 @function ArgvEscapeMacOS
 @abstract Escapes command line arguments for macOS.
 @discussion This function escapes special characters in command line arguments for macOS by prefixing them with a backslash.
 @param in The input argument string to escape.
 @param out The output buffer to store the escaped string; if NULL, only the required size is calculated.
 @result The size of the escaped string including the null terminator.
 */
size_t ArgvEscapeMacOS(char *in, char *out) {
  size_t size = 0;
  char *p = in;
  while (*p) {
    if (strchr("|&:;()<>~*@?!$#[]{}\\ '\"`\t\n\v\r", *p)) {
      if (out) out[size] = '\\';
      size++;
    }

    if (out) out[size] = *p;
    size++;

    p++;
  }

  return size;
}

#pragma mark - Command Line Construction

/*!
 @function ArgvToCmd
 @abstract Constructs a single command line string from an array of arguments.
 @discussion This function concatenates all command line arguments into a single string, escaping each argument as necessary.
 @param argc The number of arguments.
 @param argv The array of argument strings.
 @result A dynamically allocated string that must be freed by the caller, containing the concatenated and escaped command line.
 */
char *ArgvToCmd(int argc, char** argv) {
  size_t len = 0;
  int i;
  char* buf, *ret;

  // Calculate required length
  for (i = 0; i < argc; i++)
    len += ArgvEscape(argv[i], NULL) + 1;

  // Handle potential zero length
  if (!len) FATAL("Error creating command line due to zero length");

  // Allocate memory
  buf = ret = (char *)malloc(len);
  if (buf == NULL) {
    FATAL("Failed to allocate memory for command line");
    // Explicit exit to satisfy static analysis tools
    exit(EXIT_FAILURE);
  }

  // Populate buffer
  for (i = 0; i < argc; i++) {
    size_t l = ArgvEscape(argv[i], buf);
    buf += l;
    if (i < argc - 1) {
      *(buf++) = ' '; // Safe as buf was checked after malloc
    }
  }

  // Null-terminate the string
  ret[len - 1] = 0;
  return ret;
}
