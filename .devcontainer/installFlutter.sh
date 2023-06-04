#!/bin/bash

# Install Flutter and its dependencies
# Ready for Android, Web and Linux desktop

# Go to $HOME
cd $HOME

# Update apt package
sudo apt update

# Install Flutter dependencies not available in the base image (Ubuntu)
sudo apt install -y xz-utils libglu1-mesa

# Install Flutter for Linux desktop dependencies not available in the base image (Ubuntu)
sudo apt install -y ninja-build libgtk-3-dev

# Install Google Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O google-chrome.deb
sudo apt install -y ./google-chrome.deb
rm -rf google-chrome.deb

# Download Flutter 3.10.3 for Linux naming the file as flutter.tar.xz
wget "https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_$FLUTTER_VERSION-stable.tar.xz" -O flutter.tar.xz
# Extract flutter.tar.xz
tar -xf flutter.tar.xz
# Rename flutter dir to .flutter
mv flutter .flutter
# Add flutter bin to PATH
echo 'export PATH="$PATH:$HOME/.flutter/bin"' >> ~/.bashrc

# Return to previous dir
cd -
