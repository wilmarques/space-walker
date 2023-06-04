#!/bin/sh

# Install Android SDK and its dependencies
# Relying on Java pre-installed in the container config

# Go to $HOME
cd $HOME

export ANDROID_PLATFORM_VERSION="30"
export ANDROID_BUILD_TOOLS_VERSION="30.0.3"

# Set ANDROID_HOME variable to $HOME/.androidsdk
export ANDROID_HOME=$HOME/.androidsdk
# Create Android Home dir on $HOME
mkdir -pv $ANDROID_HOME
# Include a comment in bashrc to explain Android SDK
echo '# Android SDK' >> $HOME/.bashrc
# Include Android Home variable on .bashrc
echo 'export ANDROID_HOME="$HOME/.androidsdk"' >> $HOME/.bashrc
# Include Android SDK tools to PATH on .bashrc
echo 'export PATH="$ANDROID_HOME/emulator:$ANDROID_HOME/tools:$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/platform-tools:$PATH"' >> $HOME/.bashrc

# Download Android SDK Manager CLI
wget https://dl.google.com/android/repository/commandlinetools-linux-9477386_latest.zip -O sdkmanager.zip
# Extract sdkmanager.zip to Android Home dir
unzip sdkmanager.zip -d $ANDROID_HOME
# Remove sdkmanager.zip
rm -rf sdkmanager.zip
# Move Android SDK to latest dir
mkdir -pv $ANDROID_HOME/cmdline-tools/latest
mv $ANDROID_HOME/cmdline-tools/bin $ANDROID_HOME/cmdline-tools/latest/
mv $ANDROID_HOME/cmdline-tools/lib $ANDROID_HOME/cmdline-tools/latest/

# Enable Android Platform Tools and Build Tools
yes | $ANDROID_HOME/cmdline-tools/latest/bin/sdkmanager "platform-tools" "build-tools;$ANDROID_BUILD_TOOLS_VERSION" "platforms;android-$ANDROID_PLATFORM_VERSION"
# Accept Android licenses (required for sdkmanager)
yes | $ANDROID_HOME/cmdline-tools/latest/bin/sdkmanager --licenses

# Return to previous dir
cd -
