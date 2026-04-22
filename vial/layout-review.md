# Vial Layout Review

This document reviews the current layout in `vial/main.vil` without changing it.

The short version: the layout has good bones for a first 54-key split, but it is doing too many advanced things at once and it is missing easy access to a few keys that matter disproportionately for development work. It should also be treated as a macOS-first layout, not a generic one.

## What Is Already Working

- The overall model is sane: base layer, nav layer, numpad layer, and a symbols layer.
- The board stays close to QWERTY, which is a good choice for a first split.
- Thumbs are doing real work instead of being wasted on duplicate low-value keys.
- Navigation on a dedicated layer is the right direction.
- A right-hand numpad layer is a practical use of a small split.
- Home-row mods are present, which can become excellent once the rest of the layout settles.

## Main Findings

### 1. Escape is in a bad spot

`Esc` is on the far outer left of the `Q` row on both base layouts.

That is one of the weakest repeated reaches on a 54-key split, and `Esc` is too important to leave there. For terminal work, modal editors, browser prompts, app dismiss actions, and general command flow, `Esc` needs to be trivial to hit.

This is the most obviously hostile part of the current setup.

### 2. Backspace is too hard to reach

The layout does not expose an obvious dedicated `Backspace` key on the base layer. The only visible `Backspace` binding is a combo on `U` + `I`, with a matching numpad combo on `KP7` + `KP8`.

That is a poor trade for development work. Editing code means constant correction. `Backspace` should be easier to hit than many of the keys currently occupying prime positions.

There is also a `KC_DELETE` on the outer right side of the base layer, but that is not a real substitute for `Backspace` in most typing flows.

### 3. The symbol layer is not yet programming-first

The symbol layer contains useful programming symbols, but the arrangement is mixed with media and brightness controls:

- brackets and braces are present
- slash, backslash, and pipe are present
- equals and minus are present
- brightness, media, mute, and volume also occupy the same space

The result is usable, but not tight. A dev-focused symbol layer should optimize for frequency and rhythm first:

- `()`
- `{}`
- `[]`
- `/` and `\\`
- `|`
- `=`
- `-`
- `_`
- `+`
- `:`
- `;`
- quotes and backticks

Those should feel clustered and memorable, not mixed with system controls.

### 4. The layout is asking for too much adaptation at once

For a first split board, this setup is ambitious:

- home-row mods
- layer-tap space
- mod-tap tab
- mod-tap enter
- tap dances
- one-shot mods
- combos
- two separate base-layer families

None of those features are bad individually. The problem is the stack. When many timing-dependent behaviors are introduced at the same time, it becomes hard to tell whether discomfort comes from the physical board, the layer design, the tapping configuration, or pure lack of repetition.

That makes the board feel worse than it actually is.

### 5. Two parallel base layouts increase cognitive load

The file contains two base layouts with matching companion layers:

- layers `0` to `3`
- layers `4` to `7`

There is a tap dance used to switch defaults between them.

Maintaining two base setups early on usually makes iteration slower. It doubles the amount of muscle memory you are trying to build and it increases the chance that a problem is only partly fixed because it exists in one base stack but not the other.

### 6. Prime real estate is not aligned with editing frequency

Several high-value editing actions are not in the easiest positions, while lower-frequency actions occupy easy-to-reach locations:

- `Esc` is hard
- `Backspace` is hard
- screenshot/media/brightness actions are comparatively prominent
- base-layout switching exists directly on the board via tap dance

On a tiny split, the best positions should be reserved for the keys that dominate daily usage.

### 7. The layout should be explicitly macOS-first

The current setup looks more like a general compact keyboard experiment than a layout optimized for development on macOS.

For a macOS-first board, the highest-priority assumptions are different:

- `Cmd` is central to almost every daily shortcut
- `Option` matters for word movement and text editing
- `Ctrl` still matters in terminals, shells, and tmux-like workflows, but it is not the only modifier that deserves premium access
- `Home` and `End` are less important on macOS than reliable `Cmd` and `Option` access

On macOS, a dev layout should feel great for:

- `Cmd-C`, `Cmd-V`, `Cmd-X`, `Cmd-Z`
- `Cmd-Tab`
- `Cmd-W`, `Cmd-T`, `Cmd-R`
- `Cmd-Left` and `Cmd-Right`
- `Option-Left` and `Option-Right`
- `Cmd-Backspace`
- screenshot shortcuts like `Cmd-Shift-4`

