@echo off
Title CSVDE [= khru =]

Color 0A
MODE CON cols=50 lines=30
Cls
:Dominio
SET /P DC1=Introduzca su nombre NetBios: 
SET /P DC2=Introduzca su dominio:
:menu
echo.
echo OPCIONES
echo ==================================================
Echo             * 1 - Exportaci¢n     *
Echo             * 2 - Importaci¢n    *
echo             * 3 - Cambiar Dominio *
Echo             * 4 - Salida          *  
echo ==================================================                    
Echo.

SET /P PREG= Selecione una opcion: 
IF %PREG%==1 GOTO exportar
IF %PREG%==2 GOTO importar
IF %PREG%==3 GOTO Dominio
IF %PREG%==4 GOTO salir
GOTO menu

:exportar
SET /P CSV1=Introduzca el nombre de la Unidad Organizativa a exportar: 
SET /P CSV2=Introduzca el nombre del fichero a exportar: 
CSVDE -m -d "OU=%CSV1%,DC=%DC1%,DC=%DC2%" -f "%CSV2%"
MSG * "Proceso terminado"
pause
cls
echo 1 - Menu
echo 2 - Salir
set /P rou= Selecione una opcion:
if %rou%==1 GOTO menu
if %rou%==2 GOTO salir
goto menu

:importar
SET /P CSV3=Introduzca el nombre del fichero a importar: 
CSVDE -i -k -f "%CSV3%"
MSG * "Proceso terminado"
pause
cls
echo 1 - Menu
echo 2 - Salir
set /P rou= Selecione una opcion:
if %rou%==1 GOTO menu
if %rou%==2 GOTO salir
goto menu

SET /P DC1=Introduzca su nombre NTBIOS del equipo: 
SET /P DC2=Introduzca su dominio:
:salir
exit
