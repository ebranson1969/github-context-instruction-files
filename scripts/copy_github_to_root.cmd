@echo off
REM CMD script to copy .github files to project root.
REM Simple file copying without git operations.

setlocal enabledelayedexpansion

echo ========================================
echo File Copy Script - CMD Version
echo ========================================
echo Session started: %date% %time%

REM Copy files from .github to project root
echo.
echo Copying files from .github to project root...

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
echo - Files copied: !copied_files!
echo - Session ended: %date% %time%
echo ========================================

endlocal
