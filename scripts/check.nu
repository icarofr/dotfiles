#!/usr/bin/env nu

const REPO_ROOT = path self ..

def command-exists [name: string] {
  (which $name | length) > 0
}

def failure-detail [error] {
  $error.msg? | default ($error.rendered? | default ($error | to nuon))
}

def run-check [label: string, ok_detail: string, check: closure] {
  try {
    do $check
    { label: $label, ok: true, detail: $ok_detail }
  } catch { |error|
    { label: $label, ok: false, detail: (failure-detail $error) }
  }
}

def main [] {
  cd $REPO_ROOT

  mut results = [
    (run-check "repository layout" "ok" {
      if not (".config/nushell/config.nu" | path exists) {
        error make { msg: "missing .config/nushell/config.nu" }
      }

      if not (".config/fish/config.fish" | path exists) {
        error make { msg: "missing .config/fish/config.fish" }
      }

      if not (".config/starship/starship.toml" | path exists) {
        error make { msg: "missing .config/starship/starship.toml" }
      }

      if not (".config/zsh/.zshrc" | path exists) {
        error make { msg: "missing .config/zsh/.zshrc" }
      }
    })
    (run-check "nushell config" "sources cleanly" {
      source ../.config/nushell/env.nu
      source ../.config/nushell/config.nu
    })
  ]

  if (command-exists "fish") {
    let fish_check = (^fish --no-execute .config/fish/config.fish | complete)

    if $fish_check.exit_code == 0 {
      $results ++= [{ label: "fish config", ok: true, detail: "syntax ok" }]
    } else {
      let detail = if ($fish_check.stderr | str trim | is-not-empty) {
        $fish_check.stderr | str trim
      } else {
        "fish syntax check failed"
      }

      $results ++= [{ label: "fish config", ok: false, detail: $detail }]
    }
  } else {
    $results ++= [{ label: "fish config", ok: true, detail: "skipped (fish not installed)" }]
  }

  if (command-exists "zsh") {
    let zsh_check = (^zsh -n .config/zsh/.zshenv .config/zsh/.zprofile .config/zsh/.zshrc | complete)

    if $zsh_check.exit_code == 0 {
      $results ++= [{ label: "zsh config", ok: true, detail: "syntax ok" }]
    } else {
      let detail = if ($zsh_check.stderr | str trim | is-not-empty) {
        $zsh_check.stderr | str trim
      } else {
        "zsh syntax check failed"
      }

      $results ++= [{ label: "zsh config", ok: false, detail: $detail }]
    }
  } else {
    $results ++= [{ label: "zsh config", ok: true, detail: "skipped (zsh not installed)" }]
  }

  for result in $results {
    let status = if $result.ok { "ok" } else { "fail" }
    print $"[($status)] ($result.label): ($result.detail)"
  }

  if ($results | any { |result| not $result.ok }) {
    exit 1
  }
}
