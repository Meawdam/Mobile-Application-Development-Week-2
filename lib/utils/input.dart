import 'dart:io';

/// Console input helpers for command-line applications.
class Input {
  Input._();

  /// Writes [prompt], if supplied, then reads one line from standard input.
  ///
  /// Returns an empty string when the input stream is closed.
  static String readString([String? prompt]) {
    if (prompt != null) {
      stdout.write(prompt);
    }
    return stdin.readLineSync() ?? '';
  }

  /// Reads an integer, continuing to prompt until a valid value is entered.
  static int readInt([String? prompt]) {
    while (true) {
      final value = int.tryParse(readString(prompt).trim());
      if (value != null) {
        return value;
      }
      stdout.writeln('Please enter a valid integer.');
    }
  }

  /// Reads a decimal number, continuing to prompt until a valid value is entered.
  static double readDouble([String? prompt]) {
    while (true) {
      final value = double.tryParse(readString(prompt).trim());
      if (value != null) {
        return value;
      }
      stdout.writeln('Please enter a valid number.');
    }
  }
}
