# Vial Layouts

This directory tracks the Vial exports for the 54-key split board.

`main.vil` is the current recommended layout and matches `main-r9.vil`.

## Files

- `main-r1.vil`: first simplified pass after removing most of the original complexity.
- `main-r2.vil`: improved `Backspace` placement and moved `\` back to the symbols layer.
- `main-r3.vil`: added a real `Caps Lock` key and cleaned up the media layer.
- `main-r4.vil`: pre-`r5` baseline used during the final review cycle.
- `main-r5.vil`: first stable `Tab`/`=`/nav-shortcut pass.
- `main-r6.vil`: Miryoku-leaning nav/media cleanup.
- `main-r7.vil`: shortcut-driven thumb rewrite.
- `main-r8.vil`: media alignment pass on top of `r7`.
- `main-r9.vil`: current recommended layout.
- `main.vil`: copy of `main-r9.vil` for convenience.
- `index.html`: interactive viewer for the current `r9` layout.
- `layout-review.md`: review and handoff notes.

## Design Goals

- macOS-first daily driver
- one stable base stack
- easy `Esc`, `Backspace`, `Delete`, and `Tab`
- thumb-first access for nav, window/dev, and symbols
- direct support for Rectangle and VS Code workflows
- fewer hidden behaviors while learning the board

## Layer Overview

### Layer 0: Base

- `Tab`: left outer key on the `Q` row
- `LT1(KC_ESCAPE)`: left outer thumb gives tap `Esc`, hold nav/function
- `KC_LGUI`: left inner thumb is now a dedicated macOS `Cmd`
- `LT2(KC_SPACE)`: left space thumb gives tap `Space`, hold window/dev
- `KC_ENTER`: right inner thumb is now a dedicated `Enter`
- `Backspace`: right outer key on the bottom alpha row
- `Delete`: right outer key on the top alpha row
- `MO(1)`: backup nav/function hold on the left home-row outer key
- `M4`: macOS screenshot macro on the left bottom-row outer key
- `LT3(KC_GRAVE)`: right outer thumb gives tap backtick, hold symbols

### Layer 1: Nav / Function

- left side: `F1` to `F12`
- right top alpha row: `Cmd-Z`, `Cmd-X`, `Cmd-C`, `Cmd-V`, `Cmd-S`
- right home row: arrows, plus `Caps Lock` on the inner key
- right bottom row: `End`, `Page Up`, `Page Down`, `Home`, `Insert`
- right thumbs: `Delete`, `Backspace`, `Enter`

### Layer 2: Window / Dev

This layer is intentionally right-hand heavy so it works cleanly while holding `LT2(KC_SPACE)` with the left thumb.

- right top alpha row: terminal macro, `Ctrl-R` fuzzy-search macro, `F5`, `F9`, `F10`
- right home row: direct Rectangle macros for right, up, down, left, and enter
- right bottom row: `F11`, `F12`, `Volume Down`, `Volume Up`, `Mute`
- right thumbs: `Previous`, `Play/Pause`, `Next`
- left lower row: `Brightness Down`, `Brightness Up`

`M4` sends `Cmd+Shift+4` for the macOS area screenshot tool.
`M6` sends Control-Shift-backtick for the VS Code terminal shortcut.
`M7` sends `Ctrl+R` for fuzzy-search workflows.

### Layer 3: Symbols

- brackets, parens, braces
- minus / underscore / equals / plus
- slash, backslash, pipe
- shifted number-row symbols
- backtick and tilde stay here on hold, with direct backtick tap on the right outer thumb

## What Changed In r9

- kept `r8`'s working base keys: `Tab`, `=`, dedicated `Cmd`, dedicated `Enter`, easy grave, easy symbols
- moved the primary window/dev layer onto `LT2(KC_SPACE)` to make layer access more Miryoku-like
- removed `MO(2)` from the base layer
- rebuilt Layer 2 around actual workflows: VS Code terminal, fuzzy search, Rectangle, and debugger keys
- demoted media to supporting positions instead of letting it drive the whole layer
- aligned the nav layer right hand with Miryoku's row logic: shortcuts on top alpha, arrows on home, extended nav on bottom
- kept `MO(1)` as a deliberate backup so full `F1` to `F12` access still works comfortably

## Import

Open Vial and load either `main.vil` or `main-r9.vil`.

## Viewer

Open `index.html` in a browser for a Miryoku-style visual reference of the current layout, layers, thumb logic, and common macOS/dev shortcuts.
