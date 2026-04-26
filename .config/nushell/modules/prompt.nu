use std null_device

do --env {
  def short-hostname [name: string]: nothing -> string {
    $name
    | str trim
    | split row "."
    | first
  }

  def session-label []: nothing -> string {
    let username = if ($env.USER? | is-not-empty) {
      $env.USER | str trim
    } else {
      ^whoami | str trim
    }

    let hostname = do {
      if ($env.HOSTNAME? | is-not-empty) {
        short-hostname $env.HOSTNAME
      } else {
        let short = try {
          ^hostname -s err> $null_device
          | str trim
        }

        if ($short | is-not-empty) {
          short-hostname $short
        } else {
          let full = try {
            ^hostname err> $null_device
            | str trim
          }

          if ($full | is-not-empty) {
            short-hostname $full
          } else {
            "host"
          }
        }
      }
    }

    $"(ansi light_blue_bold)($username)(ansi light_yellow_bold)@(ansi light_green_bold)($hostname)"
  }

  def is-path-within [path: string, base: string]: nothing -> bool {
    $path == $base or ($path | str starts-with $"($base)/")
  }

  def split-path-components [path: string]: nothing -> list<string> {
    $path
    | split row "/"
    | where {|segment| $segment != "" and $segment != "." }
  }

  def abbreviate-path-segment [segment: string]: nothing -> string {
    if $segment == ".." {
      $segment
    } else if ($segment | str starts-with ".") and (($segment | str length) > 1) {
      let chars = ($segment | split chars)
      $".($chars | get 1)"
    } else {
      $segment | split chars | first
    }
  }

  def workspace-root []: nothing -> string {
    let jj_workspace_root = try {
      jj workspace root err> $null_device | str trim
    }

    if ($jj_workspace_root | is-not-empty) {
      $jj_workspace_root
    } else {
      let git_root = try {
        ^git rev-parse --show-toplevel err> $null_device | str trim
      }

      if ($git_root | is-not-empty) {
        $git_root
      } else {
        null
      }
    }
  }

  def git-path [name: string]: nothing -> string {
    try {
      ^git rev-parse --git-path $name err> $null_device | str trim
    } catch {
      ""
    }
  }

  def read-trimmed-file [file: string]: nothing -> string {
    if ($file | path exists) {
      ^cat $file err> $null_device | str trim
    } else {
      ""
    }
  }

  def git-operation [] {
    mut branch_hint = ""
    mut state = ""
    mut step = ""
    mut total = ""

    let rebase_merge = (git-path "rebase-merge")
    if ($rebase_merge | is-not-empty) and ($rebase_merge | path exists) {
      $branch_hint = (read-trimmed-file ($rebase_merge | path join "head-name"))
      $step = (read-trimmed-file ($rebase_merge | path join "msgnum"))
      $total = (read-trimmed-file ($rebase_merge | path join "end"))
      $state = if (($rebase_merge | path join "interactive") | path exists) {
        "|REBASE-i"
      } else {
        "|REBASE-m"
      }
    } else {
      let rebase_apply = (git-path "rebase-apply")
      let merge_head = (git-path "MERGE_HEAD")
      let cherry_pick_head = (git-path "CHERRY_PICK_HEAD")
      let revert_head = (git-path "REVERT_HEAD")
      let bisect_log = (git-path "BISECT_LOG")

      if ($rebase_apply | is-not-empty) and ($rebase_apply | path exists) {
        $step = (read-trimmed-file ($rebase_apply | path join "next"))
        $total = (read-trimmed-file ($rebase_apply | path join "last"))
        if (($rebase_apply | path join "rebasing") | path exists) {
          $branch_hint = (read-trimmed-file ($rebase_apply | path join "head-name"))
          $state = "|REBASE"
        } else if (($rebase_apply | path join "applying") | path exists) {
          $state = "|AM"
        } else {
          $state = "|AM/REBASE"
        }
      } else if ($merge_head | is-not-empty) and ($merge_head | path exists) {
        $state = "|MERGING"
      } else if ($cherry_pick_head | is-not-empty) and ($cherry_pick_head | path exists) {
        $state = "|CHERRY-PICKING"
      } else if ($revert_head | is-not-empty) and ($revert_head | path exists) {
        $state = "|REVERTING"
      } else if ($bisect_log | is-not-empty) and ($bisect_log | path exists) {
        $state = "|BISECTING"
      }
    }

    if ($branch_hint | is-not-empty) {
      $branch_hint = ($branch_hint | str replace "refs/heads/" "")
    }

    if ($step | is-not-empty) and ($total | is-not-empty) {
      $state = $"($state) ($step)/($total)"
    }

    {
      branch_hint: $branch_hint
      state: $state
    }
  }

  def git-ref [branch_hint: string = ""]: nothing -> string {
    let branch = if ($branch_hint | is-not-empty) {
      $branch_hint
    } else {
      try {
        ^git symbolic-ref --short HEAD err> $null_device | str trim
      }
    }

    if ($branch | is-not-empty) {
      $branch
    } else {
      let commit = try {
        ^git rev-parse --short HEAD err> $null_device | str trim
      }

      if ($commit | is-not-empty) {
        $"@($commit)"
      } else {
        null
      }
    }
  }

  def shorten-path [cwd: string, workspace_root: string = ""]: nothing -> string {
    let home = ($env.HOME | path expand)
    let in_home = (is-path-within $cwd $home)
    let base = if $in_home { $home } else { "/" }
    let prefix = if $in_home { "~" } else { "/" }

    let relative = if $cwd == $base {
      ""
    } else {
      $cwd | path relative-to $base
    }

    let path_segments = if ($relative | is-empty) {
      []
    } else {
      split-path-components $relative
    }

    if ($path_segments | is-empty) {
      $prefix
    } else {
      let keep_full = if ($workspace_root | is-not-empty) and (is-path-within $cwd $workspace_root) {
        let workspace_relative = if $workspace_root == $base {
          ""
        } else {
          $workspace_root | path relative-to $base
        }

        let workspace_segments = if ($workspace_relative | is-empty) {
          []
        } else {
          split-path-components $workspace_relative
        }

        if ($workspace_segments | is-not-empty) {
          [ (($path_segments | length) - 1), (($workspace_segments | length) - 1) ]
        } else {
          [ (($path_segments | length) - 1) ]
        }
      } else {
        [ (($path_segments | length) - 1) ]
      }

      let shortened = ($path_segments | enumerate | each {|entry|
        if ($keep_full | any {|index| $index == $entry.index }) {
          $entry.item
        } else {
          abbreviate-path-segment $entry.item
        }
      })

      if $prefix == "~" {
        $"~/($shortened | str join '/')"
      } else {
        $"/($shortened | str join '/')"
      }
    }
  }

  def prompt-head []: nothing -> string {
    let cwd = (pwd | path expand)
    let code = ($env.LAST_EXIT_CODE? | default 0)
    let command_duration = (($env.CMD_DURATION_MS? | default 0 | into int) * 1ms)
    let root = (workspace-root)
    let git_info = (git-operation)

    mut parts = [
      (session-label)
      $"(ansi cyan)(shorten-path $cwd $root)"
    ]

    let ref = (git-ref $git_info.branch_hint)
    if $ref != null {
      let ref_label = if ($git_info.state | is-not-empty) {
        $"(ansi light_green_bold)($ref)(ansi light_red_bold)($git_info.state)"
      } else {
        $"(ansi light_green_bold)($ref)"
      }

      $parts ++= [ $ref_label ]
    }

    if ($env.IN_NIX_SHELL? | is-not-empty) {
      $parts ++= [ $"(ansi light_blue_bold)nix" ]
    }

    if $code != 0 {
      $parts ++= [ $"(ansi light_red_bold)($code)" ]
    }

    if $command_duration > 2sec {
      $parts ++= [ $"(ansi light_yellow_bold)($command_duration)" ]
    }

    ($parts | str join $"(ansi reset) ") + $"(ansi reset)"
  }

  $env.PROMPT_INDICATOR = $" (ansi light_green_bold)>(ansi reset) "
  $env.PROMPT_INDICATOR_VI_NORMAL = $env.PROMPT_INDICATOR
  $env.PROMPT_INDICATOR_VI_INSERT = $env.PROMPT_INDICATOR
  $env.PROMPT_MULTILINE_INDICATOR = $env.PROMPT_INDICATOR
  $env.PROMPT_COMMAND = {||
    prompt-head
  }
  $env.PROMPT_COMMAND_RIGHT = {||
    let jj_status = try {
      jj --quiet --color always --ignore-working-copy log --no-graph --revisions @ --template '
        separate(
          " ",
          if(empty, label("empty", "(empty)")),
          coalesce(
            surround(
              "\"",
              "\"",
              if(
                description.first_line().substr(0, 24).starts_with(description.first_line()),
                description.first_line().substr(0, 24),
                description.first_line().substr(0, 23) ++ "…"
              )
            ),
            label(if(empty, "empty"), description_placeholder)
          ),
          bookmarks.join(", "),
          change_id.shortest(),
          commit_id.shortest(),
          if(conflict, label("conflict", "(conflict)")),
          if(divergent, label("divergent prefix", "(divergent)")),
          if(hidden, label("hidden prefix", "(hidden)")),
        )
      ' err> $null_device
    } catch {
      ""
    }

    $jj_status
  }

  $env.TRANSIENT_PROMPT_INDICATOR = $env.PROMPT_INDICATOR
  $env.TRANSIENT_PROMPT_INDICATOR_VI_INSERT = $env.TRANSIENT_PROMPT_INDICATOR
  $env.TRANSIENT_PROMPT_INDICATOR_VI_NORMAL = $env.TRANSIENT_PROMPT_INDICATOR
  $env.TRANSIENT_PROMPT_MULTILINE_INDICATOR = $env.TRANSIENT_PROMPT_INDICATOR
  $env.TRANSIENT_PROMPT_COMMAND = {||
    prompt-head
  }
  $env.TRANSIENT_PROMPT_COMMAND_RIGHT = $env.PROMPT_COMMAND_RIGHT
}
