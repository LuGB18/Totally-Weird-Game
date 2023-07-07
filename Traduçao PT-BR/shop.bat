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
echo -Nome do Save: %savenm%
echo -Nome do Player: %playername%
echo -Gold's: %gold%
echo -Arma: %weapon%
echo -Dano da Arma: %weaponat%
echo -Numero de Pocoes: %potion%
echo ------------------------------------
echo -         Loja de Armas            -
echo ------------------------------------
echo -                                  -
echo - A- Espada de Metal - 50 GOLD'S   -
echo - B- Outro Graveto - 1 GOLD        -
echo - C- Espada de Ouro - 100 GOLD's   -
echo - D- Espada de Madeira - 20 GOLD'S -
echo - E- Buy an Potion - 10 GOLD'S     -
echo -                                  -
echo ------------------------------------
echo - F- Sair da Loja                  -
echo ------------------------------------
echo.
echo.
set /p op= Digite uma das opcoes: 
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
set weapon= Gravetos Duplos
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
set weapon= Espada de Ouro
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
set weapon= Espada de Madeira
set weaponat= 50
cls
echo Voce Comprou uma Espada de Madeira!
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
echo Voce Comprou uma Pocao!
echo.
echo.
pause>nul
cls
goto shop

:maxpotion
cls
echo Maximo de Pocoes Chegado!
pause>nul
cls
goto shop