@echo off
REM CMD script to copy entire .github directory from github\.github to .github.
REM Mass copy operation with verification of all files copied successfully.

setlocal enabledelayedexpansion

echo ========================================
echo File Copy Script - CMD Version
echo ========================================
echo Session started: %date% %time%

set "src_dir=github\.github"
set "dest_dir=.github"

if not exist "%src_dir%" (
    echo Error: %src_dir% directory not found
    echo Session ended with error: %date% %time%
    exit /b 1
)

REM Get current date and time in a standardized format
for /f "tokens=2 delims==" %%a in ('wmic OS Get localdatetime /value') do set "dt=%%a"
set "current_date=%dt:~0,4%-%dt:~4,2%-%dt:~6,2%"
set "current_time=%dt:~8,2%:%dt:~10,2%:%dt:~12,2%"
set "current_datetime=%current_date% %current_time%"

echo Current date/time for updates: %current_datetime%

REM Step 1: Clean up existing .github directory
echo.
echo Step 1: Cleaning up existing .github directory...

if exist "%dest_dir%" (
    echo Deleting .github directory and all its contents...
    rmdir /S /Q "%dest_dir%" >nul 2>&1
    if !errorlevel! equ 0 (
        REM Verify deletion was successful
        if not exist "%dest_dir%" (
            echo Successfully deleted: %dest_dir% ^(entire directory^)
        ) else (
            echo Error: %dest_dir% directory still exists after deletion attempt
            echo Session ended with error: %date% %time%
            exit /b 1
        )
    ) else (
        echo Error: Could not delete %dest_dir% directory
        echo Session ended with error: %date% %time%
        exit /b 1
    )
) else (
    echo No %dest_dir% directory found to delete
)

echo Cleanup completed

REM Step 2: Mass copy entire directory structure
echo.
echo Step 2: Mass copying entire directory from %src_dir% to %dest_dir%...

xcopy "%src_dir%" "%dest_dir%" /E /I /Y >nul 2>&1
if !errorlevel! equ 0 (
    echo Successfully copied entire directory structure
) else (
    echo Error: Failed to copy directory structure
    echo Session ended with error: %date% %time%
    exit /b 1
)

REM Step 3: Count and verify all files were copied
echo.
echo Step 3: Verifying all files were copied and updating timestamps...

REM Count source files
set src_file_count=0
for /r "%src_dir%" %%F in (*) do (
    set /a src_file_count+=1
)
echo Source directory contains !src_file_count! files

REM Count destination files
set dest_file_count=0
for /r "%dest_dir%" %%F in (*) do (
    set /a dest_file_count+=1
)
echo Destination directory contains !dest_file_count! files

REM Verify counts match
if !src_file_count! equ !dest_file_count! (
    echo File count verification passed: !src_file_count! files copied successfully
) else (
    echo File count verification failed: Expected !src_file_count! files, found !dest_file_count! files
    echo Session ended with error: %date% %time%
    exit /b 1
)

REM Step 4: Update timestamps in all copied files
echo.
echo Step 4: Updating timestamps in all copied files...

set updated_files=0
set failed_updates=0

for /r "%dest_dir%" %%F in (*) do (
    set "dest_file=%%F"

    REM Update timestamps in the copied file
    powershell -Command "(Get-Content '!dest_file!' -Raw -ErrorAction SilentlyContinue) -replace '\d{4}-\d{2}-\d{2}( \d{2}:\d{2}:\d{2})?', '%current_datetime%' | Set-Content '!dest_file!' -NoNewline -ErrorAction SilentlyContinue" >nul 2>&1
    if !errorlevel! equ 0 (
        echo Updated timestamps: !dest_file!
        set /a updated_files+=1
    ) else (
        echo Failed to update timestamps: !dest_file!
        set /a failed_updates+=1
    )
)

REM Handle special README.md renaming if it exists in root
if exist "%dest_dir%\README.md" (
    echo Renaming root README.md to github-context-readme.md
    move "%dest_dir%\README.md" "%dest_dir%\github-context-readme.md" >nul 2>&1
    if !errorlevel! equ 0 (
        echo Successfully renamed README.md
    ) else (
        echo Warning: Failed to rename README.md
    )
)

REM Step 5: Final verification - list all copied files
echo.
echo Step 5: Final verification - listing all copied files...

for /r "%dest_dir%" %%F in (*) do (
    echo Copied: %%F
)

echo.
echo ========================================
echo Mass Copy Summary:
echo - Source directory: %src_dir%
echo - Destination directory: %dest_dir%
echo - Files copied: !dest_file_count!
echo - Verification: PASSED
echo - Root README.md renamed to github-context-readme.md ^(if present^)
echo - All timestamps updated to: %current_datetime%
echo - Session ended successfully: %date% %time%
echo ========================================

endlocal
