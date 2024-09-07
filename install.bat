@echo off
echo Überprüfe Python-Installation...

:: Überprüfen, ob Python installiert ist
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo Python ist nicht installiert. Bitte installiere Python und versuche es erneut.
    pause
    exit /b
)

echo Überprüfe Pip-Installation...

:: Überprüfen, ob Pip installiert ist
python -m pip --version >nul 2>&1
if %errorlevel% neq 0 (
    echo Pip ist nicht installiert. Versuche Pip zu installieren...
    python -m ensurepip --default-pip
    if %errorlevel% neq 0 (
        echo Pip konnte nicht installiert werden. Bitte installiere Pip manuell und versuche es erneut.
        pause
        exit /b
    )
)

echo Installiere benötigte Python-Bibliotheken...

:: Installiere die notwendigen Bibliotheken
pip install discord.py
pip install aioconsole
pip install colorama

if %errorlevel% neq 0 (
    echo Es gab einen Fehler bei der Installation der Bibliotheken.
    pause
    exit /b
)

echo Alle benötigten Bibliotheken wurden erfolgreich installiert.
pause
