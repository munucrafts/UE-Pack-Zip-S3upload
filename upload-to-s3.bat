@echo off
@REM Uploading the Project to S3.
:UploadToS3
echo %PROJECT_NAME% Upload to S3 Begins.
aws s3 cp "%ZIP_PATH%" "%S3_PATH%"
echo %PROJECT_NAME% Upload to S3 Completed.
