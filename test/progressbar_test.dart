import 'package:fancy_t/fancy_t.dart';

void main() async {
  var progressBar = ProgressBar(title: "Ladevorgang:", width: 30);

  for (int i = 0; i <= 100; i += 5) {
    progressBar.showProgBar(i);
    await Future.delayed(Duration(milliseconds: 80));
  }

  print("\nFertig!");
}
