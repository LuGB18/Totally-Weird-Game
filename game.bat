@echo off
title Totally Weird Game V3.0
color a
set /a gold= 0
set  weapon= Stick
set  /a weaponat= 20
set  playername= NONE 
set  savenm= NONE
set /a health= 100
set /a potion= 0
cls
goto mainmenu

:mainmenu
echo.
echo.
echo.
echo Loaded Save File:%savenm%
echo ---------------------------
echo -   Totally Weird Game    -
echo -        Main Menu        -
ECHO ---------------------------
echo -                         -
echo - 1- Start                -
echo - 2- Load Save            -
echo - 3- See Stats of Save    -
echo - 4- Continue             -
echo - 5- Exit                 -
echo -                         -
echo ---------------------------
echo.
echo.
echo.
set /p mnop= Type an Option: 
cls

if %mnop% equ 1 goto start 
if %mnop% equ 2 goto load 
if %mnop% equ 3 goto shst 
if %mnop% equ 4 goto continue 
if %mnop% equ 5 goto exit 
echo Ops! Look's like you typed wrong!
pause>nul
goto mainmenu

:exit
exit

:load
cls
set /p savenm= Digite o Nome do Save: 
if exist %savenm%.sv goto loadsave
echo Sorry but the name of the Save Dosen't Match or it Dosent Exist!
echo.
echo.
pause
cls
set savenm= NONE
goto mainmenu

:loadsave
cls
<%savenm%.sv (
set /p gold=
set /p weapon=
set /p playername=
set /p savenm=
set /p health=
set /p weaponat=
set /p potion=
)
echo Save Loaded!
echo.
echo.
pause
cls
goto mainmenu

:shst
cls
echo -Save Stats:---------------------------------------
echo -                                      
echo - Save Name: %savenm%             
echo - Character's Name: %playername%            
echo - Gold's: %gold%                         
echo - Weapon: %weapon%
echo - Health: %health%
echo - Number of potions: %potion%                     
echo -                                      
echo ---------------------------------------------------
echo.
echo.
echo.
pause
cls
goto mainmenu 

:start
echo Let's start with an new save name.
echo.
set /p savenm= Type the new save Name:  
cls
echo Now Lets put the Character's name!
echo. 
set /p playername= Put the Character Name: 
cls
set gold= 0
set weapon= Stick
set /a weaponat= 20
set /a potion= 0
cls
(
echo %gold%
echo %weapon%
echo %playername%
echo %savenm%
echo %health%
echo %weaponat%
echo %potion%
)> %savenm%.sv
cls
echo Save Criado!
echo.
pause
cls
goto continue

:continue
echo -Game------------------------
echo - 1- Find an Battle         -
echo - 2- Go to the Item Shop    -
echo -----------------------------
echo - 3- Main Menu              -
echo -----------------------------
echo.
echo.
set /p op= Type one of the Options: 
cls

if %op% equ 1 goto fbattle
if %op% equ 2 goto shop
if %op% equ 3 goto mainmenu

:shop
(
echo %gold%
echo %weapon%
echo %playername%
echo %savenm%
echo %health%
echo %weaponat%
echo %potion%
)> shop.sv
start shop.bat
cls
exit

:fbattle
set /a ch=%random% %%2
if %ch% equ 1 goto btsettings
if %ch% equ 2 goto bsbtsettings
cls

:btsettings
set /a enhelth=%random% %%50
set /a engold= %random% %%45
cls
goto battle

:bsbtsettings
cls
set /a bsheallth= 200
set /a bsgold= %random% %%100
cls
goto bsbattle

:bsbattle
set /a boption= 0
set /a bsattack=%random% %%70
set /a btweaponat=%random% %%%weaponat%
cls
echo Boss Health: %bsheallth%
echo Your Health: %health%
echo --------------------------
echo -      1- Attack!        -
echo -      2- Run Away!      -
echo -      3- Use potion     -
echo --------------------------
echo.
echo.
set /p bsbtop=Type an Option: 
cls

if %bsbtop% == 1 goto bsatack
if %bsbtop% == 2 goto coward
if %bsbtop% == 3 goto askpotion

:askpotion
if %potion% == 1 goto usepotion
else (
    echo Oh oh! you dont have any Potion!
pause>nul
cls
if %boption% == 1 goto battle
if %boption% == 0 goto bsbattle

)

:usepotion
set /a uspotion= 30
set /a potion= 0
set /a health= %health%+%uspotion%
cls
if %boption% == 1 goto battle
if %boption% == 0 goto bsbattle

:bsatack
set /a health= %health%-%bsattack%
set /a bshealth= %bsheallth%-%btweaponat%
cls
echo With Your %weapon% You Removed %btweaponat% of the Boss Health!
echo The Boss Removed %bsattack% from your Health!
echo.
echo.
pause
cls
if %bsheallth% leq 0 goto winbt
if %health% leq 0 goto btlose
cls
goto bsbattle


:battle
set /a boption = 1
set /a enattack=%random% %%40
set /a btweaponat=%random% %%%weaponat%
cls
echo Enemy's Health: %enhelth%
echo Your Health: %health%
echo -------------------------
echo -      1- Attack!       -
echo -      2- Run Away!     -
echo -------------------------
echo.
echo.
set /p btop= Type one of the Options: 
cls

if %btop% == 1 goto attack
if %btop% == 2 goto coward
if %btop% == 3 goto askpotion

:attack
set /a health= %health%-%enattack%
set /a enhelth= %enhelth%-%btweaponat%
cls
echo With Your %weapon% You Removed %btweaponat% of the Enemy's Health!
echo The Enemy Removed %enattack% from your Health!
echo.
echo.
pause
cls
if %enhelth% leq 0 goto winbt
if %health% leq 0 goto btlose
cls
goto battle

:winbt
echo You Defeated him!, and you winned %engold% of GOLD's!
echo.
echo.
pause
cls
set /a upgold= %engold%+%gold%
set /a gold=%upgold%
set /a health= 100
(
echo %gold%
echo %weapon%
echo %playername%
echo %savenm%
echo %health%
echo %weaponat%
echo %potion%
)> %savenm%.sv
goto continue

:coward
echo You Ran Away like an Coward!
echo.
echo.
pause
cls
set /a health= 100
(
echo %gold%
echo %weapon%
echo %playername%
echo %savenm%
echo %health%
echo %weaponat%
echo %potion%
)> %savenm%.sv
goto continue

:btlose
set /a logold=%random% %%20
echo.
echo.
echo Voce Morreu! You Lost %logold% of GOLD's.
echo.
echo.
echo.
pause>nul
set /a health= 100
(
echo %gold%
echo %weapon%
echo %playername%
echo %savenm%
echo %health%
echo %weaponat%
echo %potion%
)> %savenm%.sv
cls
goto continue