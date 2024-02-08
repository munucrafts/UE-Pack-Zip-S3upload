@echo off
@REM Zip the Package Files
echo %PROJECT_NAME% Zipping Begins.
@REM Navigate to 7-Zip Folder
cd "C:\Program Files\7-Zip"
@REM Zipping (Command Line = 7z a -tzip "ZipPath.zip" "PackagePath")
7z a -tzip "%PACKAGE_PATH%\Windows%UE_PACKAGE_TYPE%.zip" "%PACKAGE_PATH%"
set "ZIP_PATH=%PACKAGE_PATH%\Windows%UE_PACKAGE_TYPE%.zip"
echo %PROJECT_NAME% Zipping Completed.
