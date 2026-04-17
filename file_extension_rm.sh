#!/bin/bash

# --- CONFIGURATION ---
# Set to "false" to actually delete files. 
# Set to "true" to only print what would happen.
DRY_RUN=true

# Extensions to look for
TARGET_EXT="mp3"
KEEP_EXT="aac"

echo "Scanning for duplicate $TARGET_EXT files where $KEEP_EXT exists..."
[ "$DRY_RUN" = true ] && echo "--- DRY RUN ACTIVE: No files will be deleted ---"

# Use find with -print0 to handle spaces and special characters in filenames safely
find . -type f -name "*.$TARGET_EXT" -print0 | while IFS= read -r -d '' mp3_file; do
    
    # Get the filename without the extension
    base_path="${mp3_file%.$TARGET_EXT}"
    
    # Construct the path for the file we want to keep
    aac_file="${base_path}.$KEEP_EXT"

    # Check if the matching .aac file exists
    if [ -f "$aac_file" ]; then
        if [ "$DRY_RUN" = true ]; then
            echo "[WOULD DELETE] $mp3_file (Found matching $KEEP_EXT)"
        else
            echo "[DELETING] $mp3_file"
            rm "$mp3_file"
        fi
    fi
done

echo "Done you goofy goober."
