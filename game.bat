@echo off
title GAME
color a
set /a gold= 0
set  weapon= Stick
set  playername= NONE 
set  savenm= NONE
cls
goto mainmenu

:mainmenu
echo.
echo.
echo.
echo Loaded Save:%savenm%
echo ---------------------------
echo -        Main Menu        -
ECHO ---------------------------
echo -                         -
echo - 1- Start                -
echo - 2- Load Save File       -
echo - 3- Show Save Stats      -
echo - 4- Continue Save        -
echo - 5- Exit Game            -
echo -                         -
echo ---------------------------
echo.
echo.
echo.
set /p mnop= TYPE THE OPTION: 
cls

if %mnop% equ 1 goto start 
if %mnop% equ 2 goto load 
if %mnop% equ 3 goto shst 
if %mnop% equ 4 goto continue 
if %mnio% equ 5 goto exit 
echo ops! looks like you typed wrong!

:exit
exit

:load
cls
set /p savenm= type the save file name: 
if exist %savenm%.sv goto loadsave
echo sorry but the save name may be incorrect or the save dosent't exist!
echo.
echo.
pause
cls
goto mainmenu

:loadsave
cls
<%savenm%.sv (
set /p gold=
set /p weapon=
set /p playername=
)
echo Loaded!
echo.
echo.
pause
cls
goto mainmenu

:shst
cls
echo -Save Stats:---------------------------------------
echo -                                      
echo - Save File Name: %savenm%             
echo - Player Name: %playername%            
echo - Gold: %gold%                         
echo - Weapon: %weapon%                     
echo -                                      
echo ---------------------------------------------------
echo.
echo.
echo.
pause
cls
goto mainmenu 

:start
echo lets start labeling an save.
echo.
set /p savenm= type the name of the save: 
cls
echo now lets create our Player's Name!
echo.
set /p playername= type the player's name: 
cls
set gold= 0
set weapon= Stick
(
echo %gold%
echo %weapon%
echo %playername%
)> %savenm%.sv
cls
echo Save Created!
echo.
pause
cls
goto continue

:continue
echo -GAME------------------------
echo - 1- Find an Battle         -
echo - 2- Go to shop             -
echo -----------------------------
echo - 3- Main Menu              -
echo -----------------------------
echo.
echo.
set /p op= type the option: 
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
)> shop.sv
start shop.bat
cls
exit

:fbattle
set /a ch= 1
if %ch% equ 1 goto btsettings
cls
echo You Looked everywhere but still you couldent find anyone.
echo.
pause
cls
goto continue

:btsettings
set /a enhelth=%random% %%50
set /a engold= %random% %%45
cls
goto battle

:battle
set /a weaponat=%random% %%50
cls
echo enemy's Health: %enhelth%
echo -------------------------
echo -      1- Attack!       -
echo -      2- Run Away!     -
echo -------------------------
echo.
echo.
set /p btop= Type an Option: 
cls

if %btop% equ 1 goto attack
if %btop% equ 2 goto coward


:attack
cls
echo with your %weapon% you removed %weaponat% from the enemy's Health!
echo.
echo.
pause
cls
set /a enhelth= %enhelth%-%weaponat%
if %enhelth% leq 0 goto winbt
cls
goto battle

:winbt
echo You Defeated the Enemy, and you winned %engold% gold's!
echo.
echo.
pause
cls
set /a upgold= %engold%+%gold%
set /a gold=%upgold%
goto continue

:coward
echo you ran away like an coward, and the enemy lauthed at you!
echo.
echo.
pause
cls
goto continue