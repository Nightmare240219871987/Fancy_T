// Standard Farbe für den Vordergrund
abstract class StdFgColor {
  static const String _escape = General.esc;
  static const String _end = General.end + General.newLine;
  static const String black = _escape + "30" + _end;
  static const String red = _escape + "31" + _end;
  static const String green = _escape + "32" + _end;
  static const String yellow = _escape + "33" + _end;
  static const String blue = _escape + "34" + _end;
  static const String magenta = _escape + "35" + _end;
  static const String cyan = _escape + "36" + _end;
  static const String white = _escape + "37" + _end;
  static const String def = _escape + "39" + _end;
}

// Standart Farben für den Hintergrund
abstract class StdBgColor {
  static const String _escape = General.esc;
  static const String _end = General.end + General.newLine;
  static const String black = _escape + "40" + _end;
  static const String red = _escape + "41" + _end;
  static const String green = _escape + "42" + _end;
  static const String yellow = _escape + "43" + _end;
  static const String blue = _escape + "44" + _end;
  static const String magenta = _escape + "45" + _end;
  static const String cyan = _escape + "36" + _end;
  static const String white = _escape + "37" + _end;
  static const String def = _escape + "39" + _end;
}

abstract class General {
  static const String esc = "\x1b["; //beginnt die Escape Sequence
  static const String delim = ";"; // trennt Befehle der Sequenzen
  static const String end = "m"; // beendet Escape sequence
  static const String newLine = "\n"; // geht in die nächte Zeile
}

abstract class DisplayModes {
  static const String _escape = General.esc;
  static const String _end = General.end + General.newLine;
  static const String reset = _escape + "0" + _end;
  static const String bold = _escape + "1" + _end;
  static const String dim = _escape + "2" + _end;
  static const String italic = _escape + "3" + _end;
  static const String underlined = _escape + "4" + _end;
  static const String blinking = _escape + "5" + _end;
  static const String reverse =
      _escape + "7" + _end; // kehrt die Farbgebung der Konsole um
  static const String hidden = _escape + "8" + _end; // Unsichtbar
  static const String strikethrough = _escape + "9" + _end;
}
