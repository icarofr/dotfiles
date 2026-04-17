use std "path add"

do --env {
  let brew_candidates = [
    ($env.HOME | path join ".linuxbrew" "bin" "brew")
    ($env.HOME | path join ".linuxbrew" "Homebrew" "bin" "brew")
    "/home/linuxbrew/.linuxbrew/bin/brew"
    "/home/linuxbrew/.linuxbrew/Homebrew/bin/brew"
    "/opt/homebrew/bin/brew"
    "/usr/local/bin/brew"
  ] | where { |brew_bin| $brew_bin | path exists }

  if ($brew_candidates | is-not-empty) {
    let brew_bin = $brew_candidates | first
    let brew_prefix = (^$brew_bin --prefix | str trim)

    if ($brew_prefix | is-not-empty) {
      $env.HOMEBREW_PREFIX = $brew_prefix
      $env.HOMEBREW_CELLAR = (^$brew_bin --cellar | str trim)
      $env.HOMEBREW_REPOSITORY = (^$brew_bin --repository | str trim)

      path add ($brew_prefix | path join "bin")
      path add ($brew_prefix | path join "sbin")
    }
  }
}
