@echo off
REM CMD script to delete .github files from project root.
REM Simple cleanup script to remove previously copied files.

setlocal enabledelayedexpansion

echo ========================================
echo Delete GitHub Files - CMD Version
echo ========================================
echo Session started: %date% %time%

set "src_dir=.github"
set "dest_dir=."

if not exist "%src_dir%" (
    echo Warning: %src_dir% directory not found
    echo Cannot determine which files to delete
    echo Session ended: %date% %time%
    exit /b 1
)

REM Delete copied files from .github
echo.
echo Deleting copied files from .github directory...

set deleted_files=0

REM Delete the specially renamed README file
if exist ".\github-context-readme.md" (
    del /Q ".\github-context-readme.md" >nul 2>&1
    if !errorlevel! equ 0 (
        echo Deleted: .\github-context-readme.md
        set /a deleted_files+=1
    ) else (
        echo Warning: Could not delete .\github-context-readme.md
    )
)

REM Delete other files from .github
for /r "%src_dir%" %%F in (*) do (
    set "src_file=%%F"
    set "full_path=%%F"
    set "filename=%%~nxF"
    set "src_parent_dir=%%~dpF"

    REM Only skip the root .github/README.md file (not subdirectory README.md files)
    set "skip_file=false"
    if /i "!filename!"=="README.md" (
        REM Check if this is the root .github/README.md
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
                set /a deleted_files+=1
            ) else (
                echo Warning: Could not delete !dest_file!
            )
        )
    )
)

REM Delete empty directories that might have been created from previous copies
for /d %%D in (instructions prompts) do (
    if exist "%%D" (
        echo Removing directory: %%D
        rmdir /S /Q "%%D" >nul 2>&1
        if !errorlevel! equ 0 (
            echo Successfully removed directory: %%D
        ) else (
            echo Warning: Could not remove directory: %%D
        )
    )
)

echo.
echo ========================================
echo Deletion Summary:
echo - Files deleted: !deleted_files!
echo - Session ended: %date% %time%
echo ========================================

endlocal
