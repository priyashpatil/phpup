#!/bin/bash
set -e

rm -rf ./build/phpup
rm -rf ./build/index.*

# Ensure dependencies are up to date
composer install --no-dev

# Compile the phar
./vendor/bin/box compile

cd build || exit 1

# Download the static-php-cli binary
echo "Downloading static-php-cli..."
curl -fsSL -o spc https://dl.static-php.dev/static-php-cli/spc-bin/nightly/spc-macos-aarch64
chmod +x ./spc

# Check spc version
echo "static-php-cli version:"
./spc --version

# Download necessary sources
echo "Downloading sources..."
./spc download --for-extensions="openssl,pcntl,mbstring,phar,posix,zlib,curl,fileinfo,filter,session,tokenizer" --with-php=8.3

# Use static-php-cli to build PHP with micro SAPI
echo "Building PHP with micro SAPI..."
./spc build "openssl,pcntl,mbstring,phar,posix,zlib,curl,fileinfo,filter,session,tokenizer" --build-micro --debug

# Check if micro.sfx was created
if [ ! -f "./buildroot/bin/micro.sfx" ]; then
    echo "Error: micro.sfx not found. Build may have failed."
    exit 1
fi

# Combine micro.sfx with index.phar
echo "Combining micro.sfx with index.phar..."
./spc micro:combine ./index.phar --output phpup

chmod 0755 ./phpup

echo "Build completed successfully"
