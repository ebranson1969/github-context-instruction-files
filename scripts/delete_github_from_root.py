#!/usr/bin/env python3
"""
Python script to delete .github files from project root.
Simple cleanup script to remove previously copied files.
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
    print("Delete GitHub Files - Python Version")
    print("=" * 50)
    log_message("Session started")

    src_dir = '.github'
    dest_dir = '.'

    if not os.path.exists(src_dir):
        log_message(f"Warning: {src_dir} directory not found")
        log_message("Cannot determine which files to delete")
        log_message("Session ended")
        sys.exit(1)

    # Delete copied files from .github
    print()
    log_message("Deleting copied files from .github directory...")

    deleted_files = 0

    # Delete the specially renamed README file
    github_readme_dest = os.path.join(dest_dir, 'github-context-readme.md')
    if os.path.exists(github_readme_dest):
        try:
            os.remove(github_readme_dest)
            log_message(f"Deleted: {github_readme_dest}")
            deleted_files += 1
        except Exception as e:
            log_message(f"Warning: Could not delete {github_readme_dest}: {e}")

    # Delete other files from .github
    for root, dirs, files in os.walk(src_dir):
        rel_path = os.path.relpath(root, src_dir)

        if rel_path == '.':
            target_dir = dest_dir
        else:
            target_dir = os.path.join(dest_dir, rel_path)

        # Delete existing files (skip only the root README.md)
        for file in files:
            # Only skip the root .github/README.md file
            if file.lower() == 'readme.md' and rel_path == '.':
                continue  # Skip the root .github/README.md file

            dest_file = os.path.join(target_dir, file)
            if os.path.exists(dest_file):
                try:
                    os.remove(dest_file)
                    log_message(f"Deleted: {dest_file}")
                    deleted_files += 1
                except Exception as e:
                    log_message(f"Warning: Could not delete {dest_file}: {e}")

    # Delete directories that might have been created from previous copies
    for dir_name in ['instructions', 'prompts']:
        dir_path = os.path.join(dest_dir, dir_name)
        if os.path.exists(dir_path) and os.path.isdir(dir_path):
            try:
                shutil.rmtree(dir_path)
                log_message(f"Removed directory: {dir_path}")
            except Exception as e:
                log_message(f"Warning: Could not remove directory {dir_path}: {e}")

    print()
    print("=" * 50)
    print("Deletion Summary:")
    print(f"- Files deleted: {deleted_files}")
    log_message("Session ended")
    print("=" * 50)

if __name__ == "__main__":
    delete_files()
