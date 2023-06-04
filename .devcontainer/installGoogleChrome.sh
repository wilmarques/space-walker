#!/bin/bash

# Install Google Chrome as its required for Flutter Web

# Go to $HOME
cd $HOME

# Download Google Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O google-chrome.deb
# Install Google Chrome
sudo apt install -y ./google-chrome.deb
# Remove Google Chrome downloaded file
rm -rf google-chrome.deb

# Return to previous dir
cd -
