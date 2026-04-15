# yt-dlp Script Useage


## Install yt-dlp global


### Debian
```
sudo apt update && sudo apt upgrade -y

sudo apt install pipx ffmpeg  -y

source ~/.bashrc 

pipx ensurepath

pipx install "yt-dlp[default]" 

or 

pipx install "yt-dlp[default]" --pip-args="--pre" --force (Pre-release version)
```


### MacOS 
```
brew install pipx ffmpeg

pipx ensurepath

pipx install "yt-dlp[default]" 

or 

pipx install "yt-dlp[default]" --pip-args="--pre" --force (Pre-release version)
```


### Windows
#### Using Git Bash 
```
winget install pypa.pipx
winget install ffmpeg

source ~/.bashrc

pipx ensurepath

pipx install "yt-dlp[default]" 

or 

pipx install "yt-dlp[default]" --pip-args="--pre" --force (Pre-release version)
```
#### Using Windows WSL 
```
sudo apt update && sudo apt upgrade -y

sudo apt install python3-pip python3-venv -y

python3 -m pip install --user pipx

python3 -m pipx ensurepath

source ~/.bashrc

pipx install "yt-dlp[default]" 

or 

pipx install "yt-dlp[default]" --pip-args="--pre" --forcee (Pre-release version)
```
### Updating 
```
pipx upgrade yt-dlp 
```
## URL List File Example

```
https://www.youtube.com/@Soundgarden
https://www.youtube.com/@RainbowKittenSurprise
https://www.youtube.com/@theweeks
```
