import 'package:fancy_t/core/ansi_codes.dart';
import 'package:fancy_t/terminal/writer.dart';

class ProgressBar extends Writer {
  Map<int, String> _colorRange = {};
  String _empty = "\u2591";
  String _full = "\u2593";
  String _title = "";
  String titleColor = "";
  String labelColor = "";
  String fullBarColor = "";
  String emptyColor = "";
  int _width = 60;

  ProgressBar({bool isBold = false, int width = 60, String title = ""}) {
    super.isBold = isBold;
    this._width = width;
    this._title = title;
    if (_colorRange.isEmpty) {
      this._colorRange = _colorRange;
    }
  }

  void setColorRange(Map<int, String> colorRange) {
    this._colorRange = colorRange;
  }

  void showProgBar(int percentage) {
    if (this._colorRange.containsKey(percentage)) {
      this.fullBarColor = this._colorRange[percentage]!;
    }

    // 🔁 Gehe am Zeilenanfang zurück, leere die Zeile
    write('\x1b[2K\r', newLine: false);

    // 📊 Berechne Füllstand
    int fullBars = (_width * percentage / 100).round().clamp(0, _width);
    int emptyBars = _width - fullBars;

    // 🎨 Erstelle die Leiste
    String full = _full * fullBars;
    String empty = _empty * emptyBars;

    // 🖍️ Schreibe in dieselbe Zeile (ohne neue Zeile)
    write(
      '${General.esc + titleColor + _title}${General.esc + fullBarColor + full}${General.esc + emptyColor + empty} ${General.esc + this.labelColor + percentage.toString()}%',
      newLine: false,
    );
  }

  void setTitle(String title) {
    _title = title;
  }
}
