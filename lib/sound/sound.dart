import 'dart:io';
import 'dart:async';

class Sound {
  // Spielt ein Bell (ASCII \a) im Terminal ab, sofern unterstützt
  static void _beep() {
    stdout.write('\x07');
  }

  // Prüfen ob Bell unterstützt wird
  static bool _isBellSupported() {
    return !Platform.isWindows;
  }

  // Spielt einen Ton ab oder gibt eine Nachricht aus
  static void beepOrFail({String fallbackMessage = "Ton nicht verfügbar!"}) {
    if (_isBellSupported())
      _beep();
    else
      print(fallbackMessage);
  }

  // Einen Ton mit Frequenz und Dauer abspielen
  static Future<void> _playTone(
    int frequency,
    int durationMs, {
    String voice = 'Samantha',
    String message = 'Beep',
  }) async {
    if (Platform.isLinux)
      await Process.run('beep', ['-f', '$frequency', '-l', '$durationMs']);
    else if (Platform.isMacOS)
      /*
    Alex en_US Most natural voice male
    Daniel en_GB British English male
    Samantha en_US System default voice female
    Zarvox Censored Robot voice
    */
      await Process.run('say', ['-v', voice, message]);
    else if (Platform.isWindows)
      await Process.run(
        'PowerShell',
        ['-Command', r'[console]::Beep($env:frequency, $env:durationMs)'],
        environment: {'frequency': '$frequency', 'durationMs': '$durationMs'},
      );
  }

  // Standard-Töne
  static Future<void> playErrorTone() =>
      _playTone(1000, 200, voice: 'Daniel', message: 'Error!'); // Hoch, kurz
  static Future<void> playWarningTone() =>
      _playTone(600, 300, voice: 'Alex', message: 'Warning!'); // Mittel
  static Future<void> playSuccessTone() => _playTone(
    400,
    400,
    voice: 'Samantha',
    message: 'Success!',
  ); // Tief, länger

  // Info-Ton 2-Ton-Folge
  static Future<void> playInfoTone() async {
    if (Platform.isMacOS)
      await _playTone(600, 150, voice: 'Zarvox', message: 'Information');
    else {
      await _playTone(600, 150); // Mittlerer Tone
      await Future.delayed(Duration(milliseconds: 100));
      await _playTone(400, 200); // Tiefer Ton
    }
  }

  // Beliebige Tone-Sequenz abspielen
  static Future<void> playToneSequence(
    List<Map<String, int>> sequence, {
    int gap = 100,
  }) async {
    for (var tone in sequence) {
      final freq = tone['frequency'] ?? 440;
      final duration = tone['duration'] ?? 200;
      await _playTone(freq, duration);
      if (gap > 0) await Future.delayed(Duration(microseconds: gap));
    }
  }
}
