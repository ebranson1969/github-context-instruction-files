#!/bin/bash
# Bash script to copy .github files to project root.
# Simple file copying without git operations, with cleanup of existing files and timestamp updates.

set -e

log_message() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1"
}

update_file_timestamps() {
    local file_path="$1"
    local current_datetime="$2"

    # Update date patterns (YYYY-MM-DD and YYYY-MM-DD HH:MM:SS) in the file
    if sed -i.bak "s/[0-9]\{4\}-[0-9]\{2\}-[0-9]\{2\}\( [0-9]\{2\}:[0-9]\{2\}:[0-9]\{2\}\)\?/$current_datetime/g" "$file_path" 2>/dev/null; then
        rm -f "$file_path.bak" 2>/dev/null
        return 0
    else
        rm -f "$file_path.bak" 2>/dev/null
        return 1
    fi
}

echo "=================================================="
echo "File Copy Script - Bash Version"
echo "=================================================="
log_message "Session started"

src_dir=".github"
dest_dir="."

# Get current datetime
current_datetime=$(date '+%Y-%m-%d %H:%M:%S')
log_message "Current date/time for updates: $current_datetime"

if [ ! -d "$src_dir" ]; then
    log_message "Error: $src_dir directory not found"
    log_message "Session ended with error"
    exit 1
fi

# Step 1: Clean up existing copied files and directories
echo
log_message "Step 1: Cleaning up existing copied files and directories..."

cleaned_files=0
find "$src_dir" -type f | while IFS= read -r src_file; do
    # Calculate relative path
    rel_path="${src_file#$src_dir/}"
    dest_file="$dest_dir/$rel_path"

    # Delete existing file if it exists
    if [ -f "$dest_file" ]; then
        if rm -f "$dest_file"; then
            echo "Deleted: $dest_file"
            ((cleaned_files++))
        else
            log_message "Warning: Could not delete $dest_file"
        fi
    fi
done

# Clean up directories that might have been created from previous copies
for dir_name in "instructions" "prompts"; do
    if [ -d "$dest_dir/$dir_name" ]; then
        log_message "Removing directory: $dest_dir/$dir_name"
        rm -rf "$dest_dir/$dir_name"
    fi
done

log_message "Cleaned up existing files and directories"

# Step 2: Copy files from .github to project root with timestamp updates
echo
log_message "Step 2: Copying files from .github to project root with timestamp updates..."

copied_files=0
find "$src_dir" -type f | while IFS= read -r src_file; do
    # Calculate relative path
    rel_path="${src_file#$src_dir/}"
    dest_file="$dest_dir/$rel_path"
    dest_dirname="$(dirname "$dest_file")"

    # Create destination directory if it doesn't exist
    if [ ! -d "$dest_dirname" ]; then
        mkdir -p "$dest_dirname"
    fi

    # Copy file with overwrite
    if cp -f "$src_file" "$dest_file"; then
        # Update timestamps in the copied file
        if update_file_timestamps "$dest_file" "$current_datetime"; then
            echo "Copied and updated timestamps: $src_file -> $dest_file"
        else
            echo "Copied (timestamp update failed): $src_file -> $dest_file"
        fi
        ((copied_files++))
    else
        log_message "Error copying: $src_file"
    fi
done

echo
echo "=================================================="
echo "Session Summary:"
echo "- Cleaned up existing files and directories"
echo "- Files copied with timestamp updates"
echo "- Updated to current date/time: $current_datetime"
log_message "Session ended"
echo "=================================================="
