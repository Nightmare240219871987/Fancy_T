import 'package:fancy_t/screen/writer.dart';

class ProgressBar extends Writer {
  String _empty = "\u2591";
  String _full = "\u2593";
  int _width = 60;

  ProgressBar({bool isBold = false, int width = 60}) {
    super.isBold = isBold;
    this._width = width;
  }

  void showProgBar(int percentage) {
    String full = _full * (_width / 100 * percentage).floor();
    String empty = _empty * (_width / 100 * (100 - percentage)).floor();
    write(full + empty);
  }
}
