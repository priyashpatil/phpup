# phpup

PHP environment toolchain for **macOS**.

## Features

- Auto switching between PHP versions based on the project's composer.json file.

## Requirements

- phpup relies on homebrew-installed PHP. This means multiple PHP versions must be installed with homebrew first.

## Installing phpup

Clone the repository:

```bash
git clone https://github.com/priyashpatil/phpup.git
```

Run the installation script by executing the following command:

```bash
./bin/install.sh
```

Add the following line to your `~/.bashrc` or `~/.zshrc` file:

```zsh
source ~/.phpup/source.sh
```

## Configuring PHP Version for Each Project [Experimental]

**phpup automatically detects the required PHP version by inspecting the `composer.json`** file located at the root of your project. However, if you need to set a specific PHP version, you can do so by creating a `.phpuprc` file in your project's root directory.

```
php_version=8.1
```
