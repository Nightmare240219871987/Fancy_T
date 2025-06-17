import 'dart:io';
import '../core/ansi_codes.dart';

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

  Writer({
    bool isBold = false,
    bool isItalic = false,
    bool isDim = false,
    bool isUnderline = false,
    bool isBlinking = false,
    bool isReverse = false,
    bool isHidden = false,
    bool isStrikeThrough = false,
  }) {
    this.isBold = isBold;
    this.isItalic = isItalic;
    this.isDim = isDim;
    this.isUnderline = isUnderline;
    this.isBlinking = isBlinking;
    this.isReverse = isReverse;
    this.isHidden = isHidden;
    this.isStrikeThrough = isStrikeThrough;
  }

  void reset() {
    stdout.write(DisplayModes.reset);
  }

  void setForegroundColor(String color) {
    this._fgColor = color;
  }

  void setBackgroundColor(String color) {
    this._bgColor = color;
  }

  void setForegroundTrueColor(int r, int g, int b) {
    this._fgColor = General.esc + "38;2;$r;$g;$b" + General.end;
  }

  void setBackgroundTrueColor(int r, int g, int b) {
    this._bgColor = General.esc + "48;2;$r;$g;$b" + General.end;
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
