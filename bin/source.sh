#!/bin/bash

php_version="8.4"

# Extract PHP version from composer.json
if [ -f composer.json ]; then
    if [ "$debug_phpup" -eq 1 ]; then
        echo "composer.json found, extracting PHP version..."
    fi
    php_version=$(sed -n 's/.*"php": *"\([^"]*\)".*/\1/p' composer.json)
    php_version=$(echo "$php_version" | tr '|' '\n' | sed 's/\^//' | sort -V | head -n 1)

    # If env var debug_phpup is set, print PHP version
    if [ "$debug_phpup" -eq 1 ]; then
        echo "PHP version from composer.json: $php_version"
    fi
fi

# Extract PHP version from .phpuprc
if [ -f .phpuprc ]; then
    if [ "$debug_phpup" -eq 1 ]; then
        echo ".phpuprc found, extracting PHP version..."
    fi
    while IFS= read -r line; do
        if [[ $line =~ ^php_version= ]]; then
            php_version="${line#php_version=}"
            if [ "$debug_phpup" -eq 1 ]; then
                echo "PHP version from .phpuprc: $php_version"
            fi
            break
        fi
    done <.phpuprc
fi

# Check Mac architecture and set appropriate Homebrew path
if [ "$debug_phpup" -eq 1 ]; then
    echo "Checking Mac architecture..."
fi
if [[ $(uname -m) == "arm64" ]]; then
    HOMEBREW_PREFIX="/opt/homebrew"
    if [ "$debug_phpup" -eq 1 ]; then
        echo "Architecture is arm64, setting HOMEBREW_PREFIX to /opt/homebrew"
    fi
else
    HOMEBREW_PREFIX="/usr/local"
    if [ "$debug_phpup" -eq 1 ]; then
        echo "Architecture is not arm64, setting HOMEBREW_PREFIX to /usr/local"
    fi
fi

if [ "$debug_phpup" -eq 1 ]; then
    echo "Setting PATH for PHP $php_version"
fi
export PATH="$HOMEBREW_PREFIX/opt/php@$php_version/bin:$PATH"
export PATH="$HOMEBREW_PREFIX/opt/php@$php_version/sbin:$PATH"
