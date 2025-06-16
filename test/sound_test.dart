import '../lib/terminal/terminal.dart';

void main() async {
  print("Spielt einen Fehler-Ton:");
  await Terminal.errorTone();

  print("Spielt eine Info-Sequenz:");
  await Terminal.playToneSequence([
    {'frequency': 800, 'duration': 150},
    {'frequency': 500, 'duration': 200},
  ]);
}
