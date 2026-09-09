```bat
@echo off
setlocal EnableDelayedExpansion
title HUCKOS - Computer Simulator
color 0A
mode con: cols=90 lines=30

:MENU
cls
echo.
echo  ================================================================
echo                 H U C K O S   v2.0
echo                   COMPUTER SIMULATOR
echo  ================================================================
echo.
echo   [1] Calculator
echo   [2] Mini Games
echo   [3] Terminal
echo   [4] System Information
echo   [5] Notes
echo   [6] Random Number Generator
echo   [7] Password Generator
echo   [8] Number Converter
echo   [9] ASCII Art
echo   [10] Dice / Coin
echo   [11] Help
echo   [12] Exit
echo.
set /p "choice=  Select an option: "

if "%choice%"=="1" goto CALCULATOR
if "%choice%"=="2" goto GAMES
if "%choice%"=="3" goto TERMINAL
if "%choice%"=="4" goto SYSINFO
if "%choice%"=="5" goto NOTES
if "%choice%"=="6" goto RANDOM
if "%choice%"=="7" goto PASSWORD
if "%choice%"=="8" goto CONVERTER
if "%choice%"=="9" goto ASCII
if "%choice%"=="10" goto DICE
if "%choice%"=="11" goto HELP
if "%choice%"=="12" exit
goto MENU


:CALCULATOR
cls
echo ================= CALCULATOR =================
echo.
echo Examples:
echo   5+5
echo   100/4
echo   12*8
echo   25-7
echo.
set /p "calc=Enter calculation: "
set /a answer=%calc% 2>nul
echo.
echo Answer: %answer%
echo.
pause
goto MENU


:GAMES
cls
echo ================= MINI GAMES =================
echo.
echo [1] Number Guessing
echo [2] Rock Paper Scissors
echo [3] Dice Battle
echo [4] Trivia
echo [5] Tic-Tac-Toe
echo [6] Back
echo.
set /p "game=Choose a game: "

if "%game%"=="1" goto GUESS
if "%game%"=="2" goto RPS
if "%game%"=="3" goto DICEBATTLE
if "%game%"=="4" goto TRIVIA
if "%game%"=="5" goto TTT
if "%game%"=="6" goto MENU
goto GAMES


:GUESS
cls
set /a target=%random% %% 100 + 1
set /a attempts=0

echo ============== NUMBER GUESSING ==============
echo.
echo I'm thinking of a number from 1 to 100.
echo.

:GUESSLOOP
set /p "guess=Your guess: "
set /a attempts+=1

if %guess%==%target% goto GUESSED

if %guess% LSS %target% (
    echo Too low!
) else (
    echo Too high!
)

goto GUESSLOOP

:GUESSED
echo.
echo CORRECT!
echo You got it in %attempts% attempts!
echo.
pause
goto GAMES


:RPS
cls
set /a score=0
set /a computerScore=0

echo ============ ROCK PAPER SCISSORS ============
echo.
echo First to 3 wins!
echo.

:RPSLOOP
echo.
echo Your score: %score%    Computer: %computerScore%
echo.
echo [1] Rock
echo [2] Paper
echo [3] Scissors
echo [4] Quit
echo.
set /p "rps=Choose: "

if "%rps%"=="4" goto GAMES

set /a computer=%random% %% 3 + 1

if "%computer%"=="1" set computerName=Rock
if "%computer%"=="2" set computerName=Paper
if "%computer%"=="3" set computerName=Scissors

if "%rps%"=="1" set playerName=Rock
if "%rps%"=="2" set playerName=Paper
if "%rps%"=="3" set playerName=Scissors

echo.
echo You: %playerName%
echo Computer: %computerName%
echo.

if "%rps%"=="%computer%" goto RPSTIE

if "%rps%"=="1" if "%computer%"=="3" goto RPSWIN
if "%rps%"=="2" if "%computer%"=="1" goto RPSWIN
if "%rps%"=="3" if "%computer%"=="2" goto RPSWIN

goto RPSLOSE

:RPSTIE
echo TIE!
goto RPSCHECK

:RPSWIN
echo YOU WIN THE ROUND!
set /a score+=1
goto RPSCHECK

:RPSLOSE
echo COMPUTER WINS THE ROUND!
set /a computerScore+=1

:RPSCHECK
if %score% GEQ 3 goto RPSPLAYERWIN
if %computerScore% GEQ 3 goto RPSCOMPUTERWIN

pause
cls
goto RPSLOOP

:RPSPLAYERWIN
echo.
echo =========================
echo YOU WON THE MATCH!
echo =========================
pause
goto GAMES

:RPSCOMPUTERWIN
echo.
echo =========================
echo COMPUTER WON THE MATCH!
echo =========================
pause
goto GAMES


:DICEBATTLE
cls
echo ================ DICE BATTLE ================
echo.
echo You and the computer each roll two dice.
echo Highest total wins!
echo.
pause

set /a d1=%random% %% 6 + 1
set /a d2=%random% %% 6 + 1
set /a c1=%random% %% 6 + 1
set /a c2=%random% %% 6 + 1

set /a playerTotal=d1+d2
set /a computerTotal=c1+c2

cls
echo ================ DICE BATTLE ================
echo.
echo Your dice:     %d1% + %d2% = %playerTotal%
echo Computer dice: %c1% + %c2% = %computerTotal%
echo.

if %playerTotal% GTR %computerTotal% echo YOU WIN!
if %playerTotal% LSS %computerTotal% echo COMPUTER WINS!
if %playerTotal% EQU %computerTotal% echo TIE!

echo.
pause
goto GAMES


:TRIVIA
cls
set /a question=%random% %% 5 + 1
set /a points=0

echo ================== TRIVIA ==================
echo.
echo Answer 5 questions.
echo.

for /l %%Q in (1,1,5) do (
    set /a question=!random! %% 5 + 1

    if !question!==1 (
        echo Q%%Q: What planet is known as the Red Planet?
        echo [1] Venus
        echo [2] Mars
        echo [3] Jupiter
        set /p "answer=Answer: "
        if "!answer!"=="2" set /a points+=1
    )

    if !question!==2 (
        echo Q%%Q: How many sides does a hexagon have?
        echo [1] 5
        echo [2] 6
        echo [3] 8
        set /p "answer=Answer: "
        if "!answer!"=="2" set /a points+=1
    )

    if !question!==3 (
        echo Q%%Q: What is 12 x 12?
        echo [1] 124
        echo [2] 144
        echo [3] 154
        set /p "answer=Answer: "
        if "!answer!"=="2" set /a points+=1
    )

    if !question!==4 (
        echo Q%%Q: Which ocean is the largest?
        echo [1] Atlantic
        echo [2] Indian
        echo [3] Pacific
        set /p "answer=Answer: "
        if "!answer!"=="3" set /a points+=1
    )

    if !question!==5 (
        echo Q%%Q: How many days are in a leap year?
        echo [1] 365
        echo [2] 366
        echo [3] 367
        set /p "answer=Answer: "
        if "!answer!"=="2" set /a points+=1
    )

    echo.
)

echo ================================
echo FINAL SCORE: %points% / 5
echo ================================
pause
goto GAMES


:TTT
cls
echo ================= TIC-TAC-TOE =================
echo.
echo This is a simple text version.
echo.
echo 1 | 2 | 3
echo ---+---+---
echo 4 | 5 | 6
echo ---+---+---
echo 7 | 8 | 9
echo.
echo You are X.
echo Computer is O.
echo.
pause

echo Tic-Tac-Toe mode is ready for expansion!
echo.
echo You can use the other games for now.
pause
goto GAMES


:TERMINAL
cls
echo ================= HUCKOS TERMINAL =================
echo Type HELP for commands.
echo Type EXIT to return.
echo.

:TERMINALLOOP
set /p "cmd=> "

if /i "%cmd%"=="help" goto TERMINALHELP
if /i "%cmd%"=="clear" cls & goto TERMINAL
if /i "%cmd%"=="exit" goto MENU
if /i "%cmd%"=="date" date /t & goto TERMINALLOOP
if /i "%cmd%"=="time" time /t & goto TERMINALLOOP
if /i "%cmd%"=="calc" goto CALCULATOR
if /i "%cmd%"=="games" goto GAMES
if /i "%cmd%"=="sysinfo" goto SYSINFO
if /i "%cmd%"=="random" goto RANDOM
if /i "%cmd%"=="roll" goto DICE
if /i "%cmd%"=="coin" goto COIN
if /i "%cmd%"=="ascii" goto ASCII
if /i "%cmd%"=="about" goto ABOUT

echo Command not found: %cmd%
goto TERMINALLOOP


:TERMINALHELP
echo.
echo HELP       - Show this list
echo CLEAR      - Clear screen
echo DATE       - Show date
echo TIME       - Show time
echo CALC       - Calculator
echo GAMES      - Mini games
echo SYSINFO    - System information
echo RANDOM     - Random number
echo ROLL       - Roll dice
echo COIN       - Flip coin
echo ASCII      - ASCII art
echo ABOUT      - About HUCKOS
echo EXIT       - Main menu
echo.
goto TERMINALLOOP


:SYSINFO
cls
echo ================= SYSTEM INFO =================
echo.
echo Computer Name: %COMPUTERNAME%
echo User: %USERNAME%
echo OS:
ver
echo.
echo Processor:
echo %PROCESSOR_IDENTIFIER%
echo.
echo Number of CPU cores: %NUMBER_OF_PROCESSORS%
echo.
echo HUCKOS Status: ONLINE
echo HUCKOS Version: 2.0
echo.
pause
goto MENU


:NOTES
cls
echo ================= NOTES =================
echo.
echo [1] Write a note
echo [2] Read notes
echo [3] Delete notes
echo [4] Back
echo.
set /p "notechoice=Choose: "

if "%notechoice%"=="1" goto WRITENOTE
if "%notechoice%"=="2" goto READNOTE
if "%notechoice%"=="3" goto DELETENOTE
if "%notechoice%"=="4" goto MENU
goto NOTES


:WRITENOTE
cls
echo Type your note.
echo Type END on a new line when finished.
echo.

set "note="
:NOTELOOP
set /p "line="
if /i "%line%"=="END" goto SAVENOTE
set "note=!note!!line!^&echo."
goto NOTELOOP

:SAVENOTE
(
echo !note!
) > notes.txt

echo.
echo Note saved!
pause
goto NOTES


:READNOTE
cls
echo ================= YOUR NOTES =================
echo.

if not exist notes.txt (
    echo No notes found.
) else (
    type notes.txt
)

echo.
pause
goto NOTES


:DELETENOTE
if exist notes.txt del notes.txt
echo Notes deleted.
pause
goto NOTES


:RANDOM
cls
echo ============ RANDOM NUMBER GENERATOR ============
echo.
set /p "min=Minimum number: "
set /p "max=Maximum number: "

set /a range=max-min+1
set /a result=%random% %% range + min

echo.
echo Random number: %result%
echo.
pause
goto MENU


:PASSWORD
cls
echo ============== PASSWORD GENERATOR ==============
echo.
echo This creates a random sample password.
echo.
set "chars=ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"
set "password="

for /l %%A in (1,1,12) do (
    set /a index=!random! %% 62
    for %%B in (!index!) do set "password=!password!!chars:~%%B,1!"
)

echo Generated password:
echo.
echo %password%
echo.
pause
goto MENU


:CONVERTER
cls
echo ============== NUMBER CONVERTER ==============
echo.
echo [1] Decimal to Binary
echo [2] Decimal to Hex
echo [3] Back
echo.
set /p "convert=Choose: "

if "%convert%"=="3" goto MENU

if "%convert%"=="1" (
    set /p "num=Enter decimal number: "
    call :DEC2BIN %num%
    echo Binary: %BIN%
    pause
    goto CONVERTER
)

if "%convert%"=="2" (
    set /p "num=Enter decimal number: "
    set /a hex=%num%
    echo Hexadecimal: 0x%hex%
    pause
    goto CONVERTER
)

goto CONVERTER


:DEC2BIN
set "BIN="
set /a n=%1

if %n%==0 (
    set "BIN=0"
    exit /b
)

:BINLOOP
set /a bit=n %% 2
set "BIN=%bit%%BIN%"
set /a n=n / 2
if %n% GTR 0 goto BINLOOP
exit /b


:ASCII
cls
echo.
echo       _   _ _   _  ____ _  ______
echo      ^| ^\ ^| ^| ^\ ^| ^|/ ___^| ^|/ / ___^|
echo      ^|  ^\^| ^|  ^\^| ^| ^\___ ^| ' / ^\___ \
echo      ^| ^|^\  ^| ^|^\  ^|  ___^| . ^\  ___^) ^|
echo      ^|_^| ^\_^|_^| ^\_^|_^|    ^|_^|\_\____^/
echo.
echo              H U C K O S
echo.
pause
goto MENU


:DICE
cls
echo ================= DICE =================
echo.
set /p "sides=How many sides should the dice have? "

set /a roll=%random% %% sides + 1

echo.
echo You rolled: %roll%
echo.
pause
goto MENU


:COIN
cls
echo ================= COIN FLIP =================
echo.
set /a coin=%random% %% 2

if %coin%==0 (
    echo.
    echo          HEADS
) else (
    echo.
    echo          TAILS
)

echo.
pause
goto MENU


:ABOUT
cls
echo ================= ABOUT HUCKOS =================
echo.
echo HUCKOS Computer Simulator
echo Version 2.0
echo.
echo Created in Windows Batch.
echo.
echo Features:
echo - Calculator
echo - Terminal
echo - Mini Games
echo - Random Tools
echo - Notes
echo - Password Generator
echo - Number Converter
echo - System Information
echo - ASCII Art
echo.
pause
goto TERMINALLOOP


:HELP
cls
echo ================= HUCKOS HELP =================
echo.
echo HUCKOS is a Batch-based computer simulator.
echo.
echo Use the number menu to select programs.
echo.
echo The Terminal has its own commands.
echo.
echo Have fun!
echo.
pause
goto MENU
```
