import "package:fancy_t/fancy_t.dart";

void main() async {
  Terminal.clearScreen();
  Writer para = new Writer(isItalic: true);
  Writer blinker = new Writer(isBlinking: true, isBold: true);
  Writer header = new Writer(isBold: true, isUnderline: true);
  ProgressBar pb = new ProgressBar(isBold: true, width: 80);
  header.setForegroundColor(StdFgColor.red);
  para.setForegroundColor(StdFgColor.blue);
  blinker.setForegroundColor(StdFgColor.red);
  header.write("Das ist eine Headline");
  para.write("Das ist ein Paragraph !!! Also ein normaler Test.");
  blinker.write("das ist blink text!!!");
  pb.setTitle("Fortschritt : ");
  pb.setColorRange({40: StdFgColor.yellow, 80: StdFgColor.green});
  pb.titleColor = StdFgColor.blue;
  pb.labelColor = StdFgColor.yellow;
  pb.fullBarColor = StdFgColor.red;
  pb.emptyColor = StdFgColor.white;
  pb.showProgBar(0);

  for (int i = 0; i <= 100; i++) {
    pb.showProgBar(i);
    await Future.delayed(Duration(milliseconds: 100));
    if (i == 100) print('');
  }
}
