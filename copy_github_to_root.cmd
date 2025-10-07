@echo off
setlocal enabledelayedexpansion
set "src_dir=.github"
set "dest_dir=."
for /r "%src_dir%" %%F in (*) do (
    set "file=%%F"
    set "rel_path=!file:%src_dir%=!"
    set "dest_file=%dest_dir%!rel_path!"
    set "dest_dirname=!dest_file!"
    for %%A in (!dest_file!) do set "dest_dirname=%%~dpA"
    if not exist "!dest_dirname!" mkdir "!dest_dirname!"
    copy /Y "%%F" "!dest_file!" >nul
)
echo Successfully copied .github contents to project root
endlocal
import os
import shutil

src_dir = '.github'
dest_dir = '.'

for root, dirs, files in os.walk(src_dir):
    rel_path = os.path.relpath(root, src_dir)
    target_root = os.path.join(dest_dir, rel_path) if rel_path != '.' else dest_dir
    # Only create target dir if it will contain files
    if files:
        os.makedirs(target_root, exist_ok=True)
    for file in files:
        src_file = os.path.join(root, file)
        dest_file = os.path.join(target_root, file)
        shutil.copy2(src_file, dest_file)
print('Successfully copied .github contents to project root')

