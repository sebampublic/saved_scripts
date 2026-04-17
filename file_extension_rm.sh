#!/bin/bash

# --- CONFIGURATION ---
# Set to "false" to actually delete files. 
# Set to "true" to only print what would happen.
DRY_RUN=true

# Extensions
KEEP_EXT="m4a"
DELETE_EXT="mp3"

echo "Scanning for .$DELETE_EXT files where .$KEEP_EXT exists..."
[ "$DRY_RUN" = true ] && echo "--- DRY RUN ACTIVE: No files will be deleted ---"

# Find all .m4a files safely (handles spaces/special chars)
find . -type f -name "*.$KEEP_EXT" -print0 | while IFS= read -r -d '' keep_file; do
    
    # Remove extension to get base path
    base_path="${keep_file%.$KEEP_EXT}"
    
    # Construct matching .mp3 filename
    delete_file="${base_path}.$DELETE_EXT"

    # If matching .mp3 exists, delete it
    if [ -f "$delete_file" ]; then
        if [ "$DRY_RUN" = true ]; then
            echo "[WOULD DELETE] $delete_file (Found matching .$KEEP_EXT)"
        else
            echo "[DELETING] $delete_file"
            rm "$delete_file"
        fi
    fi
done

echo "Done."
