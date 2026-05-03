# Keep the Carapace hook vendored so Nushell startup stays self-contained.
let carapace_bin = ($env.HOME | path join "Library" "Application Support" "carapace" "bin")
if ($carapace_bin | path exists) {
  if not (($env.PATH | any { |entry| $entry == $carapace_bin })) {
    $env.PATH = $env.PATH | prepend $carapace_bin
  }
}

def --env get-env [name] { $env | get $name }
def --env set-env [name, value] { load-env { $name: $value } }
def --env unset-env [name] { hide-env $name }

let carapace_completer = {|spans|
  if ($spans | is-empty) {
    []
  } else {
    load-env {
      CARAPACE_SHELL_BUILTINS: (help commands | where category != "" | get name | each { split row " " | first } | uniq | str join "\n")
      CARAPACE_SHELL_FUNCTIONS: (help commands | where category == "" | get name | each { split row " " | first } | uniq | str join "\n")
    }

    let expanded_alias = (scope aliases | where name == $spans.0 | $in.0?.expansion?)
    let spans = (if $expanded_alias != null {
      $spans | skip 1 | prepend ($expanded_alias | split row " " | first)
    } else {
      $spans | skip 1 | prepend $spans.0
    })

    carapace $spans.0 nushell ...$spans | from json
  }
}