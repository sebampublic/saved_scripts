#!/bin/bash

# Configuration

# Set to "false" to actually delete files.

# Set to "true" to run a print test

DRY_RUN=true

# ========================
# Extensions (all work) 
# ========================

KEEP_EXT="m4a"
DELETE_EXT="mp3"

# ========================
# File removal method 
# ========================

FRM=(rm -f) #(shred -u) (rm -f) (srm -fz)  

echo "Scanning for .$DELETE_EXT files where .$KEEP_EXT exists..."
[ "$DRY_RUN" = true ] && echo "--- DRY RUN ACTIVE: No files will be deleted ---"

# ============================================
# Find all .$KEEP_EXT files safely
# ============================================

find . -type f -name "*.$KEEP_EXT" -print0 | while IFS= read -r -d '' keep_file; do

# ============================================
# Remove extension to get base path
# ============================================

base_path="${keep_file%.$KEEP_EXT}"

# ============================================
# Construct matching .$DELETE_EXT filename
# ============================================

delete_file="${base_path}.$DELETE_EXT"

# ============================================
# If matching file exists, delete it
# ============================================

if [ -f "$delete_file" ]; then
    if [ "$DRY_RUN" = true ]; then
        echo "[WOULD DELETE] $delete_file (Found matching .$KEEP_EXT)"
    else
        echo "[DELETING] $delete_file"
        "${FRM[@]}" "$delete_file"
    fi
fi


done

echo "Done."
