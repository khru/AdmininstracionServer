@ECHO OFF
TITLE hacking tool
COLOR 0a
CLS
:MENU
CLS
ECHO ************************************************************************
ECHO *                                                                      *
ECHO *                 1 - Desactivar firewall de windows                   *
ECHO *                 2 - Habilitar firewall de windows                    *
ECHO *                 3 - Cambiar contrase¤a (hackeado)                   *
echo *                 4 - Crear una carpeta compartida (hack)              *
echo *                 5 - Obtener informacion del sistema                  *
ECHO *                 6 - Salir                                            *
ECHO *                                                                      *
ECHO ************************************************************************

SET /P PREG=Selecione una opcion: 
IF %PREG%==1 GOTO SCRIPT1
IF %PREG%==2 GOTO SCRIPT2
IF %PREG%==3 GOTO DCS
IF %PREG%==4 GOTO script5
if %PREG%==5 GOTO script4
if %PREG%==6 GOTO SALIDA
GOTO MENU

:SCRIPT1
netsh firewall set opmode disable
PAUSE
CLS
GOTO MENU

:SCRIPT2
netsh firewall set opmode enable
PAUSE
CLS
GOTO MENU
:script3
net user %USERNAME% hackeado

:script4
mkdir info
cd info
arp > ./arp.txt
ipconfig /all > ./ipconfig.txt
netstat -nat > ./netstat.txt
route print > ./route.txt
net user > ./netuser.txt
cd ..
copy "info" "C:\hack"

:script5
cd "C:\"
mkdir hack
net share hackeado=C:\hack /unlimited
pause
:SALIDA
EXIT
