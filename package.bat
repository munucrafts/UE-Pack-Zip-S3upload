@echo off
@REM Start Packaging
echo %PROJECT_NAME% Packaging Begins.
@REM Navigate to the Unreal Engine directory
cd "%UE_PATH%\Engine\Build\BatchFiles"
@REM Run Unreal Automation Tool (UAT) to package the project
call "C:\Program Files\Epic Games\UE_%UE_VERSION%\Engine\Build\BatchFiles\RunUAT.bat" BuildCookRun -project="%PROJECT_PATH%\%PROJECT_NAME%.uproject" -platform=Win64 -configuration=%UE_PACKAGE_TYPE% -map=%MAPS% -nocompileeditor -unattended -utf8output -clean -build -cook -stage -pak -prereqs -package -archive -archivedirectory="%PACKAGE_PATH%" -createreleaseversion=%PROJECT_RELEASE_VERSION%
echo %PROJECT_NAME% Packaging Completed.