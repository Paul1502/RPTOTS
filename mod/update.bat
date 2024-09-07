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

:: Überprüfe, ob das Verzeichnis ein Git-Repository ist
if not exist .git (
    echo Dieses Verzeichnis ist kein Git-Repository. Initialisiere das Git-Repository...
    git init
    git remote add origin https://github.com/Paul1502/RPTOTS.git
    git pull origin main
    echo Das Git-Repository wurde initialisiert und die neuesten Updates wurden heruntergeladen.
) else (
    echo Git-Repository gefunden. Prüfe auf Updates...
    git fetch origin
    git status
    git status | find "Your branch is up to date" >nul
    if %errorlevel% neq 0 (
        echo Es gibt Updates. Ziehe die neuesten Änderungen...
        git reset --hard origin/main  :: Erzwinge eine Synchronisierung mit der Remote-Branch
        git pull origin main
        echo Das Projekt wurde erfolgreich aktualisiert!
    ) else (
        echo Dein Projekt ist bereits auf dem neuesten Stand.
    )
)

pause
