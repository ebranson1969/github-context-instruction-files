#!/usr/bin/env python3
"""
Python script to delete the .github folder and all its contents from project root.
Simple cleanup script to remove the entire .github directory.
"""
import os
import shutil
import sys
from datetime import datetime

def log_message(message):
    timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    print(f"[{timestamp}] {message}")

def delete_files():
    print("=" * 50)
    print("Delete GitHub Folder - Python Version")
    print("=" * 50)
    log_message("Session started")

    github_dir = ".github"

    if not os.path.exists(github_dir):
        log_message(f"Warning: {github_dir} directory not found")
        log_message("Nothing to delete")
        log_message("Session ended")
        sys.exit(0)

    # Delete the entire .github directory
    print()
    log_message("Deleting .github directory and all its contents...")

    try:
        shutil.rmtree(github_dir)
        # Verify deletion was successful
        if not os.path.exists(github_dir):
            log_message(f"Successfully deleted: {github_dir}")
            print(f"Deleted: {github_dir} (entire directory)")
        else:
            log_message(f"Error: {github_dir} directory still exists after deletion attempt")
            sys.exit(1)
    except Exception as e:
        log_message(f"Error: Could not delete {github_dir}: {e}")
        sys.exit(1)

    print()
    print("=" * 50)
    print("Deletion Summary:")
    print("- Deleted entire .github directory and all contents")
    log_message("Session ended")
    print("=" * 50)

if __name__ == "__main__":
    delete_files()
