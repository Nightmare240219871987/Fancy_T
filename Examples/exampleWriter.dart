import 'dart:io';
import '../lib/core/ansi_codes.dart';

class Writer {
  // Display Modes
  bool isBold = false;
  bool isItalic = false;
  bool isDim = false;
  bool isUnderline = false;
  bool isBlinking = false;
  bool isReverse = false;
  bool isHidden = false;
  bool isStrikeThrough = false;

  String _bgColor = "";
  String _fgColor = "";

  Writer() {}

  void reset() {
    stdout.write(DisplayModes.reset);
  }

  void setForegroundColor(String color) {
    this._fgColor = color;
  }

  void setBackgroundColor(String color) {
    this._bgColor = color;
  }

  void write(String text) {
    if (isBold) {
      stdout.write(DisplayModes.bold);
    }
    if (isItalic) {
      stdout.write(DisplayModes.italic);
    }
    if (isDim) {
      stdout.write(DisplayModes.dim);
    }
    if (isUnderline) {
      stdout.write(DisplayModes.underlined);
    }
    if (isBlinking) {
      stdout.write(DisplayModes.blinking);
    }
    if (isReverse) {
      stdout.write(DisplayModes.reverse);
    }
    if (isHidden) {
      stdout.write(DisplayModes.hidden);
    }
    if (isStrikeThrough) {
      stdout.write(DisplayModes.strikethrough);
    }

    stdout.write(_fgColor);
    stdout.write(_bgColor);

    stdout.write(text + "\n");
    reset();
  }
}
