@echo off
echo Überprüfe, ob Git installiert ist...

:: Überprüfen, ob Git installiert ist
git --version >nul 2>&1
if %errorlevel% neq 0 (
    echo Git ist nicht installiert. Bitte installiere Git und versuche es erneut.
    pause
    exit /b
)

echo Überprüfe auf Updates von GitHub...

:: Wechsle in das Verzeichnis, in dem die .bat-Datei liegt (aktuelles Verzeichnis)
cd /d "%~dp0"

:: Hole die neuesten Änderungen von GitHub
git fetch origin

:: Überprüfen, ob es Updates gibt
git status | find "Your branch is up to date" >nul
if %errorlevel% neq 0 (
    echo Es gibt Updates. Ziehe die neuesten Änderungen...
    git pull origin main
    echo Das Projekt wurde erfolgreich aktualisiert!
) else (
    echo Dein Projekt ist bereits auf dem neuesten Stand.
)

pause
