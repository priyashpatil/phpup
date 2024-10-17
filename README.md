# phpup

phpup - CLI tool for managing PHP environments

## Roadmap

- [ ] Easy to install cross platform script
- [ ] Base php install
- [ ] Built in Composer
- [ ] Multiple PHP installs
- [ ] Switching PHP versions
- [ ] 12 factor php install
- [ ] Opt in Xdebug install

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
