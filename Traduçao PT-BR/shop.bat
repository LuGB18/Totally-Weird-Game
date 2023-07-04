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
)
set /a goldrestore= %gold%
set /a MT= 50
set /a S= 1
set /a GS= 100
set /a WS= 20
cls
goto shop

:shop
echo -Nome do Save: %savenm%
echo -Nome do Player: %playername%
echo -Gold's: %gold%
echo -Arma: %weapon%
echo -Dano da Arma: %weaponat%
echo ------------------------------------
echo -         Loja de Armas            -
echo ------------------------------------
echo -                                  -
echo - A- Espada de Metal - 50 GOLD'S   -
echo - B- Outro Graveto - 1 GOLD        -
echo - C- Espada de Ouro - 100 GOLD's   -
echo - D- Espada de Madeira - 20 GOLD'S -
echo -                                  -
echo ------------------------------------
echo - E- Sair da Loja                  -
echo ------------------------------------
echo.
echo.
set /p op= Digite uma das opcoes: 
cls
if %op% equ a goto BMS
if %op% equ b goto BAN
if %op% equ c goto BGS
if %op% equ d goto BWS
if %op% equ e goto BG

:BMS
set /a gold= %gold%-%MT%
if %gold% leq -1 goto restore
set /a goldrestore= %gold%
set weapon= Espada de Metal
set weaponat= 60
cls
echo Voce Comprou uma Espada de Metal!
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
echo Voce comprou Outro Graveto!
echo.
pause
cls
goto shop

:restore
set /a gold= 0
set /a gold= %goldrestore%
cls
echo Ai nao! Parece que Voce nao tem GOLD'S o suficiente para comprar a arma!
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
set Weapon= Espada de Ouro
set weaponat= 80
cls
echo Voce comprou uma Espada de Ouro!
echo.
echo.
pause>nul
cls
goto shop

:BWS
set /a gold= %gold%-%WS%
if %gold% leq -1 goto restore
set /a goldrestore=%gold%
set Weapon= Wooden Sword
set weaponat= 50
cls
echo You Buyed an Wooden Sword!
echo.
echo.
pause>nul
cls
goto shop