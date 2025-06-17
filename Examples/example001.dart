import 'dart:io';
import "../lib/core/ansi_codes.dart";
import "exampleWriter.dart";

void main() {
  Writer w = new Writer();
  print("\x1b[1m Nicht zurückgesetzt!");
  print("\x1b[7m Nicht zurückgesetzt!");
  w.reset();
  print("zurückgesetzt!");
}
