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
echo Save Carregado:%savenm%
echo ---------------------------
echo -   Totally Weird Game    -
echo -     Menu Principal      -
ECHO ---------------------------
echo -                         -
echo - 1- Comecar              -
echo - 2- Carregar Save        -
echo - 3- Ver estatos do Save  -
echo - 4- Continuar            -
echo - 5- Sair                 -
echo -                         -
echo ---------------------------
echo.
echo.
echo.
set /p mnop= DIGITE UMA OPCAO: 
cls

if %mnop% equ 1 goto start 
if %mnop% equ 2 goto load 
if %mnop% equ 3 goto shst 
if %mnop% equ 4 goto continue 
if %mnop% equ 5 goto exit 
echo Ops! Parece que voce digitou Errado!
pause>nul
goto mainmenu

:exit
exit

:load
cls
set /p savenm= Digite o Nome do Save: 
if exist %savenm%.sv goto loadsave
echo Desculpe mas o Nome do save ou o Arquivo Nao Existe!
echo.
echo.
pause
cls
set savenm= Nenhum
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
echo Save Carregado!
echo.
echo.
pause
cls
goto mainmenu

:shst
cls
echo -Estatos do Save:---------------------------------------
echo -                                      
echo - Nome do Save: %savenm%             
echo - Nome do Player: %playername%            
echo - Gold's: %gold%                         
echo - Arma: %weapon%
echo - Vida: %health%
echo - Numero de Pocoes: %potion%                     
echo -                                      
echo --------------------------------------------------------
echo.
echo.
echo.
pause
cls
goto mainmenu 

:start
echo Vamos Comecar colocando o Nome do Save.
echo.
set /p savenm= Digite o Nome do Save: 
cls
echo Agora vamos Criar o Nome do Player!
echo. 
set /p playername= Digite o Nome do Player: 
cls
set gold= 0
set weapon= Graveto
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
if %savenm% == NONE (
    goto mainmenu
)
cls
echo -JOGO------------------------
echo - 1- Achar uma Batalha      -
echo - 2- Ir para a Loja         -
echo -----------------------------
echo - 3- Menu Principal         -
echo -----------------------------
echo.
echo.
set /p op= Digite uma das opcoes: 
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
echo Vida do Boss: %bsheallth%
echo Sua Vida: %health%
echo --------------------------
echo -      1- Atacar         -
echo -      2- Fugir          -
echo -      3- Usar Pocao     -
echo --------------------------
echo.
echo.
set /p bsbtop=Digite uma OPCAO: 
cls

if %bsbtop% == 1 goto bsatack
if %bsbtop% == 2 goto coward
if %bsbtop% == 3 goto askpotion

:askpotion
if %potion% == 1 goto usepotion
else (
    echo Oh oh! Voce nao tem Pocoes!
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
echo Com sua %weapon% voce removeu %btweaponat% da vida do Boss!
echo o Boss removeu %bsattack% da sua Vida!
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
echo Vida do Inimigo: %enhelth%
echo Sua Vida: %health%
echo -------------------------
echo -      1- Atacar!       -
echo -      2- Fugir!        -
echo -      3- Usar Pocao    -
echo -------------------------
echo.
echo.
set /p btop= Digite uma das Opcoes: 
cls

if %btop% == 1 goto attack
if %btop% == 2 goto coward
if %btop% == 3 goto askpotion

:attack
set /a health= %health%-%enattack%
set /a enhelth= %enhelth%-%btweaponat%
cls
echo Com sua %weapon% voce removeu %btweaponat% da vida do seu Inimigo!
echo o Inimigo removeu %enattack% da sua Vida!
echo.
echo.
pause
cls
if %enhelth% leq 0 goto winbt
if %health% leq 0 goto btlose
cls
goto battle

:winbt
echo Voce o Derrotou!, e voce ganhou %engold% de GOLD's!
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
echo Voce Fugiu como um Otario!
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
echo Voce Morreu! Voce Perdeu %logold% de GOLD's.
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