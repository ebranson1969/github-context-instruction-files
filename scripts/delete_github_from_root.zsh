#!/bin/zsh
# Zsh script to delete .github files from .github.
# Simple cleanup script to remove previously copied files.

set -e

log_message() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1"
}

echo "=================================================="
echo "Delete GitHub Files - Zsh Version"
echo "=================================================="
log_message "Session started"

src_dir=".github/.github"
dest_dir=".github"

if [[ ! -d "$src_dir" ]]; then
    log_message "Warning: $src_dir directory not found"
    log_message "Cannot determine which files to delete"
    log_message "Session ended"
    exit 1
fi

# Delete copied files from .github
echo
log_message "Deleting copied files from .github directory..."

deleted_files=0

# Delete the specially renamed README file
if [[ -f "$dest_dir/github-context-readme.md" ]]; then
    if rm -f "$dest_dir/github-context-readme.md"; then
        echo "Deleted: $dest_dir/github-context-readme.md"
        ((deleted_files++))
    else
        log_message "Warning: Could not delete $dest_dir/github-context-readme.md"
    fi
fi

# Delete other files from .github (skip README.md as it gets renamed)
find $src_dir -type f | while IFS= read -r src_file; do
    filename=$(basename "$src_file")

    # Skip the .github/README.md file as it gets renamed
    if [[ "$filename" != "README.md" ]] || [[ "$(dirname "$src_file")" != "$src_dir" ]]; then
        # Calculate relative path
        rel_path="${src_file#$src_dir/}"
        dest_file="$dest_dir/$rel_path"

        # Delete existing file if it exists
        if [[ -f "$dest_file" ]]; then
            if rm -f "$dest_file"; then
                echo "Deleted: $dest_file"
                ((deleted_files++))
            else
                log_message "Warning: Could not delete $dest_file"
            fi
        fi
    fi
done

# Delete directories that might have been created from previous copies
for dir_name in "instructions" "prompts"; do
    if [[ -d "$dest_dir/$dir_name" ]]; then
        log_message "Removing directory: $dest_dir/$dir_name"
        if rm -rf "$dest_dir/$dir_name"; then
            log_message "Successfully removed directory: $dest_dir/$dir_name"
        else
            log_message "Warning: Could not remove directory: $dest_dir/$dir_name"
        fi
    fi
done

echo
echo "=================================================="
echo "Deletion Summary:"
echo "- Files deleted from project root"
log_message "Session ended"
echo "=================================================="
