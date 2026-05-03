# Environment configuration (standalone)
# Homebrew detection and path updates
use std "path add"

$env.CARAPACE_BRIDGES = "inshellisense,carapace,zsh,fish,bash"

let docker_uid = (^id -u | str trim)
$env.DOCKER_HOST = $"unix:///run/user/($docker_uid)/docker.sock"

do --env {
  let brew_candidates = [
    ($env.HOME | path join ".local" "bin" "brew")
    ($env.HOME | path join ".linuxbrew" "bin" "brew")
    ($env.HOME | path join ".linuxbrew" "Homebrew" "bin" "brew")
    "/home/linuxbrew/.linuxbrew/bin/brew"
    "/home/linuxbrew/.linuxbrew/Homebrew/bin/brew"
    "/opt/homebrew/bin/brew"
    "/usr/local/bin/brew"
  ] | where { |brew_bin| $brew_bin | path exists }

  if ($brew_candidates | is-not-empty) {
    let brew_bin = $brew_candidates | first
    let brew_prefix = try { (^$brew_bin --prefix | str trim) } catch { '' }

    if ($brew_prefix | is-not-empty) {
      $env.HOMEBREW_PREFIX = $brew_prefix
      let __cellar = try { (^$brew_bin --cellar | str trim) } catch { '' }
      let __repo = try { (^$brew_bin --repository | str trim) } catch { '' }
      $env.HOMEBREW_CELLAR = $__cellar
      $env.HOMEBREW_REPOSITORY = $__repo

      path add ($brew_prefix | path join "sbin")
      path add ($brew_prefix | path join "bin")
    }
  }

  let mise_shims = ($env.HOME | path join ".local" "share" "mise" "shims")
  if ($mise_shims | path exists) {
    path add $mise_shims
  }

  # Shadow path insertion (move shadow dir before /usr/bin if present)
  let shadow_path = ($env.HOME | path join ".local" "shadow")
  # Prevent duplicate insertion across nested shells: only insert if not already present
  if ($shadow_path | path exists) {
    if not (($env.PATH | any { $in == $shadow_path })) {
      let usr_bin_entries = ($env.PATH | enumerate | where item == /usr/bin)
      if ($usr_bin_entries | is-not-empty) {
        let usr_bin_index = ($usr_bin_entries | get 0.index)
        $env.PATH = $env.PATH | insert $usr_bin_index $shadow_path
      } else {
        # Fallback: append to PATH if /usr/bin not found
        $env.PATH = $env.PATH | append $shadow_path
      }
    }
  }
}

$env.EDITOR = "nano"
$env.VISUAL = "nano"
$env.PAGER = "less -RFX"

$env.SHELL = (which nu | get path | first)

