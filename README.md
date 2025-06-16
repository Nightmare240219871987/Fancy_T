# Fancy_T

## Zielsetzung der Bibliothek

* Die Bibliothek sollte Entwicklern das Leben erleichtern, indem sie:
* Farben (Foreground, Background)
* Text-Stile (Bold, Underline, Italic usw.)
* Cursor-Bewegung & Steuerung
* Bildschirm- und Zeilenerasen
* Ton/Audio im Terminal (z. B. BEL)
* Alternative Buffer-/Screen-Funktionen
* Tastatureingaben abfangen / Umleiten
* vereinfacht und typsicher zur Verfügung stellt.

### Strukturidee

```bash
Terminal.write("Hallo Welt",
                style: TextStyle(
                    color: Color.red,
                    bgColor: Color.black,
                    bold: true,));
```

oder noch einfacher:

```Bash
Terminal.red("Fehlermeldung!", bold: true);
Terminal.green("Alles gut!");
````

### Farben & Stil

**Unterstützung für:**

* Standardfarben (Color.red, Color.blue)
* Helle Farben (Color.brightRed)
* 256-Farbenmodus (Color.from256(196))
* Truecolor RGB (Color.rgb(255, 100, 0))

**Beispiel-API:**

```bash
Terminal.style("Wichtig!",
                fg: Color.red,
                bg: Color.white,
                styles: [Style.bold, Style.underline]);
```

Intern wird dann z.B. **\x1b[1;4;31;47mWichtig!\x1b[0m** generiert.

### Cursor-Steuerung

Methoden zum Bewegen des Cursors:

```bash
Cursor.moveTo(x: 10, y: 5);
Cursor.up(2);
Cursor.down(3);
Cursor.hide();
Cursor.show();
//Speichern / Laden der Cursorposition:
Cursor.save(); // DEC-Syntax ESC 7
Cursor.restore(); // ESC 8
```

### Bildschirmoperationen

```bash
Screen.clear(); // ESC[2J
Screen.clearLine(); // ESC[K
Screen.setCursorVisibility(false);
```

### Töne / BEL (Bell)

Simples Feature für akustische Signale

```bash
Terminal.beep(); // \x07 oder \a
```

## Alternative Puffer / Fullscreen Modi

Für Anwendungen wie Menüs oder Texteditoren:

```bash
Screen.enterAlternateBuffer();
Screen.leaveAlternateBuffer();
```

Tastaturabfragen / Eingabe ohne Enter

```bash
String key = Console.readKey(); // z. B. 'ESC', 'UP', 'q'
```

>Dafür müssten wir ggf. Raw Mode aktivieren (stdin.disableLineMode).

### Kombinationen / Abstraktionen

Zum Beispiel ein "ProgressDialog" oder "Spinner":

```bash
var spinner = Spinner(text: "Lade Daten...");
spinner.start();
await Future.delayed(Duration(seconds: 3));
spinner.stop();
```

Oder ein "Menüsystem":

```bash
var menu = Menu(items: ["Start", "Einstellungen", "Beenden"]);
int selectedIndex = await menu.show();
```

Ich denke damit haben wir dann erstmal aussreichend zu tun.
