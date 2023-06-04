#!/bin/bash

# Move into .devcontainer dir
cd .devcontainer

# Install Android SDK
./installAndroidSdk.sh

# Install Google Chrome
./installGoogleChrome.sh

# Install Flutter
./installFlutter.sh
