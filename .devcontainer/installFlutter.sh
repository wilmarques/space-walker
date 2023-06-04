#!/bin/bash

# Install Flutter dependencies
sudo apt update
sudo apt install -y curl git unzip xz-utils zip libglu1-mesa

# Install Flutter for Linux desktop dependencies
sudo apt install -y clang cmake ninja-build pkg-config libgtk-3-dev

# Go to home dir
cd $HOME

# Download Flutter 3.10.3 for Linux naming the file as flutter.tar.xz
wget https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.10.3-stable.tar.xz -O flutter.tar.xz
# Extract flutter.tar.xz to $HOME
tar -xf flutter.tar.xz
# Rename flutter dir to .flutter
mv flutter .flutter
# Add flutter to PATH
echo 'export PATH="$PATH:$HOME/.flutter/bin"' >> ~/.bashrc
