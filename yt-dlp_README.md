# Install yt-dlp global

## Debian Based
sudo apt install pipx ffmpeg
pipx ensurepath
pipx install "yt-dlp[defaults]" or pipx install --pip-args=--pre "yt-dlp[default]" --force


## MacOS 
brew install pipx ffmpeg
pipx ensurepath 
pipx install "yt-dlp[defaults]" or pipx install --pip-args=--pre "yt-dlp[default]" --force


## Windows
winget install pypa.pipx ffmpeg
pipx ensurepath
pipx install "yt-dlp[defaults]" or pipx install --pip-args=--pre "yt-dlp[default]" --force


### Updating 
pipx upgrade yt-dlp 
