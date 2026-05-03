source modules/settings.nu
source modules/prompt.nu
source modules/menus.nu
source modules/dump.nu
source modules/commands.nu

# Keep the generated zoxide hook in-repo so the config stays self-contained.
source vendor/zoxide.nu

# Keep the generated Carapace hook in-repo so the config stays self-contained.
source vendor/carapace.nu

let fish_completer = {|spans|
  fish -c $"complete -C '($spans | str join ' ')'"
  | lines
  | each {|line|
      let cols = $line | split column "\t" value description
      $cols | get value | first
    }
}

$env.config.completions.external.completer = {|spans|
  if ($spans | is-empty) {
    []
  } else if $spans.0 == "brew" {
    do $fish_completer $spans
  } else {
    do $carapace_completer $spans
  }
}
