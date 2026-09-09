@echo off
setlocal EnableDelayedExpansion
title HUCKOS v2.0
color 0A

:MENU
cls
echo ==================================================
echo                    H U C K O S
echo                 Computer OS v2.0
echo ==================================================
echo.
echo [1] Calculator
echo [2] Mini Games
echo [3] Terminal
echo [4] System Information
echo [5] Notes
echo [6] Random Number Generator
echo [7] Password Generator
echo [8] Number Converter
echo [9] ASCII Art
echo [10] Dice / Coin
echo [11] Help
echo [12] Exit
echo.
set /p "choice=HUCKOS^> "

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
if "%choice%"=="12" goto EXIT

echo.
echo Invalid choice.
pause
goto MENU


:: ==================================================
:: CALCULATOR
:: ==================================================

:CALCULATOR
cls
echo ================= CALCULATOR =================
echo.
echo Examples:
echo 5+5
echo 10*4
echo 100/5
echo 2^8
echo.
set /p "calc=Enter calculation: "

set /a answer=%calc% 2>nul

echo.
echo Answer: %answer%
echo.
pause
goto MENU


:: ==================================================
:: MINI GAMES
:: ==================================================

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


:: ==================================================
:: NUMBER GUESSING
:: ==================================================

:GUESS
cls
echo ============== NUMBER GUESSING ==============
echo.
set /a target=%random% %% 100 + 1
set /a attempts=0

echo I picked a number from 1 to 100.
echo Try to guess it!
echo.

:GUESSLOOP
set /p "guess=Guess: "

set /a attempts+=1 2>nul

if "%guess%"=="" goto GUESSLOOP

if %guess% LSS %target% (
    echo Too low!
    goto GUESSLOOP
)

if %guess% GTR %target% (
    echo Too high!
    goto GUESSLOOP
)

echo.
echo YOU GOT IT!
echo The number was %target%.
echo Attempts: %attempts%
echo.
pause
goto GAMES


:: ==================================================
:: ROCK PAPER SCISSORS
:: ==================================================

:RPS
cls
echo =========== ROCK PAPER SCISSORS ===========
echo.
echo [1] Rock
echo [2] Paper
echo [3] Scissors
echo [4] Back
echo.

set /p "rps=Choose: "

if "%rps%"=="4" goto GAMES

if "%rps%"=="1" set "player=Rock"
if "%rps%"=="2" set "player=Paper"
if "%rps%"=="3" set "player=Scissors"

if not defined player goto RPS

set /a computer=%random% %% 3 + 1

if "%computer%"=="1" set "cpu=Rock"
if "%computer%"=="2" set "cpu=Paper"
if "%computer%"=="3" set "cpu=Scissors"

echo.
echo You: %player%
echo Computer: %cpu%
echo.

if "%rps%"=="1" if "%computer%"=="3" goto RPSWIN
if "%rps%"=="2" if "%computer%"=="1" goto RPSWIN
if "%rps%"=="3" if "%computer%"=="2" goto RPSWIN

if "%rps%"=="1" if "%computer%"=="1" goto RPSTIE
if "%rps%"=="2" if "%computer%"=="2" goto RPSTIE
if "%rps%"=="3" if "%computer%"=="3" goto RPSTIE

echo Computer wins!
pause
set "player="
goto RPS

:RPSWIN
echo YOU WIN!
pause
set "player="
goto RPS

:RPSTIE
echo TIE!
pause
set "player="
goto RPS


:: ==================================================
:: DICE BATTLE
:: ==================================================

:DICEBATTLE
cls
echo ================ DICE BATTLE ================
echo.
echo You roll against the computer.
echo.
pause

set /a playerroll=%random% %% 6 + 1
set /a computerroll=%random% %% 6 + 1

echo You rolled: %playerroll%
echo Computer rolled: %computerroll%
echo.

if %playerroll% GTR %computerroll% (
    echo YOU WIN!
    pause
    goto GAMES
)

if %playerroll% LSS %computerroll% (
    echo COMPUTER WINS!
    pause
    goto GAMES
)

echo TIE!
pause
goto GAMES


:: ==================================================
:: TRIVIA
:: ==================================================

:TRIVIA
cls
echo ================= TRIVIA =================
echo.
set /a score=0

echo Question 1:
echo What planet is known as the Red Planet?
echo [A] Earth
echo [B] Mars
echo [C] Jupiter
echo [D] Venus
set /p "answer=Answer: "

if /i "%answer%"=="B" set /a score+=1

cls
echo Question 2:
echo How many sides does a hexagon have?
echo [A] 4
echo [B] 5
echo [C] 6
echo [D] 8
set /p "answer=Answer: "

if /i "%answer%"=="C" set /a score+=1

