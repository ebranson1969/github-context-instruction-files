#!/bin/bash
set -e
src_dir=".github"
dest_dir="."
find "$src_dir" -type f | while read src_file; do
    rel_path="${src_file#$src_dir/}"
    dest_file="$dest_dir/$rel_path"
    dest_dirname="$(dirname "$dest_file")"
    mkdir -p "$dest_dirname"
    cp -f "$src_file" "$dest_file"
done
echo "Successfully copied .github contents to project root"

