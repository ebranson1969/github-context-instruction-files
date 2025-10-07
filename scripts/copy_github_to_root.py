#!/usr/bin/env python3
"""
Python script to reset branch to master state and copy .github files to project root.
Enhanced version with git reset functionality and session logging.
"""
import os
import shutil
import sys
import subprocess
from datetime import datetime

def log_message(message):
    timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    print(f"[{timestamp}] {message}")

def run_git_command(command, error_message):
    """Run git command and handle errors"""
    try:
        result = subprocess.run(command, shell=True, check=True, capture_output=True, text=True)
        return True, result.stdout.strip()
    except subprocess.CalledProcessError as e:
        log_message(f"Error: {error_message}")
        log_message(f"Command failed: {command}")
        log_message(f"Error output: {e.stderr.strip()}")
        return False, e.stderr.strip()

def reset_branch_and_copy():
    print("=" * 50)
    print("Git Reset and Copy Script - Python Version")
    print("=" * 50)
    log_message("Session started")

    # Step 1: Switch to master branch
    print()
    log_message("Step 1: Switching to master branch...")
    success, output = run_git_command("git checkout master", "Failed to switch to master branch")
    if not success:
        log_message("Session ended with error")
        sys.exit(1)
    log_message("Successfully switched to master branch")

    # Step 2: Fetch from origin and reset to origin/master
    print()
    log_message("Step 2: Resetting to origin/master...")
    log_message("This will revert all changes, remove new files, and restore deleted files")

    # Fetch latest from origin
    success, output = run_git_command("git fetch origin", "Failed to fetch from origin")
    if not success:
        log_message("Session ended with error")
        sys.exit(1)

    # Hard reset to origin/master
    success, output = run_git_command("git reset --hard origin/master", "Failed to reset to origin/master")
    if not success:
        log_message("Session ended with error")
        sys.exit(1)
    log_message("Successfully reset to origin/master")

    # Step 3: Clean untracked files and directories
    print()
    log_message("Step 3: Cleaning untracked files and directories...")
    success, output = run_git_command("git clean -fd", "Git clean had issues")
    if not success:
        log_message("Warning: Git clean had issues, continuing...")

    # Step 4: Copy files from .github to project root
    print()
    log_message("Step 4: Copying files from .github to project root...")

    src_dir = '.github'
    dest_dir = '.'
    
    if not os.path.exists(src_dir):
        log_message(f"Error: {src_dir} directory not found")
        log_message("Session ended with error")
        sys.exit(1)
    
    copied_files = 0
    for root, dirs, files in os.walk(src_dir):
        # Calculate relative path from source directory
        rel_path = os.path.relpath(root, src_dir)
        
        # Determine target directory
        if rel_path == '.':
            target_dir = dest_dir
        else:
            target_dir = os.path.join(dest_dir, rel_path)
        
        # Create target directory if it doesn't exist and has files
        if files and not os.path.exists(target_dir):
            os.makedirs(target_dir)
        
        # Copy each file
        for file in files:
            src_file = os.path.join(root, file)
            dest_file = os.path.join(target_dir, file)
            
            try:
                shutil.copy2(src_file, dest_file)
                copied_files += 1
                print(f"Copied: {src_file} -> {dest_file}")
            except Exception as e:
                log_message(f"Error copying {src_file}: {e}")

    print()
    print("=" * 50)
    print("Session Summary:")
    print("- Branch reset to origin/master: SUCCESS")
    print(f"- Files copied: {copied_files}")
    log_message("Session ended successfully")
    print("=" * 50)

if __name__ == "__main__":
    reset_branch_and_copy()
