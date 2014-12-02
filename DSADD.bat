echo off
MODE CON cols=50 lines=30
color 0A
title khru
goto menu
:menu
cls
echo.
echo.
echo OPCIONES
echo ==================================================
echo.
echo 1- Crea UO mediante una lista
echo 2- Crea grupos mediante una lista dentro de una
echo   UO ya creada
echo 3- Crea Usuarios medante una lista (PWD:123456)
echo 4- Que realize todas las operaciones anteriores
echo 5- Salir
echo.
echo Para que funcione simplemente deja los archivos
echo de texto en la carpeta donde esta el Script
echo OU "ou.txt" grupos "group.txt" 
echo Usuarios "users.txt"
echo.
echo ==================================================
set /P respuesta=

if %respuesta%==1 GOTO UO
if %respuesta%==2 GOTO grupo
if %respuesta%==3 GOTO usuario
if %respuesta%==4 GOTO all
if %respuesta%==5 GOTO exit
:UO
for /F "tokens=1,* delims=" %%a in (ou.txt) do (
	dsadd ou "ou=%%a,DC=cardo,DC=verdu"
)
MSG * "Proceso terminado"
echo.
echo.
echo 1- Volver al menu
echo 2- Salir
set /P rou=
if %rou%==1 GOTO menu
if %rou%==2 GOTO exit
pause
:grupo
for /F "tokens=1,2 delims=," %%b in (group.txt) do (
	dsadd group "cn=%%c,ou=%%b,DC=cardo,DC=verdu"
)
MSG * "Proceso terminado"
echo.
echo.
echo 1- Volver al menu
echo 2- Sali
set /P rgrupo=
if %rgrupo%==1 GOTO menu
if %rgrupo%==2 GOTO exit
:usuario
for /F "skip=2 tokens=1,2,3,4,5,6,7 delims=," %%a  in (Usuarios.txt) do (
	dsadd user "cn=%%c,ou=%%d,DC=cardo,DC=verdu" -fn %%a -ln "%%b " -disabled no -pwd "123456" -mustchpwd yes -memberof "cn=%%e,ou=%%f,dc=cardo,dc=verdu" -acctexpires never
) 
MSG * "Proceso terminado"
echo.
echo.
echo 1- Volver al menu
echo 2- Sali
set /P rusuario=
if %rusuario%==1 GOTO menu
if %rusuario%==2 GOTO exit

:all
echo ==================================================
echo - UNIDADES ORGANIZARIVAS
echo ==================================================
for /F "tokens=1,* delims=" %%a in (ou.txt) do (
	dsadd ou "ou=%%a,DC=cardo,DC=verdu"
)
echo ==================================================
echo - GRUPOS
echo ==================================================
for /F "tokens=1,2 delims=," %%b in (group.txt) do (
	dsadd group "cn=%%c,ou=%%b,DC=cardo,DC=verdu"
)
echo ==================================================
echo - USUARIOS
echo ==================================================
for /F "skip=2 tokens=1,2,3,4,5,6,7 delims=," %%a  in (Usuarios.txt) do (
	dsadd user "cn=%%c,ou=%%d,DC=cardo,DC=verdu" -fn %%a -ln "%%b " -disabled no -pwd "123456" -mustchpwd yes -memberof "cn=%%e,ou=%%f,dc=cardo,dc=verdu" -acctexpires never
) 
MSG * "Proceso terminado"
echo.
echo.
echo 1- Volver al menu
echo 2- Salir
set /P rall=
if %rall%==1 GOTO menu
if %rall%==2 GOTO exit
:exit
exit
