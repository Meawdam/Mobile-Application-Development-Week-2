import 'dart:io';

/// Console output helpers for command-line applications.
class Output {
  Output._();

  /// Writes [value] without appending a line break.
  static void write(Object? value) => stdout.write(value);

  /// Writes [value] followed by a line break.
  static void writeln([Object? value = '']) => stdout.writeln(value);
}
