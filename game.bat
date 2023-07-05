@echo off
title Totally Weird Game V2.5
color a
set /a gold= 0
set  weapon= Stick
set  /a weaponat= 20
set  playername= NONE 
set  savenm= NONE
set /a health= 100
cls
goto mainmenu

:mainmenu
echo.
echo.
echo.
echo Loaded Save:%savenm%
echo ---------------------------
echo -   Totally Weird Game    -
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
if %mnop% equ 5 goto exit 
echo ops! looks like you typed wrong!
pause>nul
goto mainmenu

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
echo - Health: %health%                     
echo -                                      
echo ---------------------------------------------------
echo.
echo.
echo.
pause
cls
goto mainmenu 

:start
echo Lets start puting an Name on the save.
echo.
set /p savenm= type the name of the save: 
cls
echo Now lets create our Character's Name!
echo.
set /p playername= Type the Character's name: 
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
echo %health%
echo %weaponat%
)> shop.sv
start shop.bat
cls
exit

:fbattle
set /a ch= 1
if %ch% equ 1 goto btsettings
cls

:btsettings
set /a enhelth=%random% %%50
set /a engold= %random% %%45
cls
goto battle

:battle
set /a enattack=%random% %%40
set /a btweaponat=%random% %%%weaponat%
cls
echo Enemy's Health: %enhelth%
echo Your's Health: %health%
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
set /a health= %health%-%enattack%
set /a enhelth= %enhelth%-%btweaponat%
cls
echo With your %weapon% you removed %btweaponat% from the enemy's Health!
echo The Enemy removed %enattack% from your health!
echo.
echo.
pause>nul
cls
if %enhellth% leq 0 goto winbt
if %health% leq 0 goto btlose
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
(
echo %gold%
echo %weapon%
echo %playername%
echo %savenm%
echo %health%
echo %weaponat%
)> %savenm%.sv
goto continue

:coward
echo you ran away like an coward, and the enemy lauthed at you!
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
echo %weaponat%
echo %health%
)> %savenm%.sv
goto continue

:btlose
set /a logold=%random% %%20
echo.
echo.
echo You Died! you lost %logold% GOLD's.
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
)> %savenm%.sv
cls
goto continue