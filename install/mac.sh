#!/bin/bash

set -euo pipefail

# Set variables
REPO_OWNER="priyashpatil"
REPO_NAME="phpup"
ASSET_NAME="phpup"

# Determine system architecture
ARCH=$(uname -m)
if [ "$ARCH" = "x86_64" ]; then
    ASSET_NAME="${ASSET_NAME}-darwin-amd64"
elif [ "$ARCH" = "arm64" ]; then
    ASSET_NAME="${ASSET_NAME}-darwin-arm64"
else
    echo "Unsupported architecture: $ARCH"
    exit 1
fi

# Get the latest release tag
RELEASE_TAG=$(curl -s "https://api.github.com/repos/$REPO_OWNER/$REPO_NAME/releases/latest" |
    grep -o '"tag_name": "[^"]*' | sed 's/"tag_name": "//')

# Echo which version is being downloaded
echo -e "Downloading phpup version $RELEASE_TAG \n"

# Get the download URL for the asset
DOWNLOAD_URL=$(curl -s "https://api.github.com/repos/$REPO_OWNER/$REPO_NAME/releases/tags/$RELEASE_TAG" |
    grep -o "https://github.com/$REPO_OWNER/$REPO_NAME/releases/download/$RELEASE_TAG/$ASSET_NAME")

# Download the asset
curl -L -o "$ASSET_NAME" "$DOWNLOAD_URL"

# Make the binary executable
chmod +x "$ASSET_NAME"

# Move the binary to a directory in PATH
echo -e "\nInstalling phpup to /usr/local/bin/phpup"
sudo mv "$ASSET_NAME" /usr/local/bin/phpup

echo -e "\nphpup has been installed successfully! 🎉"
