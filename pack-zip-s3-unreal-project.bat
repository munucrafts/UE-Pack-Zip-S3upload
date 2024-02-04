@echo off

@REM Set the Project Details
set "UE_VERSION=5.2"
set "UE_PATH=C:\Program Files\Epic Games\UE_%UE_VERSION%"
set "UE_PACKAGE_TYPE=Development"
set "PROJECT_NAME=ProjectName"
set "PROJECT_RELEASE_VERSION=ProjectReleaseVersion"
set "MAPS=Map1+Map2+Map3"
set "PROJECT_PATH=ProjectPath"
set "PACKAGE_PATH=PackagePath"
set "S3_PATH=S3Path"



@REM Start Packaging
echo %PROJECT_NAME% Packaging Begins.
@REM Navigate to the Unreal Engine directory
cd "%UE_PATH%\Engine\Build\BatchFiles"
@REM Run Unreal Automation Tool (UAT) to package the project
call "C:\Program Files\Epic Games\UE_%UE_VERSION%\Engine\Build\BatchFiles\RunUAT.bat" BuildCookRun -project="%PROJECT_PATH%\%PROJECT_NAME%.uproject" -platform=Win64 -configuration=%UE_PACKAGE_TYPE% -map=%MAPS% -nocompileeditor -unattended -utf8output -clean -build -cook -stage -pak -prereqs -package -archive -archivedirectory="%PACKAGE_PATH%" -createreleaseversion=%PROJECT_RELEASE_VERSION%
echo %PROJECT_NAME% Packaging Completed.



@REM Zip the Package Files
echo %PROJECT_NAME% Zipping Begins.
@REM Navigate to 7-Zip Folder
cd "C:\Program Files\7-Zip"
@REM Zipping (Command Line = 7z a -tzip "ZipPath.zip" "PackagePath")
7z a -tzip "%PACKAGE_PATH%\Windows%UE_PACKAGE_TYPE%.zip" "%PACKAGE_PATH%"
set "ZIP_PATH=%PACKAGE_PATH%\Windows%UE_PACKAGE_TYPE%.zip"
echo %PROJECT_NAME% Zipping Completed.



@REM Install AWS Cli if Not Already Installed. You need this to upload a file to S3.
call configure-aws-cli.bat



@REM Uploading the Project to S3.
:UploadToS3
echo %PROJECT_NAME% Upload to S3 Begins.
aws s3 cp "%ZIP_PATH%" "%S3_PATH%"
echo %PROJECT_NAME% Upload to S3 Completed.
goto :eof


