@echo off
title shop
color a
<shop.sv (
set /p gold=
set /p weapon=
set /p playername=
set /p savenm=
set /p health=
set /p weaponat=
set /p potion=
)
set /a goldrestore= %gold%
set /a MT= 50
set /a S= 1
set /a GS= 100
set /a WS= 20
set /a P= 10
cls
goto shop

:shop
echo -Name of the Save: %savenm%
echo -Name of the Character: %playername%
echo -Gold's: %gold%
echo -Weapon: %weapon%
echo -Damage of the Weapon: %weaponat%
echo -Number of Potions: %potion%
echo ------------------------------------
echo -         Shop of Items            -
echo ------------------------------------
echo -                                  -
echo - A- Metal Sword - 50 GOLD'S   -
echo - B- Other Stick - 1 GOLD        -
echo - C- Gold Sword - 100 GOLD's   -
echo - D- Wooden Sword - 20 GOLD'S -
echo - E- Buy an Potion - 10 GOLD'S     -
echo -                                  -
echo ------------------------------------
echo - F- Exit the Shop                 -
echo ------------------------------------
echo.
echo.
set /p op= Type one of the options: 
cls
if %op% equ a goto BMS
if %op% equ b goto BAN
if %op% equ c goto BGS
if %op% equ d goto BWS
if %op% equ e goto BP
if %op% equ f goto BG

:BMS
set /a gold= %gold%-%MT%
if %gold% leq -1 goto restore
set /a goldrestore= %gold%
set weapon= Metal Sword
set weaponat= 60
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
set /a weaponat= 40
cls
echo You Buyed Another Stick!
echo.
pause
cls
goto shop

:restore
set /a gold= 0
set /a gold= %goldrestore%
cls
echo Oh no! Looks like you dont have that many GOLD'S to Buy This Item!
echo.
pause>nul
goto shop

:BG
(
echo %gold%
echo %weapon%
echo %playername%
echo %savenm%
echo %health%
echo %weaponat%
echo %potion%
)> %savenm%.sv
del /s /q shop.sv
cls
start game.bat
cls
exit

:BGS
set /a gold= %gold%-%GS%
if %gold% leq -1 goto restore
set /a goldrestore=%gold%
set weapon= Golden Sword
set weaponat= 80
cls
echo You Buyed an Golden Sword!
echo.
echo.
pause>nul
cls
goto shop

:BWS
set /a gold= %gold%-%WS%
if %gold% leq -1 goto restore
set /a goldrestore=%gold%
set weapon= Wooden Sword
set weaponat= 50
cls
echo You Buyed an Wooden Sword!
echo.
echo.
pause>nul
cls
goto shop

:BP
if %potion% == 1 goto maxpotion
set /a gold= %gold%-%p%
if %gold% leq -1 goto restore
set /a goldrestore=%gold%
set potion= 1
cls
echo You Buyed an Potion!
echo.
echo.
pause>nul
cls
goto shop

:maxpotion
cls
echo Max Potions Reached!
pause>nul
cls
goto shop