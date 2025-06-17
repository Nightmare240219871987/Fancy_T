import "../lib/core/ansi_codes.dart";
import "package:fancy_t/fancy_t.dart";

void main() {
  Writer para = new Writer();
  Writer blinker = new Writer();
  Writer header = new Writer();

  header.setForegroundColor(StdFgColor.red);
  header.isBold = true;

  para.setForegroundColor(StdFgColor.blue);
  para.isItalic = true;

  blinker.isBlinking = true;
  blinker.isBold = true;
  blinker.setForegroundColor(StdFgColor.red);

  header.write("Das ist eine Headline");
  para.write("Das ist ein Paragraph !!! Also ein normaler Test.");
  blinker.write("das ist blink text!!!");
}
