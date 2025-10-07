#!/bin/zsh
# Zsh script to copy all files from .github directory to project root.
# Replicates Gradle clean build functionality without git operations.

set -e

src_dir=".github"
dest_dir="."

if [[ ! -d "$src_dir" ]]; then
    echo "Error: $src_dir directory not found"
    exit 1
fi

echo "Copying files from $src_dir to project root..."

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
    cp -f "$src_file" "$dest_file"
    echo "Copied: $src_file -> $dest_file"
    ((copied_files++))
done

echo "Successfully copied files from .github to project root"
