#!/bin/bash

# Check if the destination directory exists
if [ ! -d "$HOME/.phpup" ]; then
    echo "Installing: Creating directory $HOME/.phpup"
    mkdir -p "$HOME/.phpup"
fi

# Copy the source.sh from the current directory to ~/.phpup
cp "$(pwd)/bin/source.sh" "$HOME/.phpup/source.sh"
echo "phpup has been successfully installed!"
