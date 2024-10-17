# phpup

phpup - CLI tool for managing PHP environments

## Installation

macOS

```sh
curl -fsSL https://raw.githubusercontent.com/priyashpatil/phpup/main/install/mac.sh | bash
```

## Roadmap

- [ ] Easy to install cross platform script
- [ ] Base php install
- [ ] Built in Composer
- [ ] Multiple PHP installs
- [ ] Switching PHP versions
- [ ] Opt in Xdebug install

- [ ] Doctor
- [ ] Update
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
