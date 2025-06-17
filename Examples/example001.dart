import "package:fancy_t/fancy_t.dart";
import "../lib/core/ansi_codes.dart";
import "dart:io";

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
  pb.showProgBar(0);
  Iterable<int> iterator = generateProgress();
  for (var i in iterator) {
    Terminal.clearScreen();
    header.write("Das ist eine Headline");
    para.write("Das ist ein Paragraph !!! Also ein normaler Test.");
    blinker.write("das ist blink text!!!");
    pb.showProgBar(i);
  }
}

Iterable<int> generateProgress() sync* {
  for (int i = 1; i <= 100; i++) {
    sleep(new Duration(seconds: 1));
    yield i;
  }
}
