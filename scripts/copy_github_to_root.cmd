@echo off
REM CMD script to copy .github files from .github\.github to .github.
REM Simple file copying without git operations, with cleanup of existing files and timestamp updates.

setlocal enabledelayedexpansion

echo ========================================
echo File Copy Script - CMD Version
echo ========================================
echo Session started: %date% %time%

set "src_dir=.github\.github"
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

REM Step 1: Clean up existing copied files
echo.
echo Step 1: Cleaning up existing copied files and directories...

set cleaned_files=0

REM Clean up the specially renamed README file
if exist "%dest_dir%\github-context-readme.md" (
    del /Q "%dest_dir%\github-context-readme.md" >nul 2>&1
    if !errorlevel! equ 0 (
        echo Deleted: %dest_dir%\github-context-readme.md
        set /a cleaned_files+=1
    ) else (
        echo Warning: Could not delete %dest_dir%\github-context-readme.md
    )
)

REM Clean up other files from .github\.github
for /r "%src_dir%" %%F in (*) do (
    set "src_file=%%F"
    set "full_path=%%F"
    set "filename=%%~nxF"
    set "src_parent_dir=%%~dpF"

    REM Only skip the root .github\.github/README.md file (not subdirectory README.md files)
    set "skip_file=false"
    if /i "!filename!"=="README.md" (
        REM Check if this is the root .github\.github/README.md
        set "expected_path=%cd%\%src_dir%\"
        if "!src_parent_dir!"=="!expected_path!" (
            set "skip_file=true"
        )
    )

    if "!skip_file!"=="false" (
        REM Calculate relative path by removing source directory prefix
        set "rel_path=!full_path:%cd%\%src_dir%\=!"
        set "dest_file=%dest_dir%\!rel_path!"

        REM Delete existing file if it exists
        if exist "!dest_file!" (
            del /Q "!dest_file!" >nul 2>&1
            if !errorlevel! equ 0 (
                echo Deleted: !dest_file!
                set /a cleaned_files+=1
            ) else (
                echo Warning: Could not delete !dest_file!
            )
        )
    )
)

REM Clean up empty directories that might have been created from previous copies
for /d %%D in (instructions prompts) do (
    if exist "%dest_dir%\%%D" (
        echo Removing directory: %dest_dir%\%%D
        rmdir /S /Q "%dest_dir%\%%D" >nul 2>&1
    )
)

echo Cleaned up %cleaned_files% files and directories

REM Step 2: Copy files from .github\.github to .github with timestamp updates
echo.
echo Step 2: Copying files from .github\.github to .github with timestamp updates...

set copied_files=0
for /r "%src_dir%" %%F in (*) do (
    set "src_file=%%F"
    set "full_path=%%F"
    set "filename=%%~nxF"
    set "src_parent_dir=%%~dpF"

    REM Handle only the root .github\.github/README.md specially
    set "is_root_readme=false"
    if /i "!filename!"=="README.md" (
        REM Check if this is the root .github\.github/README.md
        set "expected_path=%cd%\%src_dir%\"
        if "!src_parent_dir!"=="!expected_path!" (
            set "is_root_readme=true"
        )
    )

    if "!is_root_readme!"=="true" (
        set "dest_file=%dest_dir%\github-context-readme.md"

        REM Copy file with new name
        copy /Y "!src_file!" "!dest_file!" >nul
        if !errorlevel! equ 0 (
            REM Update timestamps in the copied file
            powershell -Command "(Get-Content '!dest_file!' -Raw) -replace '\d{4}-\d{2}-\d{2}( \d{2}:\d{2}:\d{2})?', '%current_datetime%' | Set-Content '!dest_file!' -NoNewline"
            echo Copied and updated timestamps: !src_file! -^> !dest_file! ^(renamed^)
            set /a copied_files+=1
        ) else (
            echo Error copying: !src_file!
        )
    ) else (
        REM Handle all other files normally
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
            REM Update timestamps in the copied file
            powershell -Command "(Get-Content '!dest_file!' -Raw) -replace '\d{4}-\d{2}-\d{2}( \d{2}:\d{2}:\d{2})?', '%current_datetime%' | Set-Content '!dest_file!' -NoNewline"
            echo Copied and updated timestamps: !src_file! -^> !dest_file!
            set /a copied_files+=1
        ) else (
            echo Error copying: !src_file!
        )
    )
)

echo.
echo ========================================
echo Session Summary:
echo - Files cleaned up: !cleaned_files!
echo - Files copied with timestamp updates: !copied_files!
echo - Root .github\.github/README.md renamed to github-context-readme.md
echo - Updated to current date/time: %current_datetime%
echo - Session ended: %date% %time%
echo ========================================

endlocal
