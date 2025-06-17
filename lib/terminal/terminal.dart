//Import aller Sub-Module
import '../sound/sound.dart';

//hier wird die Hauptklasse des Moduls zusammengestellt
class Terminal {
  // colored outputs
  //red e.g. error message
  static void red(String text) {
    print('\x1b[31m$text\x1b[0m');
  }

  //yellow e.g warning message
  static void yellow(String text) {
    print('\x1b[33m$text\x1b[0m');
  }

  //green e.g. success message
  static void green(String text) {
    print('\x1b[32m$text\x1b[0m');
  }

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

  // maxOS Voice message
  static Future<void> payVoiceAlert(
    String message, {
    String voice = 'Zarvox',
  }) => Sound.playVoiceAlert(message, voice: voice);
}
