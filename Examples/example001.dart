import 'dart:io';
import "../lib/core/ansi_codes.dart";
import "exampleWriter.dart";

void main() {
  Writer w = new Writer();
  w.setBackgroundColor(StdBgColor.red);
  w.setForegroundColor(StdFgColor.white);
  w.isBold = true;
  w.isItalic = true;
  w.isStrikeThrough = true;

  w.write("Hallo Welt");
}
