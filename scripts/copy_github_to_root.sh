#!/bin/bash
# Bash script to copy .github files from .github/.github to .github.
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

src_dir="github/.github"
dest_dir=".github"

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
log_message "Step 1: Cleaning up existing .github directory..."

cleaned_files=0

# Delete the entire .github directory if it exists
if [ -d ".github" ]; then
    log_message "Deleting .github directory and all its contents..."
    if rm -rf ".github"; then
        # Verify deletion was successful
        if [ ! -d ".github" ]; then
            log_message "Successfully deleted: .github (entire directory)"
            cleaned_files=1
        else
            log_message "Error: .github directory still exists after deletion attempt"
            exit 1
        fi
    else
        log_message "Error: Could not delete .github directory"
        exit 1
    fi
else
    log_message "No .github directory found to delete"
fi

log_message "Cleanup completed"

# Step 2: Copy files from .github to project root with timestamp updates
echo
log_message "Step 2: Copying files from .github to project root with timestamp updates..."

copied_files=0
find "$src_dir" -type f | while IFS= read -r src_file; do
    filename=$(basename "$src_file")
    src_dir_path=$(dirname "$src_file")

    # Handle .github/README.md specially
    if [ "$filename" = "README.md" ] && [ "$src_dir_path" = "$src_dir" ]; then
        dest_file="$dest_dir/github-context-readme.md"
        rename_note=" (renamed)"
    else
        # Calculate relative path for other files
        rel_path="${src_file#$src_dir/}"
        dest_file="$dest_dir/$rel_path"
        dest_dirname="$(dirname "$dest_file")"
        rename_note=""

        # Create destination directory if it doesn't exist
        if [ ! -d "$dest_dirname" ]; then
            mkdir -p "$dest_dirname"
        fi
    fi

    # Copy file with overwrite
    if cp -f "$src_file" "$dest_file"; then
        # Update timestamps in the copied file
        if update_file_timestamps "$dest_file" "$current_datetime"; then
            echo "Copied and updated timestamps: $src_file -> $dest_file$rename_note"
        else
            echo "Copied (timestamp update failed): $src_file -> $dest_file$rename_note"
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
echo "- .github/README.md renamed to github-context-readme.md"
echo "- Updated to current date/time: $current_datetime"
log_message "Session ended"
echo "=================================================="
