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
  String frameColor = "";
  String fontColor = "";

  // Konstruktor
  Menu({int width = 60}) {
    this._maxWidth = width;
  }

  void header(
    String title, {
    String color = StdFgColor.white,
    Alignment align = Alignment.LEFT,
    bool start = true,
    bool end = false,
  }) {
    int maxLength = _maxWidth - 2;
    if (title.length % 2 == 1) {
      title = title + " ";
    }
    int spaces = ((maxLength - title.length) / 2).round().clamp(0, maxLength);
    String textToOut = "";

    switch (align) {
      case Alignment.CENTER:
        textToOut =
            frameColor +
            _vertical +
            " " * spaces +
            color +
            title +
            " " * spaces +
            frameColor +
            _vertical;
      case Alignment.LEFT:
        textToOut =
            frameColor +
            _vertical +
            color +
            title +
            " " * spaces * 2 +
            frameColor +
            _vertical;
      case Alignment.RIGHT:
        textToOut =
            frameColor +
            _vertical +
            " " * spaces * 2 +
            color +
            title +
            frameColor +
            _vertical;
    }
    if (start) {
      write(
        frameColor +
            _cornerUpLeft +
            frameColor +
            _horizontal * maxLength +
            frameColor +
            _cornerUpRight,
        newLine: true,
      );
    }

    write(textToOut, newLine: true);
    if (end) {
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
  }

  void row(
    String content, {
    String color = StdFgColor.white,
    bool end = false,
    Alignment align = Alignment.LEFT,
  }) {
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
            color +
            content +
            " " * spaces +
            frameColor +
            _vertical;
      case Alignment.LEFT:
        textToOut =
            frameColor +
            _vertical +
            color +
            content +
            " " * spaces * 2 +
            frameColor +
            _vertical;
      case Alignment.RIGHT:
        textToOut =
            frameColor +
            _vertical +
            " " * spaces * 2 +
            color +
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
