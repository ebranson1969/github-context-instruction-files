#!/usr/bin/env python3
"""
Python script to copy .github files from .github/.github to .github.
Simple file copying without git operations, with cleanup of existing files and timestamp updates.
"""
import os
import shutil
import sys
import re
from datetime import datetime

def log_message(message):
    timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    print(f"[{timestamp}] {message}")

def update_file_timestamps(file_path, current_datetime):
    """Update date/time patterns in the file content"""
    try:
        with open(file_path, 'r', encoding='utf-8', errors='ignore') as f:
            content = f.read()

        # Replace date patterns (YYYY-MM-DD and YYYY-MM-DD HH:MM:SS)
        updated_content = re.sub(r'\d{4}-\d{2}-\d{2}(?:\s+\d{2}:\d{2}:\d{2})?', current_datetime, content)

        with open(file_path, 'w', encoding='utf-8') as f:
            f.write(updated_content)

        return True
    except Exception as e:
        log_message(f"Warning: Could not update timestamps in {file_path}: {e}")
        return False

def copy_files():
    print("=" * 50)
    print("File Copy Script - Python Version")
    print("=" * 50)
    log_message("Session started")

    src_dir = os.path.join('github', '.github')
    dest_dir = '.github'

    # Get current datetime
    current_datetime = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    log_message(f"Current date/time for updates: {current_datetime}")

    if not os.path.exists(src_dir):
        log_message(f"Error: {src_dir} directory not found")
        log_message("Session ended with error")
        sys.exit(1)

    # Step 1: Clean up existing copied files
    print()
    log_message("Step 1: Cleaning up existing .github directory...")

    cleaned_files = 0

    # Delete the entire .github directory if it exists
    if os.path.exists('.github'):
        log_message("Deleting .github directory and all its contents...")
        try:
            shutil.rmtree('.github')
            # Verify deletion was successful
            if not os.path.exists('.github'):
                log_message("Successfully deleted: .github (entire directory)")
                cleaned_files = 1
            else:
                log_message("Error: .github directory still exists after deletion attempt")
                sys.exit(1)
        except Exception as e:
            log_message(f"Error: Could not delete .github directory: {e}")
            sys.exit(1)
    else:
        log_message("No .github directory found to delete")

    log_message(f"Cleanup completed")

    # Step 2: Copy files from .github to project root with timestamp updates
    print()
    log_message("Step 2: Copying files from .github to project root with timestamp updates...")

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

            # Handle only the root .github/README.md specially
            if file.lower() == 'readme.md' and rel_path == '.':
                dest_file = os.path.join(dest_dir, 'github-context-readme.md')
                rename_note = " (renamed)"
            else:
                dest_file = os.path.join(target_dir, file)
                rename_note = ""

            try:
                shutil.copy2(src_file, dest_file)

                # Update timestamps in the copied file
                if update_file_timestamps(dest_file, current_datetime):
                    log_message(f"Copied and updated timestamps: {src_file} -> {dest_file}{rename_note}")
                else:
                    log_message(f"Copied (timestamp update failed): {src_file} -> {dest_file}{rename_note}")

                copied_files += 1
            except Exception as e:
                log_message(f"Error copying {src_file}: {e}")

    print()
    print("=" * 50)
    print("Session Summary:")
    print(f"- Files cleaned up: {cleaned_files}")
    print(f"- Files copied with timestamp updates: {copied_files}")
    print(f"- Root .github/README.md renamed to github-context-readme.md")
    print(f"- Updated to current date/time: {current_datetime}")
    log_message("Session ended")
    print("=" * 50)

if __name__ == "__main__":
    copy_files()
