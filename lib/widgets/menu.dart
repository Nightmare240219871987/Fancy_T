import "package:fancy_t/fancy_t.dart";

enum Alignment { LEFT, RIGHT, CENTER }

class Menu extends Writer {
  // Zeichensatz
  String _cornerUpLeft = "\u2554";
  String _cornerUpRight = "\u2557";
  String _cornerDownLeft = "\u255A";
  String _cornerDownRight = "\u255D";
  String _horizontal = "\u2550";
  String _vertical = "\u2551";
  String _crossLeft = "\u2560";
  String _crossRight = "\u2563";

  // Laufzeitvariablen
  int _maxWidth = 0;
  String titleColor = "";
  String frameColor = "";
  String fontColor = "";

  // Konstruktor
  Menu({int width = 60}) {
    this._maxWidth = width;
  }

  void printHeader(String title, Alignment align) {
    int maxLength = _maxWidth - 2;
    int spaces = ((maxLength - title.length) / 2).round().clamp(0, maxLength);
    String textToOut = "";
    switch (align) {
      case Alignment.CENTER:
        textToOut =
            frameColor +
            _vertical +
            " " * spaces +
            titleColor +
            title +
            " " * spaces +
            frameColor +
            _vertical;
      case Alignment.LEFT:
        textToOut =
            frameColor +
            _vertical +
            titleColor +
            title +
            " " * spaces * 2 +
            frameColor +
            _vertical;
      case Alignment.RIGHT:
        textToOut =
            frameColor +
            _vertical +
            " " * spaces * 2 +
            titleColor +
            title +
            frameColor +
            _vertical;
    }
    write(
      frameColor +
          _cornerUpLeft +
          frameColor +
          _horizontal * maxLength +
          frameColor +
          _cornerUpRight,
      newLine: true,
    );
    write(textToOut, newLine: true);
    write(
      frameColor +
          _crossLeft +
          frameColor +
          _horizontal * maxLength +
          frameColor +
          _crossRight,
      newLine: true,
    );
  }

  void printRow(String content, bool end, Alignment align) {
    int maxLength = _maxWidth - 2;
    if (content.length % 2 == 1) {
      content = content + " ";
    }
    int spaces = ((maxLength - content.length) / 2).round().clamp(0, maxLength);

    String textToOut = "";
    switch (align) {
      case Alignment.CENTER:
        textToOut =
            frameColor +
            _vertical +
            " " * spaces +
            fontColor +
            content +
            " " * spaces +
            frameColor +
            _vertical;
      case Alignment.LEFT:
        textToOut =
            frameColor +
            _vertical +
            fontColor +
            content +
            " " * spaces * 2 +
            frameColor +
            _vertical;
      case Alignment.RIGHT:
        textToOut =
            frameColor +
            _vertical +
            " " * spaces * 2 +
            fontColor +
            content +
            frameColor +
            _vertical;
    }
    write(textToOut, newLine: true);
    if (end) {
      print(
        frameColor +
            _cornerDownLeft +
            frameColor +
            _horizontal * maxLength +
            frameColor +
            _cornerDownRight,
      );
    }
  }
}
