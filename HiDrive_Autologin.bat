@echo off

REM Temporäre Datei für die Ausgabe von net use
set TempFile=%TEMP%\netuse_output.txt

REM Ausgabe von net use speichern
net use > "%TempFile%"

REM Variablen initialisieren
set "Netzwerkname="
set "Netzwerkpfad="


REM Datei zeilenweise analysieren
for /f "usebackq delims=" %%A in ("%TempFile%") do (
    if "%%A" neq "" (
        echo %%A | find ":" >nul
        if not errorlevel 1 (
            REM Laufwerksbuchstaben und Pfad getrennt verarbeiten
            set "count="
            for %%B in (%%A) do (
                echo %%B | find ":" >nul
                if not errorlevel 1 (
                    set "Netzwerkname=%%B"
                    set "count=1"
                ) else if defined count (
                    set "Netzwerkpfad=%%B"
                )
            ) 
        )
    )
)

REM Zusätzliche Leerzeichen um Netzwerkpfad entfernen
set "Netzwerkpfad=%Netzwerkpfad: =%"

REM Temporäre Datei löschen
del "%TempFile%"

REM Ergebnisse prüfen
if defined Netzwerkname (
    echo Gefundenes Laufwerk: %Netzwerkname%
    echo Gefundener Pfad: %Netzwerkpfad%
    REM Verbindung erneut herstellen
    net use %Netzwerkname% "%Netzwerkpfad%"
) else (
    echo Kein verbundenes Netzlaufwerk gefunden.
)
