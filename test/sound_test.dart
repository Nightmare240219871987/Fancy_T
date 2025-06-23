import 'package:fancy_t/fancy_t.dart';

void main() async {
  /*
  print("Spielt einen Fehler-Ton:");
  await Terminal.errorTone();

  print("Spielt eine Info-Sequenz:");
  await Terminal.playToneSequence([
    {'frequency': 800, 'duration': 150},
    {'frequency': 500, 'duration': 200},
  ]);
*/
  print("Spielt Voice-Alert:");
  await Terminal.payVoiceAlert('¡Hola! Me llamo Paulina.', voice: 'Paulina');
}
