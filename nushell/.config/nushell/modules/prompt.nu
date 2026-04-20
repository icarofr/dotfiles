use std null_device

do --env {
  def prompt-header [
    --left-char: string
  ]: nothing -> string {
    let code = $env.LAST_EXIT_CODE

    let body = do {
      mut body = []

      # SSH INDICATOR `user@environment`
      if ($env.SSH_CONNECTION? | is-not-empty) {
        let remote_label = if ($env.USER? | is-not-empty) {
          $"($env.USER)@sdev"
        } else {
          "irocha@sdev"
        }

        $body ++= [ $"(ansi light_green_bold)($remote_label)" ]
      }

      # PATH OR JJ PROJECT `~/Downloads` or `ncc -> modules`
      # Case insensitive filesystems strike again!
      # https://github.com/nushell/nushell/issues/16205
      let pwd = pwd | path expand

      let jj_workspace_root = try {
        jj workspace root err> $null_device
      }

      $body ++= [ (if $jj_workspace_root != null {
        let subpath = $pwd | path relative-to $jj_workspace_root
        let subpath = if ($subpath | is-not-empty) {
          $" (ansi magenta_bold)→(ansi reset) (ansi blue)($subpath)"
        }

        $"(ansi light_yellow_bold)($jj_workspace_root | path basename)($subpath)"
      } else {
        let pwd = if ($pwd | str starts-with $env.HOME) {
          "~" | path join ($pwd | path relative-to $env.HOME)
        } else {
          $pwd
        }

        $"(ansi cyan)($pwd)"
      }) ]

      let git_ref = try {
        let branch = ^git symbolic-ref --short HEAD err> $null_device
        | str trim

        if ($branch | is-not-empty) {
          $"(ansi light_green_bold)($branch)"
        } else {
          null
        }
      } catch {
        let commit = try {
          ^git rev-parse --short HEAD err> $null_device
          | str trim
        }

        if ($commit | is-not-empty) {
          $"(ansi light_green_bold)@($commit)"
        } else {
          null
        }
      }

      if $git_ref != null {
        $body ++= [ $git_ref ]
      }

      $body | str join $"(ansi reset) "
    }

    let prefix = do {
      mut prefix = []

      # EXIT CODE
      if $code != 0 {
        $prefix ++= [ $"(ansi light_red_bold)($code)" ]
      }

      # COMMAND DURATION
      let command_duration = ($env.CMD_DURATION_MS | into int) * 1ms
      if $command_duration > 2sec {
        $prefix ++= [ $"(ansi light_magenta_bold)($command_duration)" ]
      }

      $"(ansi light_yellow_bold)($left_char)($prefix | each { $'┫($in)(ansi light_yellow_bold)┣' } | str join '━')━(ansi reset)"
    }

    let suffix = do {
      mut suffix = []

      # NIX SHELL
      if ($env.IN_NIX_SHELL? | is-not-empty) {
        $suffix ++= [ $"(ansi light_blue_bold)nix" ]
      }

      $suffix | each { $"(ansi light_yellow_bold)•(ansi reset) ($in)(ansi reset)" } | str join " "
    }

    ([ $prefix, $body, $suffix ] | str join " ") + (char newline)
  }

  $env.PROMPT_INDICATOR = $"(ansi light_yellow_bold)┃(ansi reset) "
  $env.PROMPT_INDICATOR_VI_NORMAL = $env.PROMPT_INDICATOR
  $env.PROMPT_INDICATOR_VI_INSERT = $env.PROMPT_INDICATOR
  $env.PROMPT_MULTILINE_INDICATOR = $env.PROMPT_INDICATOR
  $env.PROMPT_COMMAND = {||
    prompt-header --left-char "┏"
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

  $env.TRANSIENT_PROMPT_INDICATOR = "  "
  $env.TRANSIENT_PROMPT_INDICATOR_VI_INSERT = $env.TRANSIENT_PROMPT_INDICATOR
  $env.TRANSIENT_PROMPT_INDICATOR_VI_NORMAL = $env.TRANSIENT_PROMPT_INDICATOR
  $env.TRANSIENT_PROMPT_MULTILINE_INDICATOR = $env.TRANSIENT_PROMPT_INDICATOR
  $env.TRANSIENT_PROMPT_COMMAND = {||
    prompt-header --left-char "━"
  }
  $env.TRANSIENT_PROMPT_COMMAND_RIGHT = $env.PROMPT_COMMAND_RIGHT
}
