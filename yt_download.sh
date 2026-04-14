 1   │ #!/bin/bash
   2   │ 
   3   │ # 1. Configuration
   4   │ MUSIC_DIR="(YOUR DIRECTORY)"
   5   │ URL_FILE="(URL LIST FILE)"
   6   │ ARCHIVE_FILE_1="$MUSIC_DIR/archive.txt"
         # Extra Archive files
   7   │ # ARCHIVE_FILE_2="$MUSIC_DIR/download_archive.txt"
   8   │ # ARCHIVE_FILE_3="$MUSIC_DIR/downloaded_archive.txt" 
   9   │ 
  10   │ # 2. Setup
  11   │ mkdir -p "$MUSIC_DIR"
  12   │ 
  13   │ # 3. Installation Check
  14   │ if ! command -v yt-dlp &> /dev/null; then
  15   │     echo "Installing yt-dlp..."
  16   │     sudo curl -L https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -o /usr/local/bin/yt-dlp
  17   │     sudo chmod a+rx /usr/local/bin/yt-dlp
  18   │ fi
  19   │ 
  20   │ # 4. The Download Command
  21   │ echo "Starting"
  22   │ 
  23   │ yt-dlp \
  24   │     --extract-audio \
  25   │     --audio-format mp3 \
  26   │     --audio-quality 0 \
  27   │     \
  28   │     --min-sleep-interval 15 \
  29   │     --max-sleep-interval 60 \
  30   │     --sleep-interval 5 \
  31   │     --max-sleep-interval 15 \
  32   │     \
  33   │     --limit-rate 1M \
  34   │     \
  35   │     --batch-file "$URL_FILE" \
  36   │     --download-archive "$ARCHIVE_FILE_1" \
           # Extra Archive File Useage 
  37   │   # --download-archive "$ARCHIVE_FILE_2" \
  38   │   # --download-archive "$ARCHIVE_FILE_3" \
  39   │     \
  40   │     --output "$MUSIC_DIR/%(uploader,artist)s/%(album)s/%(title)s.%(ext)s" \
  41   │     --ignore-errors \
  42   │     --no-post-overwrites
  43   │ 
  44   │ echo "Done"
