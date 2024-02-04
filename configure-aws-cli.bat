@echo off

REM Set AWS CLI installation directory with quotes and Set latest Aws Cli Url.
set "AWS_CLI_PATH=C:\Program Files\Amazon\AWSCLIV2\"
set "AWS_CLI_URL=https://awscli.amazonaws.com/AWSCLIV2.msi"
set "ENV_FILE=.env"

REM Verify AWS CLI installation
if exist "%AWS_CLI_PATH%aws.exe" (
    echo AWS CLI already installed.
) else (
    REM Install AWS CLI
    msiexec /i "%AWS_CLI_URL%" /qn
    if %errorlevel% neq 0 (
        echo Error: AWS CLI installation failed.
        exit /b 1
    ) else (
        echo AWS CLI installed successfully.
    )
)

REM Loading environment variables from .env file
for /f "tokens=1,* delims==" %%a in ('type %ENV_FILE%') do (
    set "%%a=%%b"
)

REM Configure AWS CLI with credentials from .env file
"%AWS_CLI_PATH%aws" configure set aws_access_key_id %AWS_ACCESS_KEY_ID%
"%AWS_CLI_PATH%aws" configure set aws_secret_access_key %AWS_SECRET_ACCESS_KEY%
"%AWS_CLI_PATH%aws" configure set default.region %AWS_DEFAULT_REGION%

REM Verify AWS CLI configuration
"%AWS_CLI_PATH%aws" sts get-caller-identity > nul
if %errorlevel% neq 0 (
    echo Error: AWS CLI configuration failed.
) else (
    echo AWS CLI configured successfully.
)