That means the board should be designed around comfortable `Cmd` and `Option` use, not around generic PC assumptions.

## What This Means In Practice

The current setup is not bad. It is just not yet ruthless enough.

For a "killer" dev layout on a 54-key split, the design should revolve around a short list of keys and actions:

- `Esc`
- `Backspace`
- `Enter`
- `Tab`
- `Space`
- layer access
- arrows and paging
- brackets, braces, parens
- slash, backslash, pipe
- minus, equal, underscore, plus
- quote, double quote, backtick
- command/control/alt/shift

Everything else should lose priority.

For macOS specifically, that means:

- `Cmd` must be extremely easy to hold
- `Option` should be comfortable enough for repeated word-wise editing
- line and document navigation should assume macOS shortcut habits, not physical `Home` and `End` as the primary path

## How To Make It More Killer For Dev Work

### 1. Promote Escape to a thumb or near-thumb position

`Esc` should move to an effortless position.

Strong options:

- thumb key
- thumb tap-hold
- an easy combo that does not involve same-hand stretching
- a home-position-adjacent tap dance if the timing is already fully comfortable

Weak option:

- outer pinky reach on the top-left cluster

If using a modal editor like Neovim, this change alone would have an outsized impact.

### 2. Give Backspace a first-class home

`Backspace` should be available without a deliberate combo. It does not necessarily need a dedicated physical key, but it does need first-class access.

Strong placements:

- thumb key
- thumb tap-hold
- opposite-thumb layer with trivial reach
- a very low-friction combo if the combo is exceptionally natural

For development, `Backspace` should be easier than screenshot, brightness, and base toggles.

### 3. Split the symbol layer from media controls

Programming symbols should get a clean, coherent layer. Media and brightness can live on a tertiary layer, combo, or less prominent position.

A better dev-first symbol layer would group symbols by shape and pairing:

- one zone for `()`, `[]`, `{}`
- one zone for `/`, `\\`, `|`
- one zone for `-`, `_`, `=`, `+`
- one zone for quotes, backtick, comma, dot, colon, semicolon

The current layer already contains most of the right ingredients. The problem is prioritization, not capability.

### 4. Reduce the number of "clever" features temporarily

For a first split, the fastest path to a better board is often to simplify before optimizing.

Good candidates to reduce or postpone:

- one-shot mods you do not use daily
- tap dances that are not essential
- duplicate base-layer families
- advanced combos for keys that should just be easy

This is not an argument against advanced QMK behavior. It is an argument for sequencing.

### 5. Keep one stable base layout until the fundamentals feel automatic

Pick one base stack and harden it first.

That gives cleaner feedback on:

- whether home-row mods are actually working for you
- whether thumb roles are correct
- whether the symbol layer is memorable
- whether navigation feels natural

Once that stabilizes, experimentation becomes much cheaper.

### 6. Reserve outer columns for low-frequency actions

On a small split, outer columns are fine for actions you do not need to spam:

- screenshot
- media control
- brightness
- base switching
- niche macros

They are not great homes for keys like `Esc` or core editing behavior.

### 7. Bias the layout toward macOS modifier ergonomics

If the target machine is macOS, the modifier story should reflect that directly.

Practical implications:

- `Cmd` should get the easiest hold position, usually on a thumb or very comfortable mod-tap
- `Option` should support repeated text movement without awkward reaches
- `Ctrl` should remain available for terminal workflows, but it should not crowd out `Cmd`
- `Cmd-Tab`, `Cmd-Backspace`, and common app shortcuts should feel easier than media controls

This also reduces the value of dedicating too much space to `Home` and `End`. On macOS, the better investment is making `Cmd` and `Option` combinations feel natural.

## Suggested Priority Order

If this layout were being refined for development use, the order of operations should be:

1. Fix `Esc`.
2. Fix `Backspace`.
3. Rework the symbols layer to be programming-first.
4. Make the modifier strategy explicitly macOS-first, especially `Cmd` and `Option`.
5. Move media and brightness out of prime positions.
6. Collapse to one base layout while learning the board.
7. Reintroduce advanced behaviors only after the fundamentals are stable.

## Final Take

The layout is not far off. It already reflects the right broad idea for a compact split keyboard.

What keeps it from feeling great is that a few critical keys are in the wrong places, the layout is not explicitly optimized for macOS, and too much sophistication was introduced at once. A dev-focused macOS version of this setup would be less clever, more ruthless, and much more biased toward editing comfort than toward novelty.
