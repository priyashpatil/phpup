# phpup

PHP environment tool chain for **MacOS, Linux**.

## Installing phpup

Execute the installation script by running the following command:

```bash
bash ./install.sh
```

### Adding `source.sh` to Shell Configuration

To automatically load `source.sh` when starting a new terminal session, you can update your shell's configuration file:

Add the following line to your `~/.bashrc` or `~/.zshrc` file:

```zsh
source ~/.phpup/source.sh
```

## Configuring PHP Version for Each Project

Phpup is capable of automatically determining the required PHP version by inspecting the `composer.json` file located at the root of your project. However, if you need to set a specific PHP version, you can do so by creating a `.phpuprc` file in your project's root directory.

Example `.phpuprc` file:

```sh
php_version=8.4
```
