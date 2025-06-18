import 'dart:io';
import 'package:fancy_t/screen/writer.dart';

class ProgressBar extends Writer {
  String _empty = "\u2591";
  String _full = "\u2593";
  String _title = "";
  int _width = 60;

  ProgressBar({bool isBold = false, int width = 60, String title = ""}) {
    super.isBold = isBold;
    this._width = width;
    this._title = title;
  }
  /*
  void showProgBar(int percentage) {
    String full = _full * (_width * percentage / 100).round();
    String empty = _empty * (_width * (100 - percentage) / 100).round();
    write(_title + full + empty);
  }*/

  void showProgBar(int percentage) {
    // 🔁 Gehe am Zeilenanfang zurück, leere die Zeile
    stdout.write('\x1b[2K\r');

    // 📊 Berechne Füllstand
    int fullBars = (_width * percentage / 100).round().clamp(0, _width);
    int emptyBars = _width - fullBars;

    // 🎨 Erstelle die Leiste
    String full = _full * fullBars;
    String empty = _empty * emptyBars;

    // 🖍️ Schreibe in dieselbe Zeile (ohne neue Zeile)
    stdout.write('${_title} $full$empty $percentage%');
  }

  void setTitle(String title) {
    _title = title;
  }
}
