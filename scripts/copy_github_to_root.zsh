#!/bin/zsh
# Zsh script to copy .github files to project root.
# Simple file copying without git operations, with cleanup of existing files.

set -e

log_message() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1"
}

echo "=================================================="
echo "File Copy Script - Zsh Version"
echo "=================================================="
log_message "Session started"

src_dir=".github"
dest_dir="."

if [[ ! -d "$src_dir" ]]; then
    log_message "Error: $src_dir directory not found"
    log_message "Session ended with error"
    exit 1
fi

# Step 1: Clean up existing copied files and directories
echo
log_message "Step 1: Cleaning up existing copied files and directories..."

cleaned_files=0
find $src_dir -type f | while IFS= read -r src_file; do
    # Calculate relative path
    rel_path="${src_file#$src_dir/}"
    dest_file="$dest_dir/$rel_path"

    # Delete existing file if it exists
    if [[ -f "$dest_file" ]]; then
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
    if [[ -d "$dest_dir/$dir_name" ]]; then
        log_message "Removing directory: $dest_dir/$dir_name"
        rm -rf "$dest_dir/$dir_name"
    fi
done

log_message "Cleaned up existing files and directories"

# Step 2: Copy files from .github to project root
echo
log_message "Step 2: Copying files from .github to project root..."

copied_files=0
find $src_dir -type f | while IFS= read -r src_file; do
    # Calculate relative path
    rel_path="${src_file#$src_dir/}"
    dest_file="$dest_dir/$rel_path"
    dest_dirname="$(dirname "$dest_file")"

    # Create destination directory if it doesn't exist
    if [[ ! -d "$dest_dirname" ]]; then
        mkdir -p "$dest_dirname"
    fi

    # Copy file with overwrite
    if cp -f "$src_file" "$dest_file"; then
        echo "Copied: $src_file -> $dest_file"
        ((copied_files++))
    else
        log_message "Error copying: $src_file"
    fi
done

echo
echo "=================================================="
echo "Session Summary:"
echo "- Cleaned up existing files and directories"
echo "- Files copied from .github to project root"
log_message "Session ended"
echo "=================================================="
