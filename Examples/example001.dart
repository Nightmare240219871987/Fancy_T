import "package:fancy_t/fancy_t.dart";

void main() async {
  Terminal.clearScreen();
  Writer para = new Writer(isItalic: true);
  Writer blinker = new Writer(isBlinking: true, isBold: true);
  Writer header = new Writer(isBold: true, isUnderline: true);
  ProgressBar pb = new ProgressBar(isBold: true, width: 40);
  Menu menu = new Menu(width: 40);
  header.setForegroundColor(StdFgColor.blue);
  para.setForegroundColor(StdFgColor.white);
  blinker.setForegroundColor(StdFgColor.red);
  header.write("Das ist eine Headline");
  para.write("Das ist ein Paragraph !!! Also ein normaler Test.");
  blinker.write("das ist blink text!!!");
  pb.setTitle("Fortschritt : ");
  menu.isBold = true;
  menu.titleColor = StdFgColor.white;
  menu.frameColor = StdFgColor.magenta;
  menu.fontColor = StdFgColor.white;
  menu.printHeader("Testing1  ", Alignment.CENTER);
  menu.printRow("1. Vorschau ", false, Alignment.CENTER);
  menu.printRow("2. Testing  ", false, Alignment.CENTER);
  menu.printRow("3. Testing 2", false, Alignment.CENTER);
  menu.printRow("4. Beenden  ", true, Alignment.CENTER);
  pb.setColorRange({40: StdFgColor.yellow, 80: StdFgColor.green});
  pb.titleColor = StdFgColor.white;
  pb.labelColor = StdFgColor.white;
  pb.fullBarColor = StdFgColor.red;
  pb.emptyColor = StdFgColor.white;
  pb.showProgBar(0);
  for (int i = 0; i <= 100; i++) {
    pb.showProgBar(i);
    await Future.delayed(Duration(milliseconds: 100));
    if (i == 100) print('');
  }
}
