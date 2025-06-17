import 'dart:io';
import '../lib/core/ansi_codes.dart';

class Writer {
  // Display Modes
  bool _isBold = false;
  bool _isItalic = false;
  bool _isDim = false;
  bool _isUnderline = false;
  bool _isBlinking = false;
  bool _isReverse = false;
  bool _isHidden = false;
  bool _isStrikeThrough = false;

  Writer() {}

  void reset() {
    stdout.write(
      General.esc + DisplayModes.reset + General.end + General.newLine,
    );
  }
}
