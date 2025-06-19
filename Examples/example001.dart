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
  menu.frameColor = StdFgColor.green;
  menu.header("Testing1  ", color: StdFgColor.yellow, align: Alignment.CENTER);
  menu.header(
    "Testing 2",
    color: StdFgColor.blue,
    align: Alignment.CENTER,
    start: false,
    end: true,
  );
  menu.row("1. Vorschau ", color: StdFgColor.blue, align: Alignment.CENTER);
  menu.row("2. Testing  ", color: StdFgColor.green, align: Alignment.CENTER);
  menu.row("3. Testing 2", color: StdFgColor.magenta, align: Alignment.CENTER);
  menu.row(
    "4. Beenden  ",
    color: StdFgColor.red,
    align: Alignment.CENTER,
    end: true,
  );
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
