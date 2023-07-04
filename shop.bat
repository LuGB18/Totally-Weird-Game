@echo off
title shop
color a
<shop.sv (
set /p gold=
set /p weapon=
set /p playername=
set /p savenm=
)
set /a goldrestore= %gold%
set /a MT= 50
set /a S= 1
cls
goto shop

:shop
echo -Save File Name: %savenm%
echo -Player Name: %playername%
echo -Gold: %gold%
echo --------------------------------
echo -       Shop of Weapons        -
echo --------------------------------
echo -                              -
echo - A- Metal Sword - 50 GOLD'S   -
echo - B- Another Stick - 1 GOLD    -
echo -                              -
echo --------------------------------
echo - C- Get out of the Shop       -
echo --------------------------------
echo.
echo.
set /p op= type an option: 
cls
if %op% equ a goto BMS
if %op% equ b goto BAN
if %op% equ c goto BG

:BMS
set /a gold= %gold%-%MT%
if %gold% leq -1 goto restore
set /a goldrestore= %gold%
set weapon= Metal Sword
cls
echo You Buyed an Metal Sword!
echo.
pause
cls
goto shop

:BAN
set /a gold= %gold%-%S%
if %gold% leq -1 goto restore
set /a goldrestore= %gold%
set weapon= Double Stick'S
cls
echo You Buyed an Another Stick!
echo.
pause
cls
goto shop

:restore
set /a gold= 0
set /a gold= %goldrestore%
cls
echo Oh No! you dont have suficient Gold's to Buy the Weapon!
echo.
pause>nul
goto shop

:BG
(
echo %gold%
echo %weapon%
echo %playername%
echo %savenm%
)> %savenm%.sv
del /s /q shop.sv
cls
start game.bat
cls
exit