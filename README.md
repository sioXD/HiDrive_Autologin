# HiDrive Autologin

Wenn man die HiDrive App und das Protokoll SMB gleichzeitig nutzt, muss man sich bei jeder Sitzung neu auf SMB anmelden.

Dieses Skript übernimmt den anmelde Prozess und meldet den Nutzer bei jeder neuen Sitzung automatisch an.

## Nutzung

1. Lege die `HiDrive_Autologin.bat` in einem Ordner an der offline zugreifbar ist
2. drücke `Win + R` un gib: `shell:startup` ein.
3. Füge dort eine **Verknüpfung** von `HiDrive_Autologin.bat` ein
4. Um das Skript minimiert zu starten: `Rechtsklick -> Eigenschaften -> Ausführen auf minimiert ändern`

Jetzt startet das Skript bei jedem Hochstarten von dem PC minimiert.