cls
echo Question 3:
echo What is the largest ocean on Earth?
echo [A] Atlantic
echo [B] Pacific
echo [C] Indian
echo [D] Arctic
set /p "answer=Answer: "

if /i "%answer%"=="B" set /a score+=1

cls
echo Question 4:
echo Which animal is known as the King of the Jungle?
echo [A] Tiger
echo [B] Elephant
echo [C] Lion
echo [D] Bear
set /p "answer=Answer: "

if /i "%answer%"=="C" set /a score+=1

cls
echo Question 5:
echo How many continents are there?
echo [A] 5
echo [B] 6
echo [C] 7
echo [D] 8
set /p "answer=Answer: "

if /i "%answer%"=="C" set /a score+=1

cls
echo ================= RESULTS =================
echo.
echo Your score: %score% / 5
echo.

if %score%==5 echo PERFECT SCORE!
if %score%==4 echo Great job!
if %score%==3 echo Not bad!
if %score%==2 echo Keep practicing!
if %score% LEQ 1 echo You can do better!

echo.
pause
goto GAMES


:: ==================================================
:: TIC TAC TOE
:: ==================================================

:TTT
cls
echo =============== TIC-TAC-TOE ===============
echo.
echo This version is currently a simple demo.
echo.
echo 1   2   3
echo ---+---+---
echo 4   5   6
echo ---+---+---
echo 7   8   9
echo.
echo Full playable Tic-Tac-Toe coming soon!
echo.
pause
goto GAMES


:: ==================================================
:: TERMINAL
:: ==================================================

:TERMINAL
cls
echo ================= HUCKOS TERMINAL =================
echo.
echo Type HELP for available commands.
echo Type EXIT to return to HUCKOS.
echo.

:TERMINALLOOP
set /p "cmd=HUCKOS^> "

if /i "%cmd%"=="HELP" goto TERMINALHELP
if /i "%cmd%"=="CLEAR" cls & goto TERMINAL
if /i "%cmd%"=="EXIT" goto MENU
if /i "%cmd%"=="DATE" date /t & goto TERMINALLOOP
if /i "%cmd%"=="TIME" time /t & goto TERMINALLOOP
if /i "%cmd%"=="CALC" goto CALCULATOR
if /i "%cmd%"=="GAMES" goto GAMES
if /i "%cmd%"=="SYSINFO" goto SYSINFO
if /i "%cmd%"=="RANDOM" goto RANDOM
if /i "%cmd%"=="ROLL" goto DICE
if /i "%cmd%"=="COIN" goto COIN
if /i "%cmd%"=="ASCII" goto ASCII
if /i "%cmd%"=="ABOUT" goto ABOUT

echo '%cmd%' is not recognized as a HUCKOS command.
goto TERMINALLOOP


:TERMINALHELP
echo.
echo Available commands:
echo.
echo HELP     - Show this help
echo CLEAR    - Clear the screen
echo DATE     - Show date
echo TIME     - Show time
echo CALC     - Calculator
echo GAMES    - Mini games
echo SYSINFO  - System information
echo RANDOM   - Random number
echo ROLL     - Roll a dice
echo COIN     - Flip a coin
echo ASCII    - ASCII art
echo ABOUT    - About HUCKOS
echo EXIT     - Return to menu
echo.
goto TERMINALLOOP


:: ==================================================
:: SYSTEM INFO
:: ==================================================

:SYSINFO
cls
echo ============== SYSTEM INFORMATION ==============
echo.
echo Computer Name: %COMPUTERNAME%
echo Username: %USERNAME%
echo OS: %OS%
echo Processor: %PROCESSOR_IDENTIFIER%
echo Number of Processors: %NUMBER_OF_PROCESSORS%
echo Architecture: %PROCESSOR_ARCHITECTURE%
echo.
pause
goto MENU


:: ==================================================
:: NOTES
:: ==================================================

:NOTES
cls
echo ================= NOTES =================
echo.
echo [1] Write Note
echo [2] Read Notes
echo [3] Delete Notes
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
echo ================= WRITE NOTE =================
echo.
echo Type your note.
echo Type END on a new line when finished.
echo.

if exist notes.txt del notes.txt

:NOTELOOP
set "line="
set /p "line="

if /i "%line%"=="END" goto SAVENOTE

