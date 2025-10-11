@echo off
REM CMD script to delete the .github folder and all its contents from project root.
REM Simple cleanup script to remove the entire .github directory.

setlocal enabledelayedexpansion

echo ========================================
echo Delete GitHub Folder - CMD Version
echo ========================================
echo Session started: %date% %time%

set "github_dir=.github"

if not exist "%github_dir%" (
    echo Warning: %github_dir% directory not found
    echo Nothing to delete
    echo Session ended: %date% %time%
    exit /b 0
)

REM Delete the entire .github directory
echo.
echo Deleting .github directory and all its contents...

rmdir /S /Q "%github_dir%" >nul 2>&1
if !errorlevel! equ 0 (
    REM Verify deletion was successful
    if not exist "%github_dir%" (
        echo Successfully deleted: %github_dir%
        echo Deleted: %github_dir% ^(entire directory^)
    ) else (
        echo Error: %github_dir% directory still exists after deletion attempt
        echo Session ended with error: %date% %time%
        exit /b 1
    )
) else (
    echo Error: Could not delete %github_dir%
    echo Session ended with error: %date% %time%
    exit /b 1
)

echo.
echo ========================================
echo Deletion Summary:
echo - Deleted entire .github directory and all contents
echo Session ended: %date% %time%
echo ========================================

endlocal
