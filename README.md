# dotfiles

Source of truth lives under `.config/`.

## Layout

- `.config/fish`
- `.config/nushell`
- `.config/starship`
- `.config/zsh`
- `bootstrap.nu` installs symlinks with `stow`
- `check.nu` validates the repo layout and shell configs

## Install

```bash
nu bootstrap.nu
```

Run a subset if needed:

```bash
nu bootstrap.nu fish nushell
```

## Notes

- On macOS, `bootstrap.nu` creates the Nushell bridge at `~/Library/Application Support/nushell`.
- For zsh, `bootstrap.nu` creates `~/.zshenv` as a bridge into `~/.config/zsh`.

## Verify

```bash
nu check.nu
```
