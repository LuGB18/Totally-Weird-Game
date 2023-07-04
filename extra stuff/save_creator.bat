@echo off
color a
title GAME
cls
set /p savenm= Nome do save:  
set /p gold= quantos gold's vc quer?: 
set /p weapon= Nome da Arma: 
set /p playername= Nome do Player: 
cls
echo o save está prestes a ser criado....
echo.
pause
(
echo %gold%
echo %weapon%
echo %playername%
)> %savenm%.sv
echo Save Criado!
echo.
pause
exit