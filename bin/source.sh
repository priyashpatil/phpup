#!/bin/bash

php_version="8.4"

# Extract PHP version from composer.json
if [ -f composer.json ]; then
    php_version=$(sed -n 's/.*"php": *"\([^"]*\)".*/\1/p' composer.json)
    php_version=$(echo "$php_version" | tr '|' '\n' | sed 's/\^//' | sort -V | tail -n 1)
fi

# Extract PHP version from .phpuprc
if [ -f .phpuprc ]; then
    while IFS= read -r line; do
        if [[ $line =~ ^php_version= ]]; then
            php_version="${line#php_version=}"
            break
        fi
    done <.phpuprc
fi

export PATH="/opt/homebrew/opt/php@$php_version/bin:$PATH"
export PATH="/opt/homebrew/opt/php@$php_version/sbin:$PATH"
