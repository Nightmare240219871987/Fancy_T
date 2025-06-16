//Import aller Sub-Module
import '../sound/sound.dart';

//hier wird die Hauptklasse des Moduls zusammengestellt
class Terminal {
  // Bell-Tone
  static void beep({String message = "Error"}) {
    Sound.beepOrFail(fallbackMessage: message);
  }

  // Standard-Tones
  static Future<void> errorTone() => Sound.playErrorTone();
  static Future<void> warningTone() => Sound.playWarningTone();
  static Future<void> successTone() => Sound.playSuccessTone();
  static Future<void> infoTone() => Sound.playInfoTone();

  // Sequenz-Tones
  static Future<void> playToneSequence(
    List<Map<String, int>> sequence, {
    int gap = 100,
  }) {
    return Sound.playToneSequence(sequence, gap: gap);
  }
}
