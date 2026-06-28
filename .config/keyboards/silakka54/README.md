# Silakka54 — Linux / Cinnamon / Ghostty layout

A 54-key column-staggered split keyboard, running a personal QWERTY layout
adapted for Linux + Cinnamon + Ghostty.

Two `.vil` exports live here:

| File | Target | What it is |
| --- | --- | --- |
| `silakka54-linux.vil` | Linux (active) | Clipboard chords on Layer 1 use `Ctrl`, M4 macro sends `Shift+Print` (Cinnamon area screenshot). |
| `silakka54-mac.vil`   | macOS (reference) | Original export from `~/Downloads/untitled.vil`. Kept for cross-platform reference. |

Both share UID `5751176265195704471` — same keyboard, same matrix, only keycode
behavior differs.

---

## Layout overview

4×6 matrix per half + 3 thumb keys per half = 54 keys. ACS home-row mods
(Ctrl/Alt/Shift on ring/middle/index), GUI on the left thumb. Only **4 real
layers** are populated; layers 4–7 are unused (kept blank, not removed, so
adding future layers doesn't shift existing `MO(N)` indices).

### Layer 0 — Base (QWERTY)

```
- 1 2 3 4 5            = 0 9 8 7 6
Tab Q W E R T          Del P O I U Y
MO(1) A CTL_T(S) ALT_T(D) SFT_T(F) G    ' ; RCTL_T(L) RALT_T(K) RSFT_T(J) H
MO(2) Z X C V B        Bksp / . , M N
                  LT1(Esc) LGUI Space  LT3(`) Enter Space
```

- Home row mods: `S D F` hold → Ctrl / Alt / Shift (left), `L K J` hold →
  Ctrl / Alt / Shift (right). Tapping term is 170 ms (Vial setting id `7`) —
  consider bumping to 200 ms while learning; the source of truth is your
  `untitled.vil` export and can be tweaked live in the Vial GUI without
  re-flashing.
- `MO(1)` / `MO(2)` are dedicated layer-toggle keys on the left pinky column
  — hold to momentarily activate. Easier to discover than thumb-only layers.
- `KC_LGUI` on the left thumb sends **Super on Linux**, which Cinnamon uses
  for window management (tile, show-desktop, etc.). One tap also opens the
  Cinnamon menu — convenient as an app launcher.

### Layer 1 — Function + Nav + clipboard (momentary, via `MO(1)` or `LT1(Esc)`)

```
trns trns trns trns trns trns       trns  LCTL(Z) LCTL(X) LCTL(C) LCTL(V) LCTL(S)
trns F1   F2   F3   F4   F5         no    Right   Up      Down    Left    CapsLock
trns F6   LCtrl LAlt LShift F7      no    End     PgUp    PgDn    Home    Insert
trns F8   F9   F10  F11  F12        no    no      no      no      no      no
                              trns trns trns                    trns trns trns
```

- Right pinky column = arrow cluster in a vim-ish inverted T (`↑ K`, `↓ J`,
  `← L`, `→ I` style, but on homerow keys).
- Right ring column = clipboard / save chords — **`Ctrl+Z/X/C/V/S`** on
  Linux (the macOS reference uses `Cmd+` instead). These work in editors,
  browsers, file managers. In Ghostty, `Ctrl+C` still reaches the shell as
  SIGINT and `Ctrl+V` passes through, so use `Ctrl+Shift+C/V` (Ghostty
  defaults) for terminal clipboard — see [Ghostty coordination](#ghostty).
- Left side carries F1–F12 in two columns.

### Layer 2 — Media + brightness (momentary, via `MO(2)` only)

```
no  no  no  no  no  no     M4   F5   F9   F10  F11  F12
no  no  no  no  no  no     no   no   no   no   no   no
no  no  no  no  no  no     no   ⏩   Vol+ Vol- ⏪   no
no  no  no  no  no  no     no   no   B+   B-   no   no
                       trns trns trns                ⏹   ⏯   Mute
```

- Right thumb keys become: Stop / Play-Pause / Mute.
- `M4` macro (leftmost key top row) sends **`Shift+Print` → Cinnamon
  area-screenshot** (drag-to-select). On macOS the same M4 slot sent
  `Cmd+Shift+4`.
- `F5` / `F9–F12` are also here as convenience for media-keyboards that
  double as function keys.

### Layer 3 — Symbols (momentary, via right thumb `LT3(\`)`)

