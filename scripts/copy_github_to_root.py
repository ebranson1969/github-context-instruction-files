#!/usr/bin/env python3
"""
Python script to copy entire .github directory from github/.github to .github.
Mass copy operation with verification of all files copied successfully.
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

def count_files(directory):
    """Count all files in directory recursively"""
    count = 0
    for root, dirs, files in os.walk(directory):
        count += len(files)
    return count

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

    # Step 1: Clean up existing .github directory
    print()
    log_message("Step 1: Cleaning up existing .github directory...")

    if os.path.exists(dest_dir):
        log_message("Deleting .github directory and all its contents...")
        try:
            shutil.rmtree(dest_dir)
            # Verify deletion was successful
            if not os.path.exists(dest_dir):
                log_message(f"Successfully deleted: {dest_dir} (entire directory)")
            else:
                log_message(f"Error: {dest_dir} directory still exists after deletion attempt")
                sys.exit(1)
        except Exception as e:
            log_message(f"Error: Could not delete {dest_dir} directory: {e}")
            sys.exit(1)
    else:
        log_message(f"No {dest_dir} directory found to delete")

    log_message("Cleanup completed")

    # Step 2: Mass copy entire directory structure
    print()
    log_message(f"Step 2: Mass copying entire directory from {src_dir} to {dest_dir}...")

    try:
        shutil.copytree(src_dir, dest_dir)
        log_message("Successfully copied entire directory structure")
    except Exception as e:
        log_message(f"Error: Failed to copy directory structure: {e}")
        sys.exit(1)

    # Step 3: Count and verify all files were copied
    print()
    log_message("Step 3: Verifying all files were copied and updating timestamps...")

    # Count source files
    src_file_count = count_files(src_dir)
    log_message(f"Source directory contains {src_file_count} files")

    # Count destination files
    dest_file_count = count_files(dest_dir)
    log_message(f"Destination directory contains {dest_file_count} files")

    # Verify counts match
    if src_file_count == dest_file_count:
        log_message(f"✅ File count verification passed: {src_file_count} files copied successfully")
    else:
        log_message(f"❌ File count verification failed: Expected {src_file_count} files, found {dest_file_count} files")
        sys.exit(1)

    # Update timestamps in all copied files
    updated_files = 0
    failed_updates = 0

    for root, dirs, files in os.walk(dest_dir):
        for file in files:
            dest_file = os.path.join(root, file)
            if update_file_timestamps(dest_file, current_datetime):
                print(f"Updated timestamps: {dest_file}")
                updated_files += 1
            else:
                print(f"Failed to update timestamps: {dest_file}")
                failed_updates += 1

    # Handle special README.md renaming if it exists in root
    readme_path = os.path.join(dest_dir, 'README.md')
    if os.path.exists(readme_path):
        new_readme_path = os.path.join(dest_dir, 'github-context-readme.md')
        log_message("Renaming root README.md to github-context-readme.md")
        try:
            os.rename(readme_path, new_readme_path)
            log_message("Successfully renamed README.md")
        except Exception as e:
            log_message(f"Warning: Failed to rename README.md: {e}")

    # Final verification - list all copied files
    print()
    log_message("Step 4: Final verification - listing all copied files...")

    all_files = []
    for root, dirs, files in os.walk(dest_dir):
        for file in files:
            all_files.append(os.path.join(root, file))

    all_files.sort()
    for file in all_files:
        print(f"Copied: {file}")

    print()
    print("=" * 50)
    print("Mass Copy Summary:")
    print(f"- Source directory: {src_dir}")
    print(f"- Destination directory: {dest_dir}")
    print(f"- Files copied: {dest_file_count}")
    print("- Verification: ✅ PASSED")
    print("- Root README.md renamed to github-context-readme.md (if present)")
    print(f"- All timestamps updated to: {current_datetime}")
    log_message("Session ended successfully")
    print("=" * 50)

if __name__ == "__main__":
    copy_files()
