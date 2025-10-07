@echo off
REM CMD script to copy all files from .github directory to project root.
REM Replicates Gradle clean build functionality without git operations.

setlocal enabledelayedexpansion

set "src_dir=.github"
set "dest_dir=."

if not exist "%src_dir%" (
    echo Error: %src_dir% directory not found
    exit /b 1
)

echo Copying files from %src_dir% to project root...

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

echo Successfully copied !copied_files! files from .github to project root
endlocal