Bracket cluster on the right plus shifted-number row on the right and
programming symbols on the left. The thumb-key itself sends `` ` `` on tap.

### Layers 4–7

Empty (all `KC_TRNS`). Reserved for future use.

### Combos

Only one is defined: **`U` + `I` → Escape** (right-hand combo for an escape
that doesn't need a thumb stretch).

---

## What changed for Linux vs the macOS reference

| Surface | macOS reference (`silakka54-mac.vil`) | Linux (`silakka54-linux.vil`) |
| --- | --- | --- |
| Layer 1 clipboard/save chords | `LGUI(KC_Z/X/C/V/S)` | `LCTL(KC_Z/X/C/V/S)` |
| Macro `M4` | `LGUI + LSFT + KC_4` (region screenshot) | `LSFT + KC_PSCR` (Cinnamon area-screenshot default) |
| Layer 0 `KC_LGUI` thumb | Cmd (macOS app modifier) | Super (Linux WM modifier) — same keycode, different role |

Nothing else changed. The 8 differences above are the *only* deltas.

---

<a name="ghostty"></a>
## Coordination: Ghostty

See [`../../ghostty/config`](../../ghostty/config). The keybinds there are
picked to not collide with what the keyboard already sends:

| Action              | Ghostty keybind       | Why it's safe |
| --- | --- | --- |
| New tab             | `Ctrl+Shift+T`        | Not used by Cinnamon; on Layer 1 the keyboard sends `Ctrl+T` (no Shift) which goes to the shell — harmless. |
| Close tab           | `Ctrl+Shift+W`        | Same reasoning. |
| New split right/down| `Ctrl+Shift+O` / `E`  | Cinnamon doesn't bind these. |
| Focus split         | `Ctrl+Alt+Arrows`     | Cinnamon uses `Ctrl+Alt+Arrows` for workspace switch — **known conflict, see below**. |
| Toggle split zoom   | `Ctrl+Shift+Enter`    | Safe. |
| Copy / paste        | `Ctrl+Shift+C` / `V`  | On Layer 1 the keyboard sends `Ctrl+C` (SIGINT) and `Ctrl+V` (passthrough) — different keys, no conflict. |
| Fullscreen          | `F11`                 | Cinnamon leaves `F11` unset by default. |
| Reload config       | `Ctrl+Shift+Comma`   | Safe. |

**One conscious conflict**: `Ctrl+Alt+Arrows` is wanted by *both* Ghostty
(split focus) and Cinnamon (workspace switch). When Ghostty has focus, the
keybind goes to Ghostty. When any other app has focus, it switches
workspace. This is intentional — inside the terminal you rarely switch
workspace via keyboard (you'd use the keyboard's own layer instead). If you
prefer workspace switching to always win, remove the `goto_split:*`
keybinds from `ghostty/config` and reach them via `Ctrl+Shift+Arrows`
instead.

---

## Coordination: Cinnamon

Run `scripts/cinnamon-shortcuts.nu` on the Linux host (not on macOS) to
apply just three changes:

1. Disable Cinnamon's default `terminal` media key (it launches
   `x-terminal-emulator`, not Ghostty).
2. Add `Ctrl+Alt+T` as a **custom** keybind that explicitly launches
   `ghostty` — same shortcut, correct target.
3. Add `Super+G` → launch Ghostty (thumb-cluster friendly: Super is your
   left thumb, G is index-finger home row).

Everything else is left at Cinnamon defaults:

| Surface | Default | Why we don't touch it |
| --- | --- | --- |
| Tile window (`Super+Arrows`) | Cinnamon default | Lines up with the layout's left thumb = `KC_LGUI` (Super). |
| Switch workspace (`Ctrl+Alt+Arrows`) | Cinnamon default | Same shortcut Ghostty uses for split focus — see [Ghostty](#ghostty). |
| Show desktop (`Super+D`) | Cinnamon default | Thumb + D home row — natural. |
| Screenshots | Cinnamon default | `Print` / `Shift+Print` / `Alt+Print` already match what M4 sends. |

The script is idempotent and safe to re-run.

```nu
nu scripts/cinnamon-shortcuts.nu
```

---

## Loading the layout on the keyboard

1. Flash **Vial-compatible firmware** for the Silakka54 once (only needed
   the first time, not for layout changes):
   - Build from `vial-kb/vial-qmk` under `keyboards/silakka54/`, or
   - Download a prebuilt `.uf2` / `.bin` from the keyboard's repo.
2. Open the **Vial** GUI (AppImage on Linux; `brew install --cask vial`
   provides the same GUI on macOS, useful for editing from this host).
3. Plug in the keyboard via USB, let Vial detect it.
4. `File → Load → silakka54-linux.vil`. Changes apply immediately.
5. Sanity-check:
   - Tap `A`. Should print `a`.
   - Hold `A` past tapping term, tap `T` (or any key). Cinnamon should
     treat it as Super+key (e.g. open the menu if you released without
     another key).
   - Hold `MO(1)` (left pinky bottom) and tap `Right arrow` (right-hand
     `I` cluster). Cursor should move.
   - Tap the M4 key (top-left while on Layer 2). Cinnamon should dim the
     screen and ask you to drag a region.

If anything looks wrong, the orientation of the `LAYOUT()` macro in your
firmware's `keymap.c` may differ from what Vial's `vial.json` expects. The
layout in this folder matches the upstream `vial-qkb` `silakka54` definition
(`LAYOUT`, 5 rows × 6 cols per half + 3 thumbs × 2 = 54 keys).

---

## Updating this layout

Edit `silakka54-linux.vil` directly in a text editor (it's JSON) **or** —
preferred — make changes in the Vial GUI and `File → Save` over the file.
Then commit. Each `.vil` is self-contained: layout, macros, combos,
tap-dance, key overrides, and timing settings all travel with the file.

The macOS reference (`silakka54-mac.vil`) is not maintained — it's a
snapshot of `~/Downloads/untitled.vil` for diffing against the Linux
variant. To produce both variants, keep editing the Linux one and derive
the macOS version only when you need to deploy to a Mac.
