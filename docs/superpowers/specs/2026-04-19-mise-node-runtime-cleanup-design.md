# Mise Node Runtime Cleanup Design

## Goal

Make `mise` the only Node runtime manager across Nushell, Bash, and Fish on this machine, remove stale `nvm` ownership and Homebrew-managed Node runtime leftovers, keep `opencode` and `agent-browser` working, and make `pnpm` come from the `mise`-managed Node toolchain instead of Homebrew.

## Current problems

- Nushell is not activating `mise`, so the intended `mise`-managed Node runtime is not exposed consistently there.
- Bash still loads `nvm` from `~/.profile`.
- Fish still has the `jorgebucaran/nvm.fish` plugin, startup hook, functions, and completions.
- Old runtime state still exists in both `~/.nvm` and `~/.local/share/nvm`.
- `pnpm` currently resolves to Homebrew instead of the `mise`-managed Node toolchain.
- Homebrew still owns leftover Node-global packages under `~/.linuxbrew/lib/node_modules`, including `pnpm`, `bun`, `npm`, and `@anthropic-ai/claude-code`.
- Runtime ownership is split across `mise`, `nvm`, and Homebrew, which makes command resolution harder to reason about.

## Selected approach

Use a **single-owner runtime model**:

- `mise` owns `node` and `npm`
- the default Node version is `lts`
- `pnpm` is provided by Corepack through the `mise`-managed Node runtime
- Homebrew keeps `mise`, `opencode`, and `agent-browser`
- Homebrew no longer owns `pnpm`, `bun`, `npm`, or `claude-code`
- `nvm` is removed from shell startup and from disk

This keeps the machine model simple:

> Homebrew installs `mise`, `opencode`, and `agent-browser`; `mise` installs Node; Corepack provides `pnpm`; `nvm` does not exist.

## Ownership rules

### Runtime ownership

- `mise` is the only owner of `node` and `npm`
- Corepack, running under the active `mise` Node runtime, is the only owner of `pnpm`
- `npx @anthropic-ai/claude-code` replaces a globally installed `claude` binary
- `agent-browser` remains a standalone Homebrew-managed CLI

### Package-manager ownership

- do not keep a Homebrew-owned `pnpm` binary on `PATH`
- do not keep a Homebrew-owned `npm` package tree for runtime tools that should follow the active Node install
- do not use `nvm` to expose any Node or npm binaries

## Shell design

### Nushell

`~/.config/nushell/env.nu` should activate `mise` using the official Nushell pattern so `node`, `npm`, and Corepack-backed `pnpm` are available in Nu sessions.

Responsibilities:

- keep existing Homebrew path detection
- apply `mise activate nushell` output with `parse env | update-env`
- avoid any `nvm` logic

### Bash

Bash should use:

- interactive activation in `~/.bashrc`
- `--shims` activation in `~/.profile` for login and non-interactive contexts

Responsibilities:

- preserve the existing Homebrew path setup
- remove `NVM_DIR` and `nvm.sh` sourcing
- expose `mise`-managed `node`/`npm` and Corepack-backed `pnpm`

### Fish

Fish should use explicit `mise activate fish | source` in `~/.config/fish/config.fish`.

Responsibilities:

- keep the existing Homebrew shellenv behavior
- remove the `nvm.fish` plugin from `fish_plugins`
- remove the `nvm` startup hook, functions, and completions

## State cleanup

### Remove from shell configs

- `~/.profile` lines that export `NVM_DIR` or source `nvm.sh`
- Fish plugin/config references to `jorgebucaran/nvm.fish`
- Fish `nvm` startup hook files

### Remove from disk

- `~/.nvm`
- `~/.local/share/nvm`
- Fish `nvm` plugin files under:
  - `~/.config/fish/conf.d/nvm.fish`
  - `~/.config/fish/functions/nvm.fish`
  - `~/.config/fish/functions/_nvm_*`
  - `~/.config/fish/completions/nvm.fish`

### Remove from Homebrew-owned Node globals

Remove the leftover Homebrew-managed Node global packages that conflict with the new ownership model:

- `pnpm`
- `bun`
- `npm`
- `@anthropic-ai/claude-code`

Keep:

- `mise`
- `opencode`
- `agent-browser`

## Dotfiles source of truth

The active live files in `$HOME` are not symlinked to `/home/user/projects/dotfiles`, so this cleanup must update two surfaces:

1. the live files in `$HOME`
2. the matching tracked files in the `dotfiles` repo for Nushell and Fish

This pass does **not** attempt to migrate the machine to symlinked dotfiles ownership. That is a separate concern.

## `claude-code` handling

The global Homebrew-owned `claude` launcher is removed.

After cleanup, `claude-code` is expected to be used through:

```bash
npx @anthropic-ai/claude-code
```

This keeps it out of the Homebrew-owned Node global package tree and makes it follow the `mise`-managed Node/npm runtime instead.

## Non-goals

- Do not modify app repos for this cleanup.
- Do not move `opencode` off Homebrew.
- Do not remove `agent-browser`.
- Do not introduce wrapper scripts for `node`, `npm`, or `pnpm`.
- Do not do a dotfiles symlink migration in the same change.

## Error handling and safety

- Only remove Homebrew Node globals that are explicitly in scope for this cleanup.
- Verify `pnpm` works through Corepack before removing the Homebrew `pnpm` binary from the active path.
- Verify `agent-browser` still resolves after Homebrew runtime cleanup.
- Verify `npx @anthropic-ai/claude-code --version` works before considering the `claude-code` migration complete.
- Keep `mise` itself installed through Homebrew.

## Verification expectations

After implementation, confirm all of the following in fresh shells:

### Nushell

- `which node` resolves to the `mise` install or shim path
- `which npm` resolves to the `mise` install or shim path
- `pnpm --version` works without using the old Homebrew `pnpm` path

### Bash

- `node`, `npm`, and `pnpm` all work from a fresh login shell
- no `nvm` activation lines remain in `~/.profile`

### Fish

- `node`, `npm`, and `pnpm` all work from a fresh shell
- no `nvm` functions or completions remain

### General

- `mise doctor` no longer reports missing activation for the intended shell setup
- `which -a node npm pnpm` shows no `nvm` paths
- Homebrew no longer exposes `pnpm`, `bun`, or `claude`
- `agent-browser` still resolves and reports a version/help screen
- `npx @anthropic-ai/claude-code --version` succeeds under the `mise` runtime

## Success criteria

The cleanup is successful when:

- `mise` is the only Node runtime manager left on the machine
- the default global Node is the latest LTS from `mise`
- `pnpm` is no longer Homebrew-owned
- `nvm` config and runtime directories are gone
- `claude-code` is no longer installed as a Homebrew-owned Node global
- `agent-browser`, `opencode`, and the shell sessions still work
- command ownership is easy to explain and inspect

## Self-review

- No placeholders remain.
- The ownership model is explicit.
- The cleanup scope is limited to the user environment.
- The design distinguishes live machine files from tracked dotfiles files.
