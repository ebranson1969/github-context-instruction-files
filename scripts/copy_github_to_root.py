#!/usr/bin/env python3
"""
Python script to copy .github files to project root.
Simple file copying without git operations, with cleanup of existing files.
"""
import os
import shutil
import sys
from datetime import datetime

def log_message(message):
    timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    print(f"[{timestamp}] {message}")

def copy_files():
    print("=" * 50)
    print("File Copy Script - Python Version")
    print("=" * 50)
    log_message("Session started")

    src_dir = '.github'
    dest_dir = '.'
    
    if not os.path.exists(src_dir):
        log_message(f"Error: {src_dir} directory not found")
        log_message("Session ended with error")
        sys.exit(1)

    # Step 1: Clean up existing copied files
    print()
    log_message("Step 1: Cleaning up existing copied files and directories...")

    cleaned_files = 0
    for root, dirs, files in os.walk(src_dir):
        rel_path = os.path.relpath(root, src_dir)

        if rel_path == '.':
            target_dir = dest_dir
        else:
            target_dir = os.path.join(dest_dir, rel_path)

        # Delete existing files
        for file in files:
            dest_file = os.path.join(target_dir, file)
            if os.path.exists(dest_file):
                try:
                    os.remove(dest_file)
                    log_message(f"Deleted: {dest_file}")
                    cleaned_files += 1
                except Exception as e:
                    log_message(f"Warning: Could not delete {dest_file}: {e}")

    # Clean up directories that might have been created from previous copies
    for dir_name in ['instructions', 'prompts']:
        dir_path = os.path.join(dest_dir, dir_name)
        if os.path.exists(dir_path) and os.path.isdir(dir_path):
            try:
                shutil.rmtree(dir_path)
                log_message(f"Removed directory: {dir_path}")
            except Exception as e:
                log_message(f"Warning: Could not remove directory {dir_path}: {e}")

    log_message(f"Cleaned up {cleaned_files} files and directories")

    # Step 2: Copy files from .github to project root
    print()
    log_message("Step 2: Copying files from .github to project root...")

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
                log_message(f"Copied: {src_file} -> {dest_file}")
            except Exception as e:
                log_message(f"Error copying {src_file}: {e}")

    print()
    print("=" * 50)
    print("Session Summary:")
    print(f"- Files cleaned up: {cleaned_files}")
    print(f"- Files copied: {copied_files}")
    log_message("Session ended")
    print("=" * 50)

if __name__ == "__main__":
    copy_files()
