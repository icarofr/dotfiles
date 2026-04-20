#!/usr/bin/env nu

const REPO_ROOT = path self .

def default-packages [] {
  [ "fish" "nushell" "starship" "zsh" ]
}

def detect-platform [] {
  let host_name = (sys host | get name | str downcase)

  if (($host_name | str contains "darwin") or ($host_name | str contains "mac")) {
    "macos"
  } else {
    "linux"
  }
}

def ensure-command [name: string] {
  if ((which $name | length) == 0) {
    error make {
      msg: $"missing dependency: ($name)"
      help: $"install ($name) and run the script again"
    }
  }
}

def run-stow [repo_root: path, target: string, packages: list<string>, adopt: bool, restow: bool] {
  mut stow_args = []

  if $restow {
    $stow_args ++= [ "--restow" ]
  }

  if $adopt {
    $stow_args ++= [ "--adopt" ]
  }

  $stow_args ++= [ "--target" $target ]
  $stow_args ++= $packages

  print $"stowing ($packages | str join ', ') into ($target)"
  cd $repo_root
  ^stow ...$stow_args
}

def ensure-macos-nushell-bridge [target: string, force: bool] {
  let canonical_dir = ($target | path join ".config" "nushell")
  let support_dir = ($target | path join "Library" "Application Support")
  let bridge_path = ($support_dir | path join "nushell")

  if not ($canonical_dir | path exists) {
    error make {
      msg: "missing canonical Nushell config"
      help: $"expected ($canonical_dir) to exist after stow"
    }
  }

  mkdir $support_dir

  if ($bridge_path | path exists) {
    let bridge_type = ($bridge_path | path type)

    if $bridge_type == "symlink" {
      print $"macOS Nushell bridge already exists at ($bridge_path)"
      return
    }

    if not $force {
      error make {
        msg: "macOS Nushell bridge path already exists"
        help: $"move or delete ($bridge_path), or rerun with --force-macos-bridge"
      }
    }

    rm --force --recursive $bridge_path
  }

  ^ln -s $canonical_dir $bridge_path
  print $"created macOS Nushell bridge: ($bridge_path) -> ($canonical_dir)"
}

def main [
  --target: string = ""
  --platform: string = ""
  --adopt
  --no-restow
  --force-macos-bridge
  ...packages: string
] {
  let selected_packages = if ($packages | is-empty) { default-packages } else { $packages }
  let resolved_platform = if ($platform | is-empty) { detect-platform } else { $platform | str downcase }
  let resolved_target = if ($target | is-empty) { $env.HOME } else { $target | path expand }

  ensure-command "stow"
  run-stow (path self .) $resolved_target $selected_packages $adopt (not $no_restow)

  if ($resolved_platform == "macos") and ("nushell" in $selected_packages) {
    ensure-macos-nushell-bridge $resolved_target $force_macos_bridge
  }

  print "bootstrap complete"
}