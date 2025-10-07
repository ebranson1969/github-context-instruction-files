#!/bin/zsh
# Zsh script to copy .github files to project root.
# Simple file copying without git operations.

set -e

log_message() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1"
}

echo "=================================================="
echo "File Copy Script - Zsh Version"
echo "=================================================="
log_message "Session started"

# Copy files from .github to project root
echo
log_message "Copying files from .github to project root..."

src_dir=".github"
dest_dir="."

if [[ ! -d "$src_dir" ]]; then
    log_message "Error: $src_dir directory not found"
    log_message "Session ended with error"
    exit 1
fi

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
echo "- Files copied from .github to project root"
log_message "Session ended"
echo "=================================================="
