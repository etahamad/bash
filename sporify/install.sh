#!/usr/bin/bash

echo -e "Installing latest Spotify Client"
curl -sS https://download.spotify.com/debian/pubkey_0D811D58.gpg | sudo apt-key add - 
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update && sudo apt-get install spotify-client

echo -e "Installing compilers"
sudo apt-get install git gcc wget curl libcurl4-gnutls-dev

echo -e "Cloning the ad-block files"
cd $HOME/Downloads
git clone https://github.com/abba23/spotify-adblock-linux.git

echo -e "Downloading the cef chromium framework"
cd spotify-adblock-linux
wget -O cef.tar.bz2 https://cef-builds.spotifycdn.com/cef_binary_88.1.6%2Bg4fe33a1%2Bchromium-88.0.4324.96_linux64_minimal.tar.bz2

echo -e "Extracting the cef chromium framework"
tar -xf cef.tar.bz2 --wildcards '*/include' --strip-components=1

echo -e "Compiling and installing" 
make
sudo make install

echo -e "Making Item icon that runs the spotify + ad-block, you will find it in your apps menu as name [Spotify Premium]"
curl https://raw.githubusercontent.com/etahamad/mybash/main/sporify/spotify-premium.desktop > ~/.local/share/applications/spotify-premium.desktop

echo -e "My time has come, enjoy your ad-free Spotify"
sleep 3s
