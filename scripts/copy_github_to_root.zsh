#!/bin/zsh
# Zsh script to reset branch to master state and copy .github files to project root.
# Enhanced version with git reset functionality and session logging.

set -e

log_message() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1"
}

run_git_command() {
    local command="$1"
    local error_msg="$2"

    if ! eval $command; then
        log_message "Error: $error_msg"
        log_message "Command failed: $command"
        log_message "Session ended with error"
        exit 1
    fi
}

echo "=================================================="
echo "Git Reset and Copy Script - Zsh Version"
echo "=================================================="
log_message "Session started"

# Step 1: Switch to master branch
echo
log_message "Step 1: Switching to master branch..."
run_git_command "git checkout master" "Failed to switch to master branch"
log_message "Successfully switched to master branch"

# Step 2: Fetch from origin and reset to origin/master
echo
log_message "Step 2: Resetting to origin/master..."
log_message "This will revert all changes, remove new files, and restore deleted files"

run_git_command "git fetch origin" "Failed to fetch from origin"
run_git_command "git reset --hard origin/master" "Failed to reset to origin/master"
log_message "Successfully reset to origin/master"

# Step 3: Clean untracked files and directories
echo
log_message "Step 3: Cleaning untracked files and directories..."
if ! git clean -fd; then
    log_message "Warning: Git clean had issues, continuing..."
fi

# Step 4: Copy files from .github to project root
echo
log_message "Step 4: Copying files from .github to project root..."

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
echo "- Branch reset to origin/master: SUCCESS"
echo "- Files copied: $copied_files"
log_message "Session ended successfully"
echo "=================================================="