>>notes.txt echo(%line%
goto NOTELOOP


:SAVENOTE
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
if exist notes.txt (
    del notes.txt
    echo.
    echo Notes deleted.
) else (
    echo.
    echo No notes found.
)

pause
goto NOTES


:: ==================================================
:: RANDOM NUMBER
:: ==================================================

:RANDOM
cls
echo ============= RANDOM NUMBER GENERATOR =============
echo.
set /p "min=Minimum number: "
set /p "max=Maximum number: "

set /a range=%max%-%min%+1
set /a randomnum=%random% %% range + %min%

echo.
echo Random number: %randomnum%
echo.
pause
goto MENU


:: ==================================================
:: PASSWORD GENERATOR
:: ==================================================

:PASSWORD
cls
echo ============== PASSWORD GENERATOR ==============
echo.
echo Generating a random sample password...
echo.

set "chars=ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"
set "password="

for /l %%A in (1,1,12) do (
    set /a index=!random! %% 62
    for %%B in (!index!) do set "password=!password!!chars:~%%B,1!"
)

echo Password:
echo.
echo !password!
echo.
echo Note: This is a simple random generator,
echo not a cryptographically secure password tool.
echo.
pause
goto MENU


:: ==================================================
:: NUMBER CONVERTER
:: ==================================================

:CONVERTER
cls
echo ================ NUMBER CONVERTER ================
echo.
echo [1] Decimal to Binary
echo [2] Decimal to Hex
echo [3] Back
echo.
set /p "convert=Choose: "

if "%convert%"=="1" goto BINARY
if "%convert%"=="2" goto HEX
if "%convert%"=="3" goto MENU

goto CONVERTER


:BINARY
cls
echo ============== DECIMAL TO BINARY ==============
echo.
set /p "num=Enter decimal number: "

echo.
echo Binary:
call :DEC2BIN %num%
echo.
pause
goto CONVERTER


:DEC2BIN
set "bin="
set /a n=%1

if %n%==0 (
    echo 0
    exit /b
)

:BINLOOP
set /a remainder=n %% 2
set "bin=%remainder%%bin%"
set /a n=n / 2

if %n% GTR 0 goto BINLOOP

echo %bin%
exit /b


:HEX
cls
echo ================ DECIMAL TO HEX ================
echo.
set /p "num=Enter decimal number: "

set /a hex=%num%

echo.
echo Hexadecimal: 0x%hex%
echo.
echo Note: CMD does not directly convert decimal
echo to hexadecimal with SET /A.
echo.
pause
goto CONVERTER


:: ==================================================
:: ASCII ART
:: ==================================================

:ASCII
cls
echo.
echo  H   H  U   U   CCCC  K  K   OOO   SSSS
echo  H   H  U   U  C      K K   O   O  S
echo  HHHHH  U   U  C      KK    O   O  SSSS
echo  H   H  U   U  C      K K   O   O     S
echo  H   H   UUU    CCCC  K  K   OOO   SSSS
echo.
echo              H U C K O S
echo.
echo              COMPUTER OS
echo.
pause
goto MENU


:: ==================================================
:: DICE / COIN
:: ==================================================

:DICE
cls
echo ================= DICE =================
echo.
set /a roll=%random% %% 6 + 1
echo You rolled a %roll%!
echo.
pause
goto MENU


:COIN
cls
echo ================= COIN =================
echo.
set /a coin=%random% %% 2

if %coin%==0 (
    echo HEADS!
) else (
    echo TAILS!
)

echo.
pause
goto MENU


:: ==================================================
:: HELP
:: ==================================================

:HELP
cls
echo ================= HUCKOS HELP =================
echo.
echo HUCKOS is a Windows Batch computer simulator.
echo.
echo Main Features:
echo.
echo 1. Calculator
echo    Perform basic calculations.
echo.
echo 2. Mini Games
echo    Play several simple games.
echo.
echo 3. Terminal
echo    Use simulated HUCKOS commands.
echo.
echo 4. System Information
echo    View basic computer information.
echo.
echo 5. Notes
echo    Write, read, and delete notes.
echo.
echo 6. Random Number Generator
echo    Generate random numbers.
echo.
echo 7. Password Generator
echo    Generate a random sample password.
echo.
echo 8. Number Converter
echo    Convert decimal numbers to binary.
echo.
echo 9. ASCII Art
echo    Display HUCKOS ASCII art.
echo.
echo 10. Dice / Coin
echo     Roll dice or flip a coin.
echo.
pause
goto MENU


:: ==================================================
:: ABOUT
:: ==================================================

:ABOUT
cls
echo ================= ABOUT HUCKOS =================
echo.
echo HUCKOS
echo Version 2.0
echo.
echo A computer operating-system simulator
echo made entirely with Windows Batch.
echo.
echo Created by Huck.
echo.
pause
goto TERMINAL


:: ==================================================
:: EXIT
:: ==================================================

:EXIT
cls
echo.
echo ==========================================
echo             SHUTTING DOWN HUCKOS
echo ==========================================
echo.
echo Thanks for using HUCKOS!
echo.
timeout /t 2 >nul
exit
