@echo off
REM CMD script to reset branch to master state and copy .github files to project root.
REM Enhanced version with git reset functionality and session logging.

setlocal enabledelayedexpansion

echo ========================================
echo Git Reset and Copy Script - CMD Version
echo ========================================
echo Session started: %date% %time%

REM Step 1: Switch to master branch
echo.
echo Step 1: Switching to master branch...
git checkout master
if !errorlevel! neq 0 (
    echo Error: Failed to switch to master branch
    echo Session ended with error: %date% %time%
    exit /b 1
)
echo Successfully switched to master branch

REM Step 2: Reset to origin/master (hard reset)
echo.
echo Step 2: Resetting to origin/master...
echo This will revert all changes, remove new files, and restore deleted files
git fetch origin
git reset --hard origin/master
if !errorlevel! neq 0 (
    echo Error: Failed to reset to origin/master
    echo Session ended with error: %date% %time%
    exit /b 1
)
echo Successfully reset to origin/master

REM Step 3: Clean untracked files and directories
echo.
echo Step 3: Cleaning untracked files and directories...
git clean -fd
if !errorlevel! neq 0 (
    echo Warning: Git clean had issues, continuing...
)

REM Step 4: Copy files from .github to project root
echo.
echo Step 4: Copying files from .github to project root...

set "src_dir=.github"
set "dest_dir=."

if not exist "%src_dir%" (
    echo Error: %src_dir% directory not found
    echo Session ended with error: %date% %time%
    exit /b 1
)

set copied_files=0
for /r "%src_dir%" %%F in (*) do (
    set "src_file=%%F"
    set "full_path=%%F"

    REM Calculate relative path by removing source directory prefix
    set "rel_path=!full_path:%cd%\%src_dir%\=!"
    set "dest_file=%dest_dir%\!rel_path!"

    REM Get destination directory
    for %%A in ("!dest_file!") do set "dest_dirname=%%~dpA"

    REM Create destination directory if it doesn't exist
    if not exist "!dest_dirname!" (
        mkdir "!dest_dirname!" 2>nul
    )

    REM Copy file with overwrite
    copy /Y "!src_file!" "!dest_file!" >nul
    if !errorlevel! equ 0 (
        echo Copied: !src_file! -^> !dest_file!
        set /a copied_files+=1
    ) else (
        echo Error copying: !src_file!
    )
)

echo.
echo ========================================
echo Session Summary:
echo - Branch reset to origin/master: SUCCESS
echo - Files copied: !copied_files!
echo - Session ended: %date% %time%
echo ========================================

endlocal
