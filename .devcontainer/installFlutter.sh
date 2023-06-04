#!/bin/bash

# Install Flutter and its dependencies
# Ready for Android, Web and Linux desktop

# Go to $HOME
cd $HOME

#### Pre config env
# Update apt package
sudo apt update
# Install Flutter dependencies not available in the base image (Ubuntu)
sudo apt install -y xz-utils libglu1-mesa
# Install Flutter for Linux desktop dependencies not available in the base image (Ubuntu)
sudo apt install -y cmake clang ninja-build libgtk-3-dev

#### Install Flutter
# Download Flutter for Linux
wget "https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_$FLUTTER_VERSION-stable.tar.xz" -O flutter.tar.xz
# Extract flutter.tar.xz
tar -xf flutter.tar.xz
# Rename flutter dir to .flutter
mv flutter .flutter
# Add flutter bin to PATH
echo 'export PATH="$PATH:$HOME/.flutter/bin"' >> $HOME/.bashrc
# Refresh .bashrc
source $HOME/.bashrc
# Remove flutter.tar.xz
rm -rf flutter.tar.xz

#### Configuring Flutter
# Enable Flutter Web
flutter config --enable-web
# Enable Flutter Linux desktop
flutter config --enable-linux-desktop
# Config Android SDK for Flutter
flutter config --android-sdk $ANDROID_HOME
# Accept Flutter for Android licenses
yes | flutter doctor --android-licenses
# Precache Flutter tools
flutter precache

# Check if Flutter is working
flutter doctor

# Return to previous dir
cd -
