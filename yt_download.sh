#!/bin/bash

# 1. Configuration
MUSIC_DIR="(YOUR DIRECTORY)"
URL_FILE="(URL LIST FILE)"
ARCHIVE_FILE_1="$MUSIC_DIR/archive.txt"

# Extra Archive files
# ARCHIVE_FILE_2="$MUSIC_DIR/download_archive.txt"
# ARCHIVE_FILE_3="$MUSIC_DIR/downloaded_archive.txt"

# 2. Setup
mkdir -p "$MUSIC_DIR"

# 3. Installation Check
if ! command -v yt-dlp &> /dev/null; then
    echo "Installing yt-dlp..."
    sudo curl -L https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -o /usr/local/bin/yt-dlp
    sudo chmod a+rx /usr/local/bin/yt-dlp
fi

# 4. The Download Command
echo "Starting"

yt-dlp \
    --extract-audio \
    --audio-format mp3 \
    --audio-quality 0 \
    \
    --min-sleep-interval 15 \
    --max-sleep-interval 60 \
    --sleep-interval 5 \
    --max-sleep-interval 15 \
    \
    --limit-rate 1M \
    \
    --batch-file "$URL_FILE" \
    --download-archive "$ARCHIVE_FILE_1" \
    # Extra Archive File Usage 
    # --download-archive "$ARCHIVE_FILE_2" \
    # --download-archive "$ARCHIVE_FILE_3" \
    \
    --output "$MUSIC_DIR/%(uploader,artist)s/%(album)s/%(title)s.%(ext)s" \
    --ignore-errors \
    --no-post-overwrites

echo "Done"
