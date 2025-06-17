import "package:fancy_t/widgets/progress_bar.dart";
import "../lib/core/ansi_codes.dart";
import "package:fancy_t/fancy_t.dart";

void main() {
  Terminal.clearScreen();
  Writer para = new Writer(isItalic: true);
  Writer blinker = new Writer(isBlinking: true, isBold: true);
  Writer header = new Writer(isBold: true, isUnderline: true);
  ProgressBar pb = new ProgressBar(isBold: true, width: 80);
  header.setForegroundColor(StdFgColor.red);
  para.setForegroundColor(StdFgColor.blue);
  blinker.setForegroundColor(StdFgColor.red);
  pb.setForegroundColor(StdFgColor.green);

  header.write("Das ist eine Headline");
  para.write("Das ist ein Paragraph !!! Also ein normaler Test.");
  blinker.write("das ist blink text!!!");
  pb.showProgBar(20);
}
