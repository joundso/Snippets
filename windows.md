# Windows Snippets

- [Windows Snippets](#windows-snippets)
  - [Prevent keyboard layout changes by shortcut (German)](#prevent-keyboard-layout-changes-by-shortcut-german)
  - [Export folder structure as text](#export-folder-structure-as-text)

## Prevent keyboard layout changes by shortcut (German)

1. Windowstaste drücken -> "Eingabeeinstellungen" schreiben und mit Enter bestätigen
2. Unter "Weitere Tastatureinstellungen" auf "Erweiterte Tastatureinstellungen" klicken
3. Unter "Wechseln der Eingabemethode" auf "Sprachleistenoptionen" klicken
4. Den Reiter "Erweiterte Tastatureinstellungen" anklicken
5. "Tastenkombination ändern"
6. "Nicht zugewiesen" und "Nicht zugewiesen" auswählen, mit OK bestätigen

[Source](https://www.gutefrage.net/frage/windows-10-shift--alt-dreaktivieren#answer-308560696)

## Export folder structure as text

1. Open folder from which you want to create the tree in the explorer
2. Type `cmd` in the address-bar of the explorer (which will open the bash inside this folder)
3. Run `tree /a /f > c:\output\tree.txt` to create the tree.

Alternatively:

1. Open the bash (Windows-Key + R) --> `cmd`
2. Run

   ```bash
   tree d:\demo /a /f > d:\output.txt
   ```
