#!/bin/bash

# Install Android SDK and its dependencies
# Relying on Java pre-installed in the container config

# Go to $HOME
cd $HOME

# Create Android Home dir on $HOME
# mkdir -p $HOME/.androidsdk
# Set Android Home dir to .androidsdk on $HOME
# export ANDROID_HOME=$HOME/.androidsdk
# Include Android tools to PATH on .bashrc
echo 'export PATH="$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools"' >> ~/.bashrc
# Refresh .bashrc
source $HOME/.bashrc

# Download Android SDK Manager CLI
wget https://dl.google.com/android/repository/commandlinetools-linux-9477386_latest.zip -O sdkmanager.zip
# Extract sdkmanager.zip to Android Home dir
unzip sdkmanager.zip -d $ANDROID_HOME
# Remove sdkmanager.zip
rm -rf sdkmanager.zip
# Enable Android Platform Tools and Build Tools
yes | sdkmanager "platform-tools" "build-tools;$ANDROID_BUILD_TOOLS_VERSION" "platforms;android-$ANDROID_PLATFORM_VERSION"
# Accept Android licenses (required for sdkmanager)
yes | sdkmanager --licenses

# Return to previous dir
cd -
