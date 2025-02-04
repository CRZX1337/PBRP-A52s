#!/bin/bash
set -x

# Installs the necessary Android SDK components

# Stop on error
set -e

# Check if SDK is already installed
if [ -d ~/android-sdk-linux ]; then
  echo "Android SDK already installed at ~/android-sdk-linux"
  exit 0
fi

echo "Installing Android SDK..."

# Create SDK directory
mkdir ~/android-sdk-linux

# Download SDK command-line tools
cd ~/android-sdk-linux
wget https://dl.google.com/android/repository/commandlinetools-linux-10406996_latest.zip
unzip commandlinetools-linux-10406996_latest.zip -d cmdline-tools
rm commandlinetools-linux-10406996_latest.zip

# Set SDK path
export ANDROID_SDK_ROOT=~/android-sdk-linux
echo "export ANDROID_SDK_ROOT=$ANDROID_SDK_ROOT" >> ~/.bashrc
source ~/.bashrc

# Install SDK components
"${SDK_DIR}"/cmdline-tools/bin/sdkmanager --sdk_root="${SDK_DIR}" --licenses # HIER IST DIE ÄNDERUNG: --sdk_root hinzugefügt
sdkmanager "platforms;android-31" "build-tools;31.0.0" "platform-tools"

echo "Android SDK installation complete."
