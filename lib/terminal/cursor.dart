import 'package:fancy_t/fancy_t.dart';

class Cursor {
  String esc = General.esc;
  String sEsc = "\x1b";
  String delim = General.delim;
  String home = "H";
  String up = "A";
  String down = "B";
  String right = "C";
  String left = "D";
  String nxLines = "E";
  String prvLines = "F";
  String toCol = "G";
  String prvLine = "M";

  String crsPosition = "6n";

  String savCursor = "7";
  String rstCursor = "8";

  dynamic cWriter = new Writer();

  void moveUp(int lines) {
    String str = this.esc + lines.toString() + this.up;
    this.cWriter.writeCmdLine(str);
  }

  void moveDown(int lines) {
    String str = this.esc + lines.toString() + this.down;
    this.cWriter.writeCmdLine(str);
  }

  void moveRight(int rows) {
    String str = this.esc + rows.toString() + this.right;
    this.cWriter.writeCmdLine(str);
  }

  void moveLeft(int rows) {
    String str = this.esc + rows.toString() + this.left;
    this.cWriter.writeCmdLine(str);
  }

  void saveCursorPos() {
    String str = sEsc + savCursor;
    this.cWriter.writeCmdLine(str);
  }

  void restoreCursorPos() {
    String str = sEsc + rstCursor;
    this.cWriter.writeCmdLine(str);
  }

  void moveHome() {
    String str = esc + this.home;
    this.cWriter.writeCmdLine(str);
  }

  void prevLine() {
    String str = sEsc + this.prvLine;
    this.cWriter.writeCmdLine(str);
  }

  void nextLine({int count = 1}) {
    String str = esc + count.toString() + nxLines;
    this.cWriter.writeCmdLine(str);
  }
}
