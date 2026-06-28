#!/usr/bin/env nu

# Apply dev-friendly Cinnamon keybindings coordinated with the silakka54 keyboard
# (see .config/keyboards/silakka54/silakka54-linux.vil) and Ghostty
# (see .config/ghostty/config).
#
# Strategy:
#   • Super (KC_LGUI on the keyboard's left thumb) → Cinnamon window management.
#     All Cinnamon Super defaults (tile, show-desktop, app menu) stay as-is.
#   • Cinnamon's `terminal` media key (Ctrl+Alt+T) launches `x-terminal-emulator`
#     by default — disabled here and replaced with an explicit `ghostty` launch.
#   • Super+G → launch Ghostty (thumb-cluster friendly).
#   • Screenshot defaults left alone: Print/Shift+Print/Alt+Print already line
#     up with what the keyboard's M4 macro sends (Shift+Print = area-screenshot).
#
# Linux-only. Idempotent. "Less is more."

def assert-cinnamon [] {
  if ((which gsettings | length) == 0) {
    error make {
      msg: "gsettings not found"
      help: "this script targets Cinnamon on Linux — run it on the Linux host, not macOS"
    }
  }
}

# gsettings expects a GVariant string like "['<Super>g']" for array-of-string keys.
def as-variant [bindings: list<string>] {
  $"[($bindings | each { |b| $"'($b)'" } | str join ', ')]"
}

def set-media-key [key: string, bindings: list<string>] {
  let v = (as-variant $bindings)
  print $"  media-keys.($key) = ($v)"
  ^gsettings set org.cinnamon.desktop.keybindings.media-keys $key $v
}

def add-custom-keybinding [slot: string, name: string, command: string, binding: list<string>] {
  let path = $"/org/cinnamon/desktop/keybindings/custom-keybindings/($slot)/"

  # gsettings returns "@as []" for an empty array — normalize and parse.
  let raw = (^gsettings get org.cinnamon.desktop.keybindings custom-list | str trim)
  let normalized = ($raw | str replace --all "'" '"' | str replace --regex '@as\s+' '')
  let existing = (try { $normalized | from json } catch { [] })
  let updated = if ($slot in $existing) { $existing } else { $existing | append $slot }

  print $"  custom-list = ($updated | each { |s| $s } | str join ', ')"
  ^gsettings set org.cinnamon.desktop.keybindings custom-list (as-variant $updated)
  ^gsettings set org.cinnamon.desktop.keybindings.custom-keybinding:$path name $name
  ^gsettings set org.cinnamon.desktop.keybindings.custom-keybinding:$path command $command
  ^gsettings set org.cinnamon.desktop.keybindings.custom-keybinding:$path binding (as-variant $binding)
  print $"  ($slot): ($name) = ($command)  [($binding | str join '+')]"
}

def main [] {
  assert-cinnamon

  print "Applying Cinnamon keybindings for silakka54 + Ghostty…"

  # 1. Disable Cinnamon's default terminal launcher (Ctrl+Alt+T → x-terminal-emulator).
  #    Replaced below by an explicit Ghostty launch on the same shortcut.
  set-media-key "terminal" []

  # 2. Ctrl+Alt+T → Ghostty (same shortcut you already know).
  add-custom-keybinding "custom0" "Ghostty" "ghostty" ["<Primary><Alt>t"]

  # 3. Super+G → Ghostty (Super is your left thumb; G is index-finger home row).
  add-custom-keybinding "custom1" "Ghostty (thumb)" "ghostty" ["<Super>g"]

  # That's it. Cinnamon's Super-based WM defaults, screenshot defaults, and
  # workspace-switch defaults all line up with the keyboard layout already —
  # no need to set them.

  print "Done. Verify in Cinnamon Settings → Keyboard."
}
