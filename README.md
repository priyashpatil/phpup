# phpup

phpup - CLI tool for managing PHP environments.

## Installation

### macOS and Linux

To install on macOS or Linux, run the following command in your terminal:

```sh
curl -fsSL https://raw.githubusercontent.com/priyashpatil/phpup/main/install/unix.sh | bash
```

### Windows

For Windows 64-bit, follow these steps:

1. Open PowerShell as Administrator
2. Run the following command:

```powershell
iwr -useb https://raw.githubusercontent.com/priyashpatil/phpup/main/install/windows.ps1 | iex
```

## Roadmap

- [x] Simple cross platform automated build
- [x] Easy to install cross platform script
- [ ] Base php install
- [ ] Built in Composer
- [ ] Multiple PHP installs
- [ ] Switching PHP versions
- [ ] Opt in Xdebug install
- [ ] Per project PHP installation
- [ ] Doctor
- [ ] Extensions
- [ ] Docker Images

## Contributing

Pull requests are welcome. For major changes, please open an issue first
to discuss what you would like to change.

Commit message standards are based on [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/).

### Build

```sh
go build
```

### Testing

```sh
go test ./tests
```

Step Debugging with VSCode:

```sh
go install github.com/go-delve/delve/cmd/dlv@latest
```
