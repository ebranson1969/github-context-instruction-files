#!/bin/bash
# Bash script to delete the .github folder and all its contents from project root.
# Simple cleanup script to remove the entire .github directory.

set -e

log_message() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1"
}

echo "=================================================="
echo "Delete GitHub Folder - Bash Version"
echo "=================================================="
log_message "Session started"

github_dir=".github"

if [ ! -d "$github_dir" ]; then
    log_message "Warning: $github_dir directory not found"
    log_message "Nothing to delete"
    log_message "Session ended"
    exit 0
fi

# Delete the entire .github directory
echo
log_message "Deleting .github directory and all its contents..."

if rm -rf "$github_dir"; then
    # Verify deletion was successful
    if [ ! -d "$github_dir" ]; then
        log_message "Successfully deleted: $github_dir"
        echo "Deleted: $github_dir (entire directory)"
    else
        log_message "Error: $github_dir directory still exists after deletion attempt"
        exit 1
    fi
else
    log_message "Error: Could not delete $github_dir"
    exit 1
fi

echo
echo "=================================================="
echo "Deletion Summary:"
echo "- Deleted entire .github directory and all contents"
log_message "Session ended"
echo "=================================================="
