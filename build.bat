@echo off

set SRC_DIR=src/main/java
set WEBAPP_DIR=src/webapp
set BUILD_DIR=build
set SERVLET_API=lib/servlet-api.jar
set SOURCE_FILE=sources.txt
set WAR_NAME=ETU003213.war
set WAR_DEST=E:\ITU\S4\Mr_Naina\apache-tomcat-10.1.39\webapps

if not exist "%SERVLET_API%" (
    echo [ERREUR] Le fichier servlet-api.jar est introuvable dans %SERVLET_API%.
    pause
    exit /b 1
)

echo [INFO] Recherche des fichiers .java dans %SRC_DIR%...
del /F /Q "%SOURCE_FILE%" >nul 2>&1
for /R "%SRC_DIR%" %%f in (*.java) do (
    echo %%f >> "%SOURCE_FILE%"
)

if not exist "%SOURCE_FILE%" (
    echo [ERREUR] Aucun fichier .java trouvé dans %SRC_DIR%.
    pause
    exit /b 1
)

echo [INFO] Suppression du dossier build s'il existe...
if exist "%BUILD_DIR%" (
    rmdir /S /Q "%BUILD_DIR%"
)
mkdir "%BUILD_DIR%"

if not exist "%WEBAPP_DIR%\WEB-INF\classes" (
    mkdir "%WEBAPP_DIR%\WEB-INF\classes"
)

echo [INFO] Compilation des fichiers Java...
javac -d "%WEBAPP_DIR%\WEB-INF\classes" -classpath "%SERVLET_API%" @%SOURCE_FILE%
if %errorlevel% neq 0 (
    echo [ERREUR] Erreur lors de la compilation.
    pause
    exit /b 1
)

echo [INFO] Copie des fichiers Web dans le build...
xcopy /E /I /Y "%WEBAPP_DIR%" "%BUILD_DIR%"
if %errorlevel% neq 0 (
    echo [ERREUR] Erreur lors de la copie des fichiers.
    pause
    exit /b 1
)

echo [INFO] Création du fichier WAR...
jar -cvf "%BUILD_DIR%\%WAR_NAME%" -C "%BUILD_DIR%" .
if %errorlevel% neq 0 (
    echo [ERREUR] Erreur lors de la création du fichier WAR.
    pause
    exit /b 1
)

echo [INFO] Déplacement du fichier WAR vers %WAR_DEST%...
move /Y "%BUILD_DIR%\%WAR_NAME%" "%WAR_DEST%"
if %errorlevel% neq 0 (
    echo [ERREUR] Erreur lors du déplacement du fichier WAR.
    pause
    exit /b 1
)

echo [SUCCES] Déploiement terminé. Le fichier WAR a été copié dans %WAR_DEST%.
pause