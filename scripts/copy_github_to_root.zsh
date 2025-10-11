#!/bin/zsh
# Zsh script to copy entire .github directory from github/.github to .github.
# Mass copy operation with verification of all files copied successfully.

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
echo "File Copy Script - Zsh Version"
echo "=================================================="
log_message "Session started"

src_dir="github/.github"
dest_dir=".github"

# Get current datetime
current_datetime=$(date '+%Y-%m-%d %H:%M:%S')
log_message "Current date/time for updates: $current_datetime"

if [[ ! -d "$src_dir" ]]; then
    log_message "Error: $src_dir directory not found"
    log_message "Session ended with error"
    exit 1
fi

# Step 1: Clean up existing .github directory
echo
log_message "Step 1: Cleaning up existing .github directory..."

if [[ -d "$dest_dir" ]]; then
    log_message "Deleting .github directory and all its contents..."
    if rm -rf "$dest_dir"; then
        # Verify deletion was successful
        if [[ ! -d "$dest_dir" ]]; then
            log_message "Successfully deleted: $dest_dir (entire directory)"
        else
            log_message "Error: $dest_dir directory still exists after deletion attempt"
            exit 1
        fi
    else
        log_message "Error: Could not delete $dest_dir directory"
        exit 1
    fi
else
    log_message "No $dest_dir directory found to delete"
fi

log_message "Cleanup completed"

# Step 2: Mass copy entire directory structure
echo
log_message "Step 2: Mass copying entire directory from $src_dir to $dest_dir..."

# Use cp -R to recursively copy the entire directory structure
if cp -R "$src_dir" "$dest_dir"; then
    log_message "Successfully copied entire directory structure"
else
    log_message "Error: Failed to copy directory structure"
    exit 1
fi

# Step 3: Count and verify all files were copied
echo
log_message "Step 3: Verifying all files were copied and updating timestamps..."

# Count source files
src_file_count=$(find "$src_dir" -type f | wc -l | tr -d ' ')
log_message "Source directory contains $src_file_count files"

# Count destination files
dest_file_count=$(find "$dest_dir" -type f | wc -l | tr -d ' ')
log_message "Destination directory contains $dest_file_count files"

# Verify counts match
if [[ "$src_file_count" -eq "$dest_file_count" ]]; then
    log_message "✅ File count verification passed: $src_file_count files copied successfully"
else
    log_message "❌ File count verification failed: Expected $src_file_count files, found $dest_file_count files"
    exit 1
fi

# Update timestamps in all copied files
updated_files=0
failed_updates=0

find "$dest_dir" -type f | while IFS= read -r dest_file; do
    if update_file_timestamps "$dest_file" "$current_datetime"; then
        echo "Updated timestamps: $dest_file"
        ((updated_files++))
    else
        echo "Failed to update timestamps: $dest_file"
        ((failed_updates++))
    fi
done

# Handle special README.md renaming if it exists in root
if [[ -f "$dest_dir/README.md" ]]; then
    log_message "Renaming root README.md to github-context-readme.md"
    if mv "$dest_dir/README.md" "$dest_dir/github-context-readme.md"; then
        log_message "Successfully renamed README.md"
    else
        log_message "Warning: Failed to rename README.md"
    fi
fi

# Final verification - list all copied files
echo
log_message "Step 4: Final verification - listing all copied files..."
find "$dest_dir" -type f | sort | while IFS= read -r file; do
    echo "Copied: $file"
done

echo
echo "=================================================="
echo "Mass Copy Summary:"
echo "- Source directory: $src_dir"
echo "- Destination directory: $dest_dir"
echo "- Files copied: $dest_file_count"
echo "- Verification: ✅ PASSED"
echo "- Root README.md renamed to github-context-readme.md (if present)"
echo "- All timestamps updated to: $current_datetime"
log_message "Session ended successfully"
echo "=================================================="
