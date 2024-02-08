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


@REM Call All Bat Files
call configure-aws-cli.bat
call package.bat
call zip.bat
call upload-to-s3.bat



