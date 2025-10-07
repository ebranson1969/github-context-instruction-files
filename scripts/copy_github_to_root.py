#!/usr/bin/env python3
"""
Python script to copy all files from .github directory to project root.
Replicates Gradle clean build functionality without git operations.
"""
import os
import shutil
import sys

def copy_github_to_root():
    src_dir = '.github'
    dest_dir = '.'
    
    if not os.path.exists(src_dir):
        print(f"Error: {src_dir} directory not found")
        sys.exit(1)
    
    print(f"Copying files from {src_dir} to project root...")
    
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
                print(f"Error copying {src_file}: {e}")
    
    print(f"Successfully copied {copied_files} files from .github to project root")

if __name__ == "__main__":
    copy_github_to_root()
