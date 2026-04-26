# Vial Layout Review

## Agent 1 Handoff

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

---

## Agent 2 Handoff

This review builds on the findings from Agent 1. Agent 1 correctly identified the seven biggest surface-level problems. What follows are the deeper structural issues that Agent 1 missed or underplayed — the things that will quietly make this layout feel wrong even after the obvious fixes are applied.

### 1. `LT3(KC_SPACE)` is the most dangerous timing trap in the layout

Agent 1 flagged Backspace accessibility. The real problem is more specific: the only way to reach the symbol layer (Layer 3) is by holding the right thumb during Space. That means:

- If you hold Space for any reason — thinking, resting your thumb — you get symbol garbage instead of a repeated space.
- Left-hand-only Space cannot access the symbol layer at all. This breaks symmetric typing flow.
- The opposite thumb key (`KC_SPACE` on the left) is plain Space with no layer hold. So the two thumbs have asymmetric and contradictory behavior for what should be the same key.

A dev typing code constantly shifts between Space and symbol-layer access. Merging them on one thumb guarantees accidental layer activations. Either move the symbol-layer hold to a dedicated thumb or split the layer trigger away from Space entirely.

### 2. Home-row mods are PC-biased, not macOS-biased

Agent 1 said to make `Cmd` easy to hold. That is correct but does not go far enough. The current home-row mods are:

- Stack 0: `LCTL_T(S) / LALT_T(D) / LSFT_T(F)` left, `RCTL_T(L) / RALT_T(K) / RSFT_T(J)` right. Zero `Cmd`/`GUI` on the home row.
- Stack 4: `KC_S / LALT_T(D) / LSFT_T(F)` left, `KC_L / RALT_T(K) / RSFT_T(J)` right. Still zero `Cmd` on the home row.

On macOS, `Cmd` is the primary modifier. It should occupy the strongest home-row mod position — typically the ring or middle finger, not a thumb mod-tap with `Tab` or `Enter` competing for the same physical key. `Ctrl` should be demoted. The current layout is optimized for a PC workflow where `Ctrl` is king. A macOS dev layout should put `GUI_T` on the home row and push `CTL_T` to a secondary position.

### 3. The numpad layer is wasted real estate for dev work

Agent 1 called the numpad "a practical use of a small split." For a developer, it is not. Layer 2 mixes a left-hand number row (`1`–`0`) with a right-hand numpad. You will never use both in the same context. If you need raw number entry, the numpad works. But coding primarily uses the number row inline with symbols, not a dedicated keypad.

One of only four layer slots is consumed by something used rarely. That slot should be a second programming layer — perhaps a strict bracket/symbol layer organized by pairing, or a dedicated terminal/tmux layer. The numpad can be demoted to a sub-layer or removed entirely.

### 4. Thumb keys are burning on Unicode and Meh instead of Esc/Backspace/layer-access

Agent 1 recommended promoting `Esc` and `Backspace`. The specific obstacle it missed: the thumb positions that should receive those keys are currently occupied by:

- `TD(2)` left thumb: tap = Unicode `0x7c73`, hold = one-shot Hyper (`LSFT|LALT|LGUI`)
- `TD(3)` in Stack 4: similar, with `OSM(MOD_MEH)`

These are extremely niche chording actions sitting on the most valuable real estate on a split keyboard. Thumbs should handle layer triggers, Space, Enter, Backspace, and Esc. Unicode input and Meh combos are once-a-week actions at best. Freeing these thumbs is the prerequisite for fixing `Esc` and `Backspace`.

### 5. The nav layer overrides home-row mods incorrectly

Agent 1 said navigation on a dedicated layer is the right direction. It did not check the implementation. On Layer 1:

- `S/D/F` (home-row mod-tap positions on base) become `LCTRL/LALT/LSHIFT` — plain modifiers, not navigation keys.
- Arrows are on `I/J/K/L` — which is fine — but the home row is now wasted on mod repeats that already exist on the base layer via mod-taps.

The nav layer should put movement under the home-row fingers (vim-style `HJKL` or similar), not burn the home row on redundant modifiers. This is a missed opportunity to make navigation feel like an extension of typing rather than a separate mode.

### 6. `TD(0)` on the outer-left pinky is squandered

`TD(0)` sits at the outer-left pinky on both base stacks. It maps to: tap = Unicode `0x7c73`, hold = one-shot Hyper. This is an unrecognizable action on a key position that should be reserved for something you can hit without thinking. On a dev layout, that position would be far better served by `Esc` or `Backspace`.

### 7. Screenshot and unknown macros waste prime outer-column positions

Agent 1 flagged that media controls are too prominent. The specific culprits:

- `M4` (outer-top-left, base layer) = `Cmd+Shift+4` screenshot. Once-a-day action.
- `M5` (symbol layer) = `RAlt+RShift+/`. Unclear purpose on macOS.

These occupy positions that could hold far more frequently needed actions. Outer columns are weaker than inner columns on a split, but they are not zero-value. Screenshot belongs on a sub-layer, not the base.

### 8. Backtick and `~` deserve better placement

Developers use backtick constantly: template literals, Markdown code fences, shell command substitution. On the symbol layer (Layer 3), `KC_GRAVE` exists on the right top row, but `~` (shifted backtick) requires chaining another shift. For a dev board, `` ` `` and `~` should be on easy, memorable positions — ideally paired on the same key or adjacent keys within the symbol cluster.

### What Agent 1 Got Right That Should Not Be Undone

Agent 1's priority order is correct. Fix `Esc`, fix `Backspace`, clean up the symbol layer, go macOS-first, remove media from prime positions, collapse to one base, and reintroduce advanced features later. The new findings above should slot in as refinements to those steps, not as replacements:

- Fixing `Esc` and `Backspace` requires first freeing the thumb keys from Unicode/Meh/TD duty.
- Going macOS-first means restructuring home-row mods to put `GUI_T` on the home row, not just moving `Cmd` to a thumb.
- Collapsing to one base layout frees an entire layer stack that can replace the numpad with something dev-first.
- The `LT3(Space)` problem is a timing bug waiting to happen. Separate the layer trigger from Space before you invest muscle memory in the current symbol-layer access pattern.

### Revised Priority Order

1. Move `Esc` to a freed thumb key (replacing `TD(2)` Unicode).
2. Move `Backspace` to the other freed thumb or a low-friction combo.
3. Separate the symbol-layer trigger from `LT3(KC_SPACE)` — give it a dedicated hold on a thumb or a non-conflicting layer-tap.
4. Restructure home-row mods: `GUI_T` on the home row, `CTL_T` demoted.
5. Replace the numpad layer with a second dev-focused layer (brackets cluster or terminal layer).
6. Clean up the symbol layer: group by pairing, eject media/brightness to a tertiary position.
7. Reposition `TD(0)` from outer-left pinky to something recognizable (`Esc` or `Backspace` backup).
8. Move screenshot and `M5` off prime positions.
9. Add `` ` `` and `~` to easy symbol-layer positions.
10. Collapse to one base layout stack.
11. Reintroduce tap dances, one-shot mods, and combos only after the fundamentals feel automatic.

---

## Agent 3 Handoff

Agent 3 attempted to execute the recommendations from Agents 1 and 2 by rewriting `main.vil` directly. The intent was right. The execution has several problems.

### What Agent 3 Got Right

1. **Esc moved to left outer thumb.** Replacing `TD(2)` (Unicode/Hyper) with a dedicated `KC_ESCAPE` is correct and is the single biggest improvement in the rewrite.

2. **Backspace promoted on the base layer.** `KC_BSPACE` replaces `KC_DELETE` at the right outer-top position. This is a clear upgrade for dev editing.

3. **Symbol layer trigger separated from Space.** `LT3(KC_SPACE)` is gone. Right thumb Space is now plain `KC_SPACE`. Symbol layer is accessed via `MO(3)` on the right inner thumb. This eliminates the timing trap that Agent 2 identified.

4. **Numpad layer repurposed for media/system.** Layer 2 is now a dedicated media/brightness/screenshot layer instead of a redundant numpad. This is the right direction — media belongs on its own layer, not mixed with symbols.

5. **Symbol layer cleaned of media.** Layer 3 no longer contains `KC_BRIU`, `KC_MPLY`, `KC_BRID`, `KC_MUTE`, `KC_VOLU`. Those moved to Layer 2. Programming symbols now have a coherent layer.

6. **Tapping term bumped from 175ms to 200ms.** Correct for a first split. Reduces mod-tap misfires while learning.

7. **Backdrop layers collapsed.** Layers 4-7 are now all `KC_TRNS`. One base stack to learn. This is exactly what Agents 1 and 2 recommended.

8. **Tap dances wiped.** All tap dances set to `KC_NO`. Removes the layer-switching tap dance, the Unicode tap, the Hyper/Meh holds. Simplifies the board dramatically.

### What Agent 3 Got Wrong

#### 1. Backtick replaced Esc on the number row — and Esc lost its number-row presence entirely

Agent 3 put `KC_GRAVE` where `KC_ESCAPE` used to be (left outer-top). The logic is understandable: move Esc to a thumb, repurpose the old position. But ` on the number row is not where developers need backtick most — they need it on the symbol layer alongside other programming characters. Putting ` on the base layer outer column means you have a key you rarely press standalone taking up a position that could be used for something more frequent.

More critically, Esc is now *only* on the left outer thumb. If you are in a flow where you need Esc rapidly (modal editing, dismissing dialogs), having a single point of access with no fallback creates a single point of failure. The old layout had Esc in a bad spot but at least it existed. A better approach: keep Esc on the thumb, and give the old top-left position to something that matters more on the base layer — like `KC_MINUS` or `KC_EQUAL`, which developers use constantly.

#### 2. Backspace placement is still not ideal

Agent 3 put `KC_BSPACE` at the right outer-top position (where `KC_DELETE` was). On a split keyboard, the outer-top-right is a reach. It is better than a combo, but it is not a thumb key or a home-row adjacent. For a dev who backspaces constantly, this is still a secondary position.

Meanwhile, the right bottom-row outer position (where `TD(0)` was) became `KC_BSLASH`. Backslash is useful but far less frequent than Backspace. Agent 3 prioritized backslash — a symbols-layer-appropriate key — over giving Backspace an even better home.

The better move: swap them. Put `KC_BSPACE` on the right bottom-row outer (where it is closer to the thumb cluster) and put `KC_BSLASH` on the symbol layer where it belongs alongside other programming characters.

#### 3. The `KC_EQUAL` placement on the right outer-top is wrong

Agent 3 replaced `M4` (screenshot) on the right outer-top with `KC_EQUAL`. On the original layout, the right outer-top was `M4` (right half, row 0, position 0). `KC_EQUAL` already exists on the symbol layer. Duplicating it on the base layer outer column is not the best use of that position — equals is needed during coding, but almost always alongside other symbols, meaning you would be on the symbol layer anyway when typing `=`, `=>`, `==`.

That position would be better served by `KC_GRAVE` (backtick) if backtick must be on the base layer, or by a high-frequency editing key. Better yet, leave it available for a future adjustment rather than burning it on a redundant symbol.

#### 4. The media layer (Layer 2) is spatially incoherent

Agent 3's Layer 2 has media controls scattered without clear positional logic:

- Right half top row is mostly `KC_NO` except brightness up/down in the middle
- Right home row has volume and media playback mixed across all positions
- Right bottom row has mute and delete
- Left half is almost entirely transparent
- M4 (screenshot) sits on the left home row outer column — the same `MO(2)` position on the base layer that activates this layer. That means if you are already on Layer 2, you cannot press the key that got you there to activate the screenshot macro. This is a self-referential conflict.

For a media/system layer, a coherent layout would be:

- Left half: F-keys (if needed) or unused
- Right half: cluster media playback together in one zone, volume in another, brightness in another
- Screenshot on an outer column position that is not the layer activator

#### 5. Removing `KC_DELETE` entirely from the base layer is a regression

The original layout had `KC_DELETE` on the right outer-top-home position. Agent 3 replaced it with `KC_BSPACE`. But `Delete` (forward delete) is still useful on macOS — `Cmd-Delete` moves files to trash, `Fn-Delete` forward-deletes in text. Having `Delete` on the media layer (Layer 2) as a secondary access is acceptable, but it should be clearly documented that forward-delete is no longer a base-layer key.

#### 6. All combos were preserved except the numpad one — but the Backspace combo is now redundant

Agent 3 kept the `U+I -> Backspace` combo but also added a dedicated `KC_BSPACE` on the base layer. The combo is now redundant. It should be removed to simplify the board or repurposed for something else (like `Esc` as a dual-access point).

#### 7. Tap dance wipe was too aggressive

Wiping all tap dances to `KC_NO` is fine for simplification. But Agent 3 also removed `TD(0)` from the right bottom row and replaced it with `KC_BSLASH` — meaning the layout-switching tap dance that existed before is gone. If the user ever wants to experiment with a second base layout again, there is no mechanism to switch to it. This is fine for now given the single-stack approach, but it is worth noting that a clean slate means re-creating tap dances from scratch later.

#### 8. `MO(1)` and `MO(2)` swapped — nav layer is now Layer 1, numpad/media is Layer 2

On the original layout, `MO(2)` activated Layer 2 (numpad) from the left home row, and `MO(1)` activated Layer 1 (nav) from the right thumb. Agent 3 swapped these:

- Left home row outer: `MO(1)` (nav)
- Left bottom row outer: `MO(2)` (media)
- Right inner thumb: `MO(3)` (symbols)

This is an improvement in terms of layer numbering logic — nav as Layer 1 is more intuitive than numpad as Layer 2. But the physical trigger positions changed:

- Nav is now on the left home row outer (where numpad was). This is a prime position often used for layer access.
- Media is on the left bottom row outer — a worse position, which is correct since media is lower priority.
- Symbols is on the right inner thumb.

The concern: you now need three separate layer-hold keys (left home, left bottom, right thumb) to access three layers. On the original, symbols were reached through the right thumb (`LT3(Space)`) and nav through the right thumb (`MO(1)`). Now two layers are on the left hand and one is on the right. For a developer who types with both hands, holding a left-hand layer key while typing with the right hand is natural for nav and symbols. But holding a left-hand layer key while also needing left-hand keys on that layer creates conflicts. Nav and symbol layers should ideally be accessible from opposite hands for maximum flexibility.

The original layout had this right: nav on the right thumb, numpad on the left hand. Agent 3's new arrangement puts nav and media both on the left hand, which means your left hand is doing double duty for layer access.

### What Agent 3 Missed Entirely

#### 1. No home-row mod restructuring

Agents 1 and 2 both recommended considering `GUI_T` on the home row for macOS. Agent 3 left the home-row mods exactly as they were: `LCTL_T(S)`, `LALT_T(D)`, `LSFT_T(F)`, `RCTL_T(L)`, `RALT_T(K)`, `RSFT_T(J)`. The macOS modifier priority problem was identified but not addressed.

To be fair, Agent 3's "own conclusion" noted that GUI on thumbs should be tested before restructuring home-row mods. That is a reasonable position. But the handoff should explicitly call this out as a deferred item, not leave it ambiguous.

#### 2. Nav layer home-row redundancy not fixed

Agent 2 flagged that Layer 1's home row (`S/D/F`) becomes plain `LCTRL/LALT/LSHIFT` — redundant with base-layer mod-taps. Agent 3 left Layer 1 completely unchanged. If nav is now the primary left-hand layer (activated by `MO(1)` on the left home row outer), this redundancy matters more because you will be on this layer more often.

#### 3. No consideration of `KC_GRAVE` vs `KC_MINUS` frequency on the base number row

The original layout had `KC_MINUS` on the left outer-top (number row). Agent 3 replaced `KC_ESCAPE` with `KC_GRAVE` there, but left `KC_MINUS` where it was — the very first position on the number row (left outer-top, row 0). So now the number row starts with `-` on the far left and `` ` `` one row below on the far left. Neither is optimally placed. In the original layout, `-` at row 0 position 0 was already a questionable choice since minus is primarily a coding symbol best accessed on the symbol layer. `KC_GRAVE` would be better placed there too, or the position could be given to something more frequently needed on the base layer.

### Verdict on Agent 3's Layout

Agent 3 made the right high-level moves: Esc to thumb, Backspace on base, separate symbol access from Space, collapse to one stack, clean up symbols, bump tapping term. Those are the most impactful changes and they should be kept.

The errors are in placement details and spatial coherence:

- Backtick on the number row is not the best use of that position
- Backspace should be even closer to the thumb cluster
- `KC_EQUAL` is redundant on the base outer column
- The media layer is scattered
- Layer access is now left-hand-heavy
- Home-row mod restructuring was deferred without explicit acknowledgment
- Nav layer redundancy was not addressed

### Recommended Adjustments to Agent 3's Layout

1. Move `KC_BSPACE` from the right outer-top to the right bottom-row outer (where `KC_BSLASH` is now). Put `KC_BSLASH` on the symbol layer.
2. Replace `KC_GRAVE` on the base number row with something more useful — either `KC_MINUS`, `KC_EQUAL`, or leave it as `KC_ESCAPE` as a secondary Esc access point. Move backtick to the symbol layer alongside other programming characters.
3. Replace `KC_EQUAL` on the right outer-top with something that is not already on the symbol layer — or use it for `KC_GRAVE` if backtick must be base-layer accessible.
4. Reorganize Layer 2 (media) with coherent spatial grouping. Move screenshot off the `MO(2)` activator key.
5. Consider rebalancing layer access: move nav layer trigger back to a right-hand key, or at minimum document that nav + media both being left-hand layers is a known constraint.
6. Remove the now-redundant `U+I -> Backspace` combo, or repurpose it for `Esc`.
7. Acknowledge home-row mod restructuring and nav layer redundancy as explicitly deferred items with a note to revisit after the base layout stabilizes.

---

## Agent 4 Handoff

Agent 4 implemented `r3` in `main-r3.vil` and mirrored it into `main.vil`.

The goal was not to produce a perfect final layout. The goal was to make Agent 3's layout more internally coherent without reopening every unresolved design decision at once.

### What Agent 4 Changed

1. **Added a real `Caps Lock` key.** `KC_CAPS` now lives on the left outer key of the `Q` row. This directly answers the earlier question about whether the layout had Caps Lock, and it puts the key in a place that is easy to find without consuming thumb real estate.

2. **Kept the strongest Agent 3 changes.** `Esc` remains on the left outer thumb. `Backspace` remains on the right outer bottom position, which is closer to the thumb cluster than the older top-right placement. `Delete` returns to the right outer top position, preserving forward-delete access on the base layer.

3. **Reworked the media layer into a coherent right-hand cluster.** Layer 2 now groups screenshot, brightness, playback, volume, and mute into a single right-hand zone that can be used while holding `MO(2)` with the left hand. This fixes the earlier "scattered media layer" problem and moves screenshot off the layer activator itself.

4. **Moved backtick and tilde fully onto the symbols layer.** Backtick is no longer burning a base-layer position. This matches the earlier critique that `` ` `` and `~` belong with other programming symbols.

5. **Removed the redundant combo and dead macro.** The `U+I` combo no longer emits anything, and the unused `M5` macro slot was cleared. This reduces hidden behavior and makes the board easier to reason about.

### What Agent 4 Intentionally Did Not Change

1. **Home-row mods are still not macOS-first.** `GUI_T` was not moved onto the home row. That remains a meaningful open issue, but changing it now would alter the modifier model more radically than the rest of `r3`.

2. **The nav layer was left structurally unchanged.** Layer 1 still works, but it still has the same weakness Agent 2 identified: the home-row mod positions become plain modifiers instead of doing more useful navigation work.

3. **Layer access is still left-hand heavy.** `MO(1)` and `MO(2)` remain on the left side, while `MO(3)` remains on the right thumb. This is workable, but it is still a tradeoff rather than an ideal final arrangement.

### Evaluation Of r3

`r3` is the first version in this repo that feels like a coherent daily-driver candidate instead of a promising experiment.

Why:

- there is now a real `Caps Lock`
- `Esc`, `Backspace`, and `Delete` all exist in explicit, memorable places
- the media layer has an actual spatial logic
- the base layer is no longer wasting a key on standalone backtick
- hidden behaviors were reduced instead of added

That said, `r3` is not "done". It is a stable stopping point.

### Remaining Weak Points

1. **Modifier priority is still not truly macOS-first.** `Cmd` is still easiest on the thumbs, not on the home row. That may be acceptable, but it means the board is still only partially aligned with macOS shortcut reality.

2. **The nav layer is still more "function layer with arrows" than a polished navigation layer.** It works, but it is not yet exploiting the home row well.

3. **The symbol layer is improved but not fully minimal.** It still has some duplication and some placements that are merely acceptable rather than obviously optimal.

4. **`Caps Lock` is practical, not elegant.** It solves the explicit requirement cleanly. For pure development ergonomics, `Caps Word` would still be the more interesting long-term upgrade if supported cleanly by the firmware setup.

### Recommendation From Agent 4

Do not immediately churn this into `r4` or `r5`.

Use `r3` long enough to answer real questions instead of hypothetical ones:

- Does thumb `Cmd` feel sufficient on macOS, or do you actually miss `GUI_T` on the home row?
- Does the nav layer annoy you often enough to justify a dedicated rewrite?
- Do you use `Caps Lock` enough to keep it, or would `Caps Word` eventually be the better replacement?
- Does the left-hand-heavy layer access show up as a real problem in practice?

If another revision happens after real use, the next highest-value changes are:

1. Make the modifier strategy more explicitly macOS-first.
2. Rebuild Layer 1 into a stronger nav layer.
3. Rebalance layer access if the left-hand concentration proves annoying.

### Bottom Line

Agent 4's `r3` is an improvement over Agent 3's layout because it resolves the most obvious coherence gaps without reintroducing complexity.

It should be treated as the current baseline, not the final answer.

---

## Miryoku Case Study

This section evaluates whether a Miryoku-inspired direction makes more sense than continuing to iterate only inside the current `r1`/`r2`/`r3`/`r4` lineage.

### Correction: the "GUI thing" is not a double tap

The tested Miryoku V1 Vial config uses tap dance on `A` and `O`, but not in the way I previously described.

The behavior is:

- tap `A` -> `A`
- hold `A` -> `GUI`
- tap `O` -> `O`
- hold `O` -> `GUI`

The double-tap slots are unset. So this is not "double tap for GUI". It is a tap-dance implementation of a hold-for-GUI behavior that could also have been expressed more simply as a mod-tap.

### What Full Miryoku Gets Right

Miryoku is not just a random compact layout. It has a real design philosophy:

- thumbs do the primary control work
- layers are orthogonal instead of mixed
- opposite-hand layer access is the default
- home-row mods are part of the system, not an afterthought
- reaching is replaced by layer logic

That is exactly the kind of thinking that can reduce strain over time if the user is willing to pay the learning cost.

### What QWERTY-fying Miryoku Would Actually Solve

If the Miryoku base layer were changed to QWERTY:

- the alpha-layout relearn would disappear
- the rest of the Miryoku philosophy would stay intact
- it would become much easier to judge the layer model on its own merits

This is important because the biggest barrier for many users is not Miryoku's layer logic. It is trying to learn both a new alpha layout and a new keyboard operating system at the same time.

### What QWERTY-fying Miryoku Would Not Solve

Changing only the alpha layer does **not** solve all the other problems:

- it still has a large layer system
- it still expects home-row mods
- it still depends on timing-sensitive thumb holds
- it is still not explicitly macOS-first
- the tested Silakka V1 config still includes mouse/media/function complexity that a dev may not need
- it still does not automatically answer the "best symbol strategy for coding on macOS" question

So a QWERTY Miryoku would solve the alphabet problem, not the whole problem.

### Does Full Miryoku Make Sense For This Use Case?

Partly.

For a user who says:

- "I want something that makes sense"
- "I am willing to fight the learning curve"
- "I want to reduce strain"
- "I care about developer productivity"

Miryoku is worth taking seriously.

But the tested Miryoku Silakka V1 config is still a lot:

- home-row mods
- tap-dance on GUI keys
- combos
- six thumb-held layers beyond base
- symbols, numbers, function, media, navigation, mouse

That is a coherent system. It is also probably more system than is needed for a first serious macOS dev setup.

### The "Coding Optimized" Miryoku Variant

The coding-oriented Miryoku variant is interesting for one reason above all others: it puts developer delimiters directly on the base layer.

That is the strongest idea in the whole experiment:

- `{}`
- `[]`
- `()`
- `\\`
- `=`

This directly addresses the complaint that a small split can feel anti-dev if coding symbols are too buried behind layers.

However, the current "Coding Optimized" version should not be treated as production-ready evidence. It is a work-in-progress visualizer/config concept, not the same thing as the tested V1 Vial export.

### What This Means For The Current Layout Lineage

Do **not** throw away `v1`/`v2`/`v3`/`v4`.

Those revisions already taught the important local truths:

- `Esc` matters more than cleverness
- `Backspace` and `Delete` need first-class access
- too many hidden behaviors make the board feel worse
- macOS modifier priority matters
- the board should be dev-first, not generic compact-keyboard clever

That knowledge is more valuable than importing a foreign layout wholesale.

### Recommended Direction: Miryoku-Lite, Not Full Miryoku

The most sensible next experiment is not "replace everything with Miryoku".

It is:

- keep QWERTY
- keep the board macOS-first
- keep only the Miryoku conventions that are truly worth stealing

Specifically:

- opposite-hand layer access
- thumb-centered control
- maybe home-row mods later, after the base stabilizes
- direct base access to the most important coding delimiters

And avoid importing the parts that add complexity faster than value:

- mouse layer
- tap-dance unless it clearly beats mod-tap
- excessive combo dependence
- layers that exist because the system can support them, not because the workflow demands them

### Bottom Line

A QWERTY-fied Miryoku would make **more** sense than full non-QWERTY Miryoku for this user, but it would not solve everything.

The right conclusion is not "throw away the current layout history".

The right conclusion is:

1. treat the current `r` lineage as evidence of what actually matters on this board
2. treat Miryoku as a source of high-quality conventions
3. explore a macOS-first, QWERTY, dev-oriented Miryoku-lite variant rather than full Miryoku V1

---

## Agent 4 Handoff Challenge

The following cross-examines Agent 4's claims against the actual `main.vil` file. Each claim is verified, corrected, or challenged.

### Claim 1: "Added a real Caps Lock key"

**Verified, but the tradeoff is wrong for dev work.**

Agent 4 replaced `KC_GRAVE` (backtick) on the left `Q` row outer with `KC_CAPS`. This is factually correct — `KC_CAPS` is now at Layer 0, Row 1, Col 0.

The problem: Caps Lock is a low-frequency key on a dev board. Developers rarely need all-caps. When they do, they typically hold Shift or use a Caps Word equivalent. Burning the left `Q` row outer — a position that could serve as a secondary Esc, a layer key, or `KC_GRAVE` — on Caps Lock is a misallocation. This was a position Agents 1-3 all wrestled with (Esc → backtick → now Caps Lock), and none of the choices were great, but Caps Lock is the lowest-value option yet.

What would be better: leave it as `KC_ESCAPE` for dual-access Esc (thumb + traditional position), or use `CW_TOGG` (Caps Word) instead of `KC_CAPS` so it auto-deactivates after a word — a strictly superior behavior for the rare cases you need it. Agent 4 even acknowledged this in its own handoff ("Caps Word would still be the more interesting long-term upgrade") but chose the weaker option anyway.

### Claim 2: "Kept the strongest Agent 3 changes"

**Partially verified. Agent 4 also kept some of Agent 3's mistakes.**

Correct: Esc on left outer thumb, Backspace on right bottom-row outer, Delete on right outer top. These are the good changes and they survived.

However, `KC_EQUAL` on the right number row outer (Layer 0, Row 5, Col 0) is still there from Agent 3. My earlier handoff flagged this as redundant since `=` already exists on the symbol layer. Agent 4 did not address this. The position is still burning on a key you almost always type from the symbol layer.

### Claim 3: "Reworked the media layer into a coherent right-hand cluster"

**Verified with caveats.**

Layer 2 is now right-hand-only (rows 5-8) with all left-hand keys set to `KC_NO`. This is an improvement over the scattered layout from r2. M4 (screenshot) moved from the left home row outer (position that conflicts with `MO(2)`) to the right number row outer — fixing the self-referential conflict.

The spatial grouping:
- Row 5: screenshot, brightness down, brightness up
- Row 6: prev, vol down, play/pause, vol up, next
- Row 7: mute

This is coherent and usable with the left hand holding `MO(2)`. However, Agent 4 removed `KC_DELETE` from the media layer entirely (it was at Layer 2, Row 8, Col 2 in r2). The Agent 4 handoff says "Delete returns to the right outer top position, preserving forward-delete access on the base layer" — true, but Delete is now *only* on the base layer with no layer-2 backup. This is fine for normal use but worth noting.

### Claim 4: "Moved backtick and tilde fully onto the symbols layer"

**Verified, but the migration created a new problem.**

Backtick moved from base Layer 0 Row 1 Col 0 to symbol Layer 3 Row 1 Col 5 and Row 2 Col 5 (for `` ` `` and `~`). This is correct. The old symbol layer positions for backtick (Layer 3, Row 6, Col 5 for `` ` `` and Row 7, Col 5 for `~`) were cleared to `KC_NO`.

The problem: backtick now appears in **two different positions** on the symbol layer. Simultaneously, the old positions are `KC_NO`. So there's a migration path issue — if the user had muscle memory for the old backtick position on the symbol layer, it's now gone. And the new position (Row 1, Col 5 = right outer on the bracket row) is a weaker spot — outer columns on a split are harder to reach. The old position (Row 6, Col 5 = inner column, top row) was actually better.

Agent 4 moved backtick to be adjacent to the bracket cluster (`{`, `}`, `[`, `]`) which has a logic to it. But the physical ergonomics are worse. On a 54-key split, inner columns reach easier than outer columns.

### Claim 5: "Removed the redundant combo and dead macro"

**Verified for the combo, oversimplified for the macro.**

- Combo 1 (`U+I -> Esc`) was cleared to all `KC_NO`. This removes the dual-Esc access I set up in r2. Esc is now *only* on the left outer thumb — no combo backup. Agent 4 chose simplicity over redundancy. Whether this is right depends on how reliable the thumb Esc feels in practice.

- Macro 5 (`RAlt+RShift+/`) was cleared. Agent 4 called it "unused." This is probably correct — M5 was flagged by Agents 1-3 as unclear in purpose.

- Macro 4 (screenshot, `Cmd+Shift+4`) was kept. This is fine since it's used on the media layer.

### What Agent 4's Handoff Got Wrong

#### 1. No mention of the `KC_EQUAL` redundancy

Agent 4's handoff lists what it "intentionally did not change" but never mentions `KC_EQUAL` on the right number row outer. This was flagged in my handoff as a redundancy with the symbol layer. It should be in the deferred/acknowledged list.

#### 2. Caps Lock vs Caps Word

Agent 4 acknowledged Caps Word as a better long-term option but implemented Caps Lock instead. On a dev-focused board where Caps Lock is rarely needed, `CW_TOGG` (Caps Word) is strictly superior — it auto-deactivates after one word, preventing the classic "I accidentally left Caps Lock on" situation. If the firmware supports it (Vial typically does), Caps Word should have been the first choice, not the deferred upgrade.

#### 3. Backtick migration erased the better physical position

Old backtick position on the symbol layer (inner column) was more ergonomic than the new position (outer column). Agent 4 prioritized logical grouping ("backtick near brackets") over physical ergonomics. On a small split, physical reach matters more than logical adjacency.

#### 4. Esc now has a single point of access

In r2, Esc was on the thumb AND accessible via U+I combo. Agent 4 removed the combo. For a key as critical as Esc — especially if the user runs a modal editor — this is a risk. If the physical switch on the thumb key has issues, or if the user's hand is on the right half, there's no fallback.

#### 5. The media layer lost Delete backup

r2 had `KC_DELETE` on the media layer as a safety net. r3 does not. Forward delete is now base-layer-only. On macOS, `Cmd-Delete` is important for "move to trash." If the user remaps that right outer top key later, forward delete disappears entirely with no recovery path.

### What Agent 4 Got Right That Should Stand

- Media layer coherence: right-hand cluster with `MO(2)` on left hand is the right model
- M4 moved off the `MO(2)` activator key
- Combo cleanup (though I'd have kept the Esc combo)
- Macro 5 cleanup
- Backtick removed from base layer (despite the suboptimal new symbol position)
- The overall restraint — not over-rotating on unresolved items

### Summary Scorecard

| Claim | Verified | Issue |
|-------|----------|-------|
| Added Caps Lock | Yes | Caps Lock is low-value for devs; Caps Word would be better |
| Kept Agent 3 strengths | Mostly | KC_EQUAL redundancy still unaddressed |
| Media layer coherent | Yes | Lost Delete backup; otherwise solid |
| Backtick on symbols | Yes | Moved to worse physical position (outer vs inner column) |
| Removed combo/macro | Yes | Esc now single-point-of-access |
| Intentionally deferred items | Partially | KC_EQUAL and Caps Word not acknowledged |

### Recommendation

r3 is usable but not the strongest version. The highest-value fixes from here:

1. Replace `KC_CAPS` with `CW_TOGG` (Caps Word) or `KC_ESCAPE` (dual Esc access)
2. Move backtick on the symbol layer back to the inner column (the old position was more ergonomic)
3. Restore the Esc combo as a backup (U+I → Esc or another natural pair)
4. Replace `KC_EQUAL` on the right number row outer with something that isn't on the symbol layer, or explicitly document it as an intentional base-layer convenience
5. Consider putting `KC_DELETE` back on the media layer as a safety net

---

## Reference Repos Analysis

Two Silakka54 reference repos are cloned inside this dotfiles repo. Their layouts and design decisions provide external validation and new ideas for the current layout lineage.

### TTR Silakka54 (`ttr-silakka54/`)

Community build by TheTechRun. Gallium alphabet, Linux-first, 4 layers.

**Key characteristics:**
- Gallium alphabet (not QWERTY): `B L D C V` left / `J Y O U '` right
- 4 layers, 19 tap dances, 10 combos
- No home-row mods — uses one-shot modifiers on Layer 1 and tap-dance mod-taps
- Dedicated Backspace on left bottom-row outer (base layer)
- No dedicated Esc — only via `1+2` combo on numpad layer
- Linux-first: rofi launcher, terminal key, `LAlt+Space` on base
- Tapping term: 175ms (aggressive)
- Tap-dance for Space/Enter: `TD(0)` tap=Space, double-tap=Enter
- 19 tap dances, many firing macros on double-tap

**What this validates in our layout:** TTR avoids home-row mods entirely, preferring tap-dance complexity. The result is 19 tap dances — exactly the "too many timing-dependent features" problem Agent 1 identified. Our layout's choice of home-row mods over tap-dance-heavy mod access is validated. TTR's Backspace placement (left bottom outer) is similar to r2/r3/r4's right bottom outer — confirming that position is instinctively right. TTR's Esc-only-via-combo is objectively worse than any revision in our chain.

**What this warns against:** 19 tap dances with macro double-taps is a cautionary tale. It creates the same class of problems our original layout had (too much timing-sensitive behavior stacked at once) but through a different mechanism. Do not go further down the tap-dance path.

### Miryoku Silakka54 (`miryoku-silakka54-layout/`)

A comprehensive Miryoku implementation suite for Silakka54: 10 layout variants, web visualizer, Kanata configs, and a tested Vial config.

**Key characteristics:**
- Colemak-DH alphabet (configurable to QWERTY/DVORAK)
- 8 layers in Vial config, GACS home-row mods (`GUI/Alt/Ctrl/Shift` pinky to index)
- Layer-tap thumbs: `LT1(Esc)`, `LT2(Space)`, `LT3(Tab)` left; `LT6(Del)`, `LT5(Bspace)`, `LT4(Enter)` right
- Orthogonal layer design — each layer serves one purpose per hand, opposite-hand thumb activates
- Per-key tapping terms documented: 160ms index, 180ms ring, 240ms pinky
- Combos for Esc and shortcuts: `Q+W → Esc`, `L+U → Esc`
- macOS-adjacent shortcuts on nav layer: `Cmd+Z/X/C/V/S`
- Tapping term: 175ms base in Vial config
- Tap dance on `A` and `O` for GUI — hold behavior, not double-tap (tap=letter, hold=GUI)

**Critical insight: the Miryoku thumb pattern is structurally superior.**

Miryoku thumb cluster:
```
Left:  [LT1(Esc)] [LT2(Space)] [LT3(Tab)]
Right: [LT6(Del)] [LT5(Bspace)] [LT4(Enter)]
```

Every thumb key is a layer-tap — tap for the key, hold for a layer. This gives 6 primary keys AND 6 layer access points from 6 physical switches.

Our r4 thumb cluster:
```
Left:  [Esc]        [LGUI_T(Tab)] [Space]
Right: [MO(3)]      [RGUI_T(Enter)] [Space]
```

`MO(3)` is a pure layer-hold — tap does nothing. Two Space keys exist (left and right inner thumbs) while Backspace lives on the bottom row with no thumb key. The Miryoku approach proves that layer-tap on thumbs is strictly superior to `MO()` on thumbs for this form factor. You get 6 layer access points and 6 primary keys from the same 6 switches.

**Critical insight: GACS order puts Cmd on the easiest hold position.**

Miryoku: `LGUI_T(A), LALT_T(R), LCTL_T(S), LSFT_T(T)`. GUI/Cmd on the pinky — the finger that doesn't need to reach for hold. Our layout: `LCTL_T(S), LALT_T(D), LSFT_T(F)`. No GUI on the home row at all. For macOS, Miryoku's GACS ordering is a better fit because it puts the most-used macOS modifier on the easiest-to-hold home-row position.

**Critical insight: nav layer should have Cmd shortcuts.**

Miryoku's nav layer puts clipboard shortcuts (`Cmd+Z/X/C/V/S`) right on the home row alongside arrows. Our nav layer has arrows on the right hand but plain modifiers on the left home row — no clipboard shortcuts. For a macOS dev, baking `Cmd` shortcuts into the nav layer is a simpler win than restructuring home-row mods across the entire board.

### What the References Change for the Current Layout

These repos expose three things our handoff chain has been circling but never fully resolved:

#### 1. The thumb cluster should use layer-tap, not MO()

Converting `MO(3)` on the right thumb to `LT3(KC_BSPACE)` would give Backspace a thumb key AND keep symbol-layer access on the same thumb. Tap=Backspace, hold=symbols. This is exactly the Miryoku thumb pattern and it solves the Backspace placement issue that every agent has wrestled with.

Converting the left inner thumb from plain `KC_SPACE` to `LT1(KC_SPACE)` would give nav access from the left thumb (tap=Space, hold=nav). This frees the left home-row outer (`MO(1)`) for something more useful and balances layer access across both hands.

#### 2. The nav layer should have Cmd shortcuts baked in

`LGUI(KC_Z)`, `LGUI(KC_X)`, `LGUI(KC_C)`, `LGUI(KC_V)` on the left home row positions when nav is active. The Miryoku config proves this works on Silakka54 hardware. This would make `Cmd-C/V/X/Z` trivial while holding the nav layer — a daily-multiple-times win for a macOS dev.

#### 3. The left home-row outer (`MO(1)`) can be freed

If nav moves to a thumb hold, the `MO(1)` position on the left home row outer opens up. Strong candidates:
- `KC_ESCAPE` for dual Esc access (thumb + traditional position)
- `CW_TOGG` (Caps Word) for the rare cases you need all-caps
- `LGUI_T(KC_A)` to bring GUI/Cmd onto the home row, toward Miryoku's GACS pattern

### What NOT to Adopt from the References

- **Don't switch to Colemak-DH or Gallium.** QWERTY is the right choice for a first split — preserve muscle memory while learning the layer system.
- **Don't adopt TTR's tap-dance-heavy approach.** 19 tap dances with macro double-taps is exactly the complexity problem Agent 1 identified.
- **Don't adopt Miryoku's full orthogonal layer model.** It requires hold-both-thumbs patterns that are hard to learn on a first split. The current `MO()` approach is simpler to reason about. But the thumb key arrangement (layer-tap instead of plain hold) is worth adopting incrementally.
- **Don't adopt per-key tapping terms yet.** The Miryoku docs recommend 160/180/240ms by finger, but this requires firmware config beyond Vial GUI. Our flat 200ms is simpler and sufficient while learning.

### Actionable Recommendations

1. **Convert `MO(3)` → `LT3(KC_BSPACE)`** on right inner thumb. Solves Backspace + symbol access in one change.
2. **Convert left inner `KC_SPACE` → `LT1(KC_SPACE)`**. Moves nav to left thumb, frees `MO(1)` position.
3. **Add Cmd shortcuts to nav layer**: `LGUI(KC_Z)`, `LGUI(KC_X)`, `LGUI(KC_C)`, `LGUI(KC_V)` on left home row.
4. **Repurpose `MO(1)` position** on left home row outer: `KC_ESCAPE` (dual access) or `CW_TOGG` (Caps Word) or `LGUI_T(KC_A)` (Cmd on home row).
5. **Keep QWERTY, keep macOS-first, keep dev-focused.** The references confirm these are the right priorities.

### Bottom Line

The TTR layout validates our decision to use home-row mods over tap-dance complexity. The Miryoku layout validates that layer-tap on thumbs is the right model for this form factor and that `Cmd` shortcuts belong in the nav layer. The single highest-value change informed by these references is converting `MO(3)` to `LT3(KC_BSPACE)` — it solves the Backspace problem that every agent has wrestled with since Agent 1.

## Agent 5 Re-Challenge

This section challenges the newest prose in this document on its own terms. The target here is not the stale Vial export. The target is the logic and consistency of the latest handoff text.

### Main Findings

#### 1. The new recommendations contradict the document's earlier warning about thumb timing traps

Agent 2 correctly identified `LT3(KC_SPACE)` as a dangerous pattern because symbol access on a high-frequency thumb key creates accidental activations and inconsistent typing flow.

The newest reference-driven recommendations then argue for:
- `LT3(KC_BSPACE)` on the right thumb
- `LT1(KC_SPACE)` on the left thumb

That is the same class of tap-hold behavior on two of the most sensitive keys on the board. If the argument is that thumb-held layer-taps are acceptable when the convention set is coherent, then the earlier "most dangerous timing trap" language is overstated. If the earlier warning stands, then these new recommendations are too aggressive. The document cannot hold both positions without resolving the contradiction.

#### 2. Several conclusions are stated as absolutes when they are really preferences

The latest sections use stronger language than the evidence supports:
- `CW_TOGG` is called "strictly superior" to Caps Lock
- Miryoku's thumb pattern is called "structurally superior"
- `KC_EQUAL` on the base layer is treated as obviously wasted

Those are all arguable preferences, not settled facts. This document is strongest when it describes tradeoffs. It gets weaker when it presents one reasonable preference as if it were the only coherent answer.

#### 3. The redundancy critique cuts against the document's earlier simplification goals

The challenge to Agent 4 faults the layout for:
- lacking a backup Esc path
- lacking a backup Delete path
- keeping a base-layer `=` that also exists on the symbol layer

But earlier agents repeatedly argued for reducing hidden behaviors, removing redundancy, and making the board less clever. The newer critique quietly reintroduces a different kind of complexity: backup combos, duplicate access paths, and second copies of keys already available elsewhere. That is not automatically wrong, but it is a tradeoff that should be acknowledged explicitly instead of treated as a defect.

#### 4. The backtick argument is under-supported inside the document itself

The newest challenge claims the backtick move produced a worse physical position because the old position was "inner" and the new one is "outer." But the prose never establishes the physical mapping model it relies on. Without that shared mapping, the argument reads as asserted rather than demonstrated.

This matters because the backtick critique is one of the more confident ergonomic claims in the section. If the document wants to keep that point, it should either explain the matrix orientation it is assuming or soften the claim from "worse physical position" to "possibly worse, depending on how the matrix maps to the board."

#### 5. The reference-repo analysis overstates what the repos actually prove

The TTR repo does not really validate home-row mods. It shows that a tap-dance-heavy alternative can also become too complex.

The Miryoku repo does not prove that `LT3(KC_BSPACE)` is the single highest-value next move for this layout. At most, it shows that layer-tap-heavy thumb design can work inside a coherent Miryoku system. That is a much narrower claim.

The right takeaway is:
- TTR is a warning against timing-heavy tap-dance complexity
- Miryoku is a source of useful conventions
- neither repo settles the exact next change for this layout by itself

#### 6. The baseline shifts mid-analysis without being declared

One section evaluates `r3` directly. The later reference section suddenly compares against an `r4` thumb cluster. That is confusing in a handoff document because the object under review changes mid-stream.

If the document wants to evaluate `r4`, it should say so clearly and reframe the section around `r4` as the active baseline. If not, the comparison should stay anchored to `r3`.

### What Still Stands

- Miryoku remains a better source of conventions than TTR for this use case.
- macOS-friendly nav-layer shortcuts are still a high-quality idea.
- the board should stay simpler than either reference repo, especially while muscle memory is still forming.

### Bottom Line

The newest sections are useful, but they overreach in two ways: they state preferences as facts, and they recommend more thumb layer-taps after spending much of the document warning about exactly that kind of behavior.

The strongest next direction is still not "become Miryoku." It is "borrow from Miryoku carefully, keep the board macOS-first and QWERTY, and avoid reintroducing timing traps under a new name."

---

## Agent 5 Re-Challenge Response

### Finding 1: "The new recommendations contradict the earlier warning about thumb timing traps"

**Partially valid, but the contradiction is smaller than claimed.**

Agent 2's original warning about `LT3(KC_SPACE)` was not about layer-tap on thumbs in general. It was specifically about two things:

1. **Space is held naturally.** People rest their thumb on Space, hold it for repeated spaces, or hold it while thinking. When Space is also a layer-tap, that natural hold behavior triggers the wrong action. Backspace does not have this property — you tap Backspace, you do not rest on it or hold it for repeated use. `LT3(KC_BSPACE)` is a meaningfully safer layer-tap than `LT3(KC_SPACE)`.

2. **The original had asymmetric layer access.** Only the right thumb could reach the symbol layer (via `LT3(Space)`), while the left thumb's Space was plain. The new recommendations give both thumbs layer-tap roles on different layers, which eliminates the asymmetry.

Agent 5 is right that the document should resolve this tension explicitly. But the resolution is not to abandon layer-tap on thumbs. The resolution is to recognize that `LT3(KC_SPACE)` was dangerous specifically because Space is held, and that `LT3(KC_BSPACE)` and `LT1(KC_SPACE)` involve different tap keys with different natural hold patterns.

**Correction to the document:** The earlier "most dangerous timing trap" language should be narrowed. It is not that all thumb layer-taps are dangerous. It is that layer-tap on a key people naturally hold (Space) coupling to a layer that outputs symbols on the same hand is the dangerous combination.

### Finding 2: "Several conclusions are stated as absolutes when they are really preferences"

**Mostly valid. This is the strongest finding in the re-challenge.**

- `CW_TOGG` vs `KC_CAPS` — Caps Word auto-deactivates, Caps Lock does not. That is a functional difference, not just a preference. But "strictly superior" overstates it. Some users prefer Caps Lock for sustained uppercase entry (acronyms, constants). Corrected: "Caps Word is generally superior for dev work but Caps Lock has niche advantages."

- Miryoku thumb pattern as "structurally superior" — overstates. It is more *efficient* (6 keys + 6 layer access points from 6 switches) but efficiency is not the only axis. MO() on a thumb is simpler to reason about because there is no timing window. A user learning their first split may find `MO()` + dedicated keys easier to learn than 6 dual-role thumbs. Corrected: "Miryoku's thumb pattern is more *efficient* per switch, but efficiency is not the only consideration for a first split."

- `KC_EQUAL` as wasted — depends on workflow. Some devs type `=` constantly outside of symbol contexts (Python, shell assignment). Corrected: "`KC_EQUAL` duplicates the symbol layer; whether that is wasteful or convenient depends on your coding patterns."

### Finding 3: "The redundancy critique cuts against the simplification goals"

**Valid, and this is a real tension that should be called out.**

The document oscillates between "reduce hidden behaviors" and "add backup access paths." Agent 5 correctly identifies this. The resolution: redundancy for critical keys (`Esc`, `Delete`) is different from redundancy for convenience keys (`=`). Critical keys need reliable access because a single point of failure during editing flow is a productivity killer. Convenience keys should stay simple. The document should articulate this distinction explicitly instead of treating all redundancy the same way.

### Finding 4: "The backtick argument is under-supported"

**Valid. The physical mapping was assumed but not stated.**

On the Silakka54, the inner column (Col 5 on right half) is under the ring finger at rest. The outer column (Col 0 on right half) is under the pinky. When holding `MO(3)` with the right thumb, the right hand stays in place while the left hand reaches for symbols. The inner column requires no reach from home position. The outer column requires the pinky to move outward on a split where the outer column is the farthest point.

Agent 5 is right that this was asserted rather than demonstrated. The claim should be softened or the physical mapping model should be stated.

### Finding 5: "The reference-repo analysis overstates what the repos actually prove"

**Partially valid.**

- TTR does not prove that home-row mods are better than no home-row mods. It proves that one tap-dance-heavy alternative became complex. That is a narrower claim. Corrected in the analysis: "TTR validates that our avoidance of tap-dance overload was the right call, but it does not prove home-row mods are optimal."

- The Miryoku reference proves that `LT` on thumbs *can work* inside a coherent system. It does not prove `LT3(KC_BSPACE)` is the single best next move for this specific layout. That recommendation should be framed as "highest-priority candidate to evaluate" rather than "single highest-value change."

### Finding 6: "The baseline shifts mid-analysis without being declared"

**Valid. The document evaluates r3, then shifts to comparing against r4 thumbs without re-anchoring.**

The reference repos analysis section (line ~863) compares against r4 thumbs. The Agent 4 challenge section (line ~706) evaluates r3. These are two different baselines. The document should declare which revision is the active baseline at each section boundary.

### Corrections Summary

| Finding | Verdict | Action |
|---------|---------|--------|
| 1. Thumb timing trap contradiction | Partially valid | Narrow the original warning: the danger is layer-tap on Space specifically, not all layer-taps |
| 2. Absolutes vs preferences | Valid | Soften language on CW_TOGG, Miryoku thumbs, KC_EQUAL |
| 3. Redundancy vs simplification | Valid | Distinguish critical-key redundancy from convenience-key redundancy |
| 4. Backtick under-supported | Valid | State the physical mapping model or soften the claim |
| 5. Repos overstate their proof | Partially valid | Frame Miryoku conventions as candidates, not proof |
| 6. Baseline shifts undeclared | Valid | Declare active baseline per section |

### Revised Recommendation

Agent 5's strongest point is that this document should be more honest about tradeoffs and less declarative about preferences. The right next step is still:

1. **Evaluate** `LT3(KC_BSPACE)` on the right thumb as a candidate, not a settled decision. It is worth trying because Backspace is tapped not held, but it needs real-world validation.
2. **Evaluate** `LT1(KC_SPACE)` on the left thumb for nav access. Safer than `LT3` because nav is opposite-hand and less disruptive than symbols on accidental hold.
3. **Add Cmd shortcuts** to the nav layer regardless of thumb changes.
4. **Keep** the board simpler than either reference repo while muscle memory forms.
5. **Test before committing** to a revision. Load the candidate layout and type on it for at least a full work session before writing it into the `.vil` file as the default.

## Agent 6 Re-Challenge

This section challenges the newest response directly. The goal is not to relitigate every earlier point. The goal is to test whether the response actually resolves the contradictions it claims to resolve.

### Main Findings

#### 1. The thumb layer-tap contradiction is narrowed, but not actually resolved

The response usefully clarifies that `LT3(KC_SPACE)` was dangerous for reasons more specific than "all thumb layer-taps are bad." That correction is good.

But the revised argument still leaves a real contradiction in place:
- `LT1(KC_SPACE)` still puts layer-hold behavior on Space, which the document earlier identified as dangerous because Space is naturally held, rested on, or pressed without precision
- `LT3(KC_BSPACE)` is treated as safer because Backspace is "tapped not held," but for editing work that is not reliably true; users often hold Backspace to delete bursts of text

So the response successfully weakens the original overstatement, but it does not fully justify why the two replacement thumb layer-taps are now acceptable. It mostly argues that their failure modes are less bad. That is not the same as resolving the earlier objection.

#### 2. The asymmetry explanation quietly changes the standard

The response says the original asymmetry goes away because both thumbs now get layer-tap roles on different layers.

That is not really the same type of symmetry the earlier document was worried about. The earlier complaint was specifically that the two Space thumbs behaved differently. Replacing that with different dual-role thumb keys may still be a coherent design, but it does not "eliminate asymmetry." It replaces one asymmetry with another and argues the new one is more intentional.

That is a reasonable position. It should be described that way.

#### 3. The backtick defense still relies on an asserted physical model

The response improves on the earlier critique by at least stating a physical mapping model. But it still presents that model as fact without grounding it in a diagram, board reference, or explained coordinate system.

So the criticism from Agent 5 still stands in weaker form: the argument is no longer unsupported silence, but it is still an unsupported assertion. If the document wants to keep the backtick ergonomics claim, it should either:
- cite the board geometry explicitly, or
- phrase it as an informed ergonomic hypothesis rather than a settled physical fact

#### 4. The new "critical-key redundancy" rule is sensible but under-argued

The response introduces a distinction between:
- critical keys that deserve backup access
- convenience keys that should stay simple

That is a useful framework. But it is still asserted more than argued. `Esc` clearly fits that category for many dev workflows. `Delete` is less obvious. On a 54-key board, every redundant access path carries a real complexity cost. The document still needs a clearer test for when a key is important enough to deserve duplication.

Without that test, the framework risks becoming a post-hoc justification for whichever duplicates the current reviewer happens to like.

#### 5. The revised recommendation is still too eager to privilege thumb changes

After softening absolutes and acknowledging uncertainty, the response still lands on the same top two experiments:
- `LT3(KC_BSPACE)`
- `LT1(KC_SPACE)`

That conclusion is not obviously earned by the preceding analysis. The safer takeaway could just as reasonably be:
- add macOS-friendly nav shortcuts first
- clarify the active baseline (`r3` vs `r4`)
- simplify the document's principles before introducing more dual-role thumb behavior

The response sounds more cautious than the earlier section, but its practical recommendation is still pulling in the same direction.

### What Still Stands

- narrowing the original `LT3(KC_SPACE)` critique was the right correction
- softening "strictly superior" and "structurally superior" was the right move
- reframing Miryoku as a source of candidates rather than proof is an improvement
- calling out the undeclared `r3`/`r4` baseline shift remains valid

### Bottom Line

The response is better than the text it answers. It is more careful about tradeoffs and less absolute in tone.

But it still tries to preserve the same thesis that Agent 5 challenged: that the next best move is to push more layer-tap behavior onto the thumbs. The response makes that thesis more defensible. It does not make it settled.

The most honest next step from this document is not "thumb layer-taps are the answer." It is "thumb layer-taps remain a serious candidate, but they are still the riskiest recommendation in the current handoff chain and should not outrank lower-risk macOS/navigation improvements by default."

---

## Agent 6 Re-Challenge Response

### Finding 1: "The thumb layer-tap contradiction is narrowed, but not actually resolved"

**Partially valid, but Agent 6 overstates the equivalence.**

Agent 6 argues that holding Backspace to delete bursts of text is common, making `LT3(KC_BSPACE)` risky for the same reason `LT3(KC_SPACE)` was. This conflates two different hold patterns:

- **Space is naturally rested on.** Users unconsciously rest their thumb on Space while thinking, or hold it for repeated spaces. This is an unconscious, physical-rest behavior that fires without intent.
- **Backspace is held for key-repeat.** Users hold Backspace when they want repeated deletion. This is an intentional, goal-directed behavior.

These are different risk profiles. With `LT3(KC_BSPACE)`, hold-past-tapping-term gives you the symbol layer — which is a reasonable thing to get when you deliberately hold a key. The "mistake" case is someone who expects key-repeat deletion and gets symbols instead. That is a learnable behavior, similar to the home-row mod learning curve. It is not the same as accidentally triggering symbols because you rested your thumb.

That said, Agent 6 is right that the previous response did not make this distinction clearly enough. The document should state: `LT3(KC_BSPACE)` is safer than `LT3(KC_SPACE)` because the failure mode (hold-expecting-repeat-gets-layer) is intentional-hold confusion, not unconscious-rest contamination. But it is not risk-free. It carries a learning curve comparable to home-row mods.

### Finding 2: "The asymmetry explanation quietly changes the standard"

**Not valid. Agent 6 conflates complementary specialization with asymmetry.**

The original complaint about `LT3(KC_SPACE)` was: two Space keys with different behavior. Left Space = plain Space. Right Space = Space + symbol layer. Same tap action, different hold behavior, on what should be the same key. That is a confusing asymmetry.

The proposed design has: left thumb = `LT1(KC_SPACE)` (tap Space, hold nav), right thumb = `LT3(KC_BSPACE)` (tap Backspace, hold symbols). Different tap actions, different hold actions, each thumb specialized for a different role. This is not asymmetry in the problematic sense — it is complementary specialization. It is the same class of design as "left hand has Shift, right hand has Ctrl."

Agent 6 says this "replaces one asymmetry with another." That is only true if you define any inter-hand difference as asymmetry. By that standard, every split keyboard layout is asymmetric. The relevant question is whether the asymmetry is confusing (same key, different behavior) or intentional (different keys, complementary roles). The original was confusing. The proposed is intentional.

### Finding 3: "The backtick defense still relies on an asserted physical model"

**Still valid. This should be phrased as a hypothesis, not a fact.**

The Silakka54 is a 4×6+3 split. On the right half, the inner column (the one closest to the split) is under the index finger at rest. The outer column (farthest from the split) is under the pinky. When the right thumb holds `MO(3)`, the right hand stays in place for symbol access. Reaching the inner column requires no finger extension from home. Reaching the outer column requires the pinky to stretch outward.

That is the physical model. But it should be stated as an informed ergonomic hypothesis, not as settled fact. Hand size, tenting angle, and switch type all affect actual reach difficulty. The document should present this as "the inner column is generally easier to reach on split keyboards, but individual mileage may vary."

### Finding 4: "The critical-key redundancy rule is under-argued"

**Valid. The framework needs a real test, not just an assertion.**

Proposed test for whether a key deserves backup access: **"Would losing this key for 30 seconds interrupt a common dev workflow?"**

Applying the test:

- `Esc`: Yes. Modal editor users press Esc dozens of times per minute. Losing it breaks editing flow immediately.
- `Backspace`: Yes if not on a dedicated key. No if on a dedicated key (thumb or bottom row).
- `Delete` (forward): Borderline. `Cmd-Delete` (move to trash) is important on macOS but not time-critical. Forward delete in text editors is useful but not frequent enough that 30 seconds without it would interrupt flow.
- `=`: No. Available on the symbol layer. Losing it for 30 seconds is mildly annoying but not workflow-interrupting.

This test suggests: `Esc` deserves a combo backup. `Delete` is borderline — a media-layer backup is nice-to-have but not justified by the 30-second test. The document should use this explicit test rather than asserting importance.

### Finding 5: "The revised recommendation is still too eager to privilege thumb changes"

**Valid and important. The priority order should reflect risk, not just reward.**

Risk assessment of the recommended changes:

| Change | Risk | Reward | Risk-adjusted priority |
|--------|------|--------|----------------------|
| Nav-layer Cmd shortcuts | Near-zero (just adding keys to existing layer) | High (daily macOS shortcuts) | **1st** |
| Clarify active baseline (r3 vs r4) | Zero | Documentation clarity | 2nd |
| `LT3(KC_BSPACE)` on right thumb | Medium (timing-sensitive dual-role, learning curve) | High (solves Agent 1's Backspace problem) | 3rd |
| `LT1(KC_SPACE)` on left thumb | Medium (adds dual-role to high-frequency key) | Medium (nav access from thumb, frees home-row position) | 4th |
| Repurpose `MO(1)` position | Low (depends on thumb changes) | Medium (dual Esc or Caps Word) | 5th |

Agent 6 is correct: nav-layer Cmd shortcuts should go first because they are near-zero risk with high reward. Thumb experiments are worth trying but carry real risk and should come after the easy wins.

### Revised Recommendation (Risk-Adjusted)

1. **Add Cmd shortcuts to nav layer.** `LGUI(KC_Z)`, `LGUI(KC_X)`, `LGUI(KC_C)`, `LGUI(KC_V)` on left home row when nav is active. Near-zero risk, immediate macOS productivity improvement.
2. **Declare the active baseline.** State explicitly whether `r3` or `r4` is the working baseline for future changes.
3. **Test `LT3(KC_BSPACE)` on the right thumb** as a candidate, not a commitment. Load it, use it for a full work session, note whether hold-expecting-repeat is a real problem or a theoretical one.
4. **If `LT3` works, then evaluate `LT1(KC_SPACE)`** on the left thumb for nav access. Do not test both thumb changes at once — that makes it impossible to tell which change caused any problem.
5. **If thumb changes stabilize, repurpose `MO(1)`** on the left home row outer for `KC_ESCAPE` (dual access) or `CW_TOGG` (Caps Word).
6. **Phrase ergonomic claims about physical reach as hypotheses**, not facts. Cite the 4×6+3 split geometry and acknowledge that hand size and board angle affect reach difficulty.
7. **Use the 30-second workflow-interruption test** for deciding which keys deserve backup access. `Esc` passes. `Delete` is borderline. `=` does not.

## Agent 7 Re-Challenge

This section challenges the newest response directly. The response is an improvement, but it still leaves three important gaps.

### Main Findings

#### 1. The `LT3(KC_BSPACE)` defense still understates the cost of stealing key-repeat from Backspace

The response is right to distinguish:
- unconscious resting on Space
- intentional holding of Backspace for repeat deletion

That is a real difference, and it does make `LT3(KC_BSPACE)` safer than `LT3(KC_SPACE)`.

But the response then over-corrects by saying the symbol layer is a "reasonable thing to get" when deliberately holding Backspace. That does not follow from the user's intent. When someone holds Backspace, they usually want more deletion, not layer access. So the proposed layer-tap is still intercepting an established editing behavior on a high-frequency correction key.

That makes the failure mode more serious than the response suggests. It is not just generic "intentional-hold confusion." It is a direct substitution of one editing action for another during active correction. That can be learnable, but it is a higher-friction relearn than the response admits.

The strongest defensible claim is:
- `LT3(KC_BSPACE)` is safer than `LT3(KC_SPACE)`
- but it still carries a meaningful risk because Backspace repeat is a real, common behavior during editing

#### 2. The new 30-second test is a useful heuristic, but too narrow to be the rule

The response improves the redundancy discussion by finally proposing an explicit test:
- "Would losing this key for 30 seconds interrupt a common dev workflow?"

That is better than pure assertion. But it is still too narrow to be the governing rule, because it measures interruption better than it measures cumulative ergonomic cost.

Keys can fail the 30-second test and still deserve premium access because they are:
- used constantly
- costly to reach
- part of repeated coding patterns

`=` is the clearest example. Losing it for 30 seconds may not halt work, but typing it awkwardly hundreds of times per day can still matter more than a rarely used "critical" key. The same principle applies to brackets, slash, and other coding symbols.

So the 30-second test is a good filter for backup paths, but it is not a good general rule for key importance.

#### 3. The risk-adjusted priority order still puts documentation second when it should probably come first

The new order is much better than the previous one, especially in putting macOS nav shortcuts ahead of thumb experiments.

But "declare the active baseline" is ranked second after nav-layer `Cmd` shortcuts. That is backwards for a handoff document. If the baseline is unclear (`r3` vs `r4`), every later recommendation is harder to interpret and test. Documentation clarity is not just housekeeping here; it determines what the experiment even means.

The cleaner order is:
1. declare the active baseline
2. add low-risk macOS nav shortcuts
3. test `LT3(KC_BSPACE)` in isolation
4. only then consider `LT1(KC_SPACE)`

That order preserves the response's risk-adjusted logic while fixing the sequencing problem.

### What Still Stands

- distinguishing Backspace-hold from Space-rest was a real improvement
- replacing absolutes with tradeoff language remains the right direction
- the new response is much stronger on prioritization than the earlier Miryoku-import section
- putting thumb experiments behind lower-risk macOS improvements is the right broad move

### Bottom Line

The newest response is the best version of the argument so far, but it still soft-pedals the cost of putting a layer-tap on Backspace, and it treats the 30-second interruption test as broader than it really is.

The best next principle for this document is:

- use the 30-second test only for deciding backup access
- use frequency and ergonomic cost for deciding prime placement
- declare the active baseline before recommending more experiments

That keeps the handoff honest about both productivity and strain, instead of collapsing everything into a single notion of "workflow interruption."

---

## Agent 7 Re-Challenge Response

### Finding 1: "The `LT3(KC_BSPACE)` defense understates the cost of stealing key-repeat"

**Valid. The previous response was too glib about the hold-getting-layer outcome.**

Agent 7 is right: when someone holds Backspace, their intent is more deletion. Getting a symbol layer instead is not "a reasonable thing to get" — it is an interception of an active editing intent. The previous response framed it as "intentional-hold confusion," which understates what is actually happening: you are replacing one editing action (delete-more) with a completely different mode (symbol access) during a moment when the user is actively correcting text. That is worse than generic confusion. It is a direct editing-flow interrupt at the moment of correction.

The correct framing: `LT3(KC_BSPACE)` is safer than `LT3(KC_SPACE)` because Backspace is not a rest key. But it still carries a meaningful risk because hold-for-repeat-deletion is a real, common editing behavior, and intercepting it with symbol access creates a higher-friction relearn than the previous response acknowledged. This is not a disqualifying objection — home-row mods also intercept common behaviors (typing letters vs holding modifiers) and users adapt. But the cost should be stated honestly: `LT3(KC_BSPACE)` asks the user to unlearn hold-for-repeat-delete and replace it with tap-tap-tap deletion. That is a real, measurable relearn cost during active editing.

**Correction to the document:** The claim that "hold-past-tapping-term gives you the symbol layer — which is a reasonable thing to get" should be removed. Replaced with: "hold-past-tapping-term gives you the symbol layer, which intercepts a common editing intent (repeat deletion). This is a real relearn cost comparable to home-row mod adaptation."

### Finding 2: "The 30-second test is too narrow to be the rule"

**Valid. The framework needs two tests, not one.**

Agent 7 correctly identifies that the 30-second test measures acute interruption, not cumulative ergonomic cost. Losing `=` for 30 seconds does not stop work. But reaching for `=` badly hundreds of times per day creates real cumulative strain. The test cannot distinguish between "this key is unimportant" and "this key is important but not time-critical."

The correct framework has two distinct tests:

**Test 1: 30-second workflow interruption.** Used for deciding backup access. If losing a key for 30 seconds would interrupt a common workflow, it deserves a backup path. `Esc` passes. `Delete` is borderline. `=` does not.

**Test 2: Frequency × ergonomic cost.** Used for deciding prime placement. If a key is used frequently and is costly to reach in its current position, it deserves a better home — even if it does not pass the 30-second test. `=` on the base layer outer column may fail the 30-second test but could still deserve a better position if typing it requires an awkward reach hundreds of times daily. Brackets, slash, and backtick fall in this category too.

This resolves Agent 7's concern about `=`: it does not need a backup path, but it may still deserve better placement based on frequency and reach cost.

**Correction to the document:** The 30-second test should only be cited for backup-access decisions. A separate frequency × ergonomic-cost test should govern prime placement. These are different questions that should not be collapsed into a single rule.

### Finding 3: "Baseline declaration should come first"

**Valid and straightforward.**

If the baseline is unclear, every recommendation is ambiguous. "Add Cmd shortcuts to nav layer" means different things depending on whether the starting point is `r3` or `r4`. The baseline declaration is a prerequisite, not a second priority.

**Active baseline declaration: `r4`** (`vial/main-r4.vil`). This is the most recent revision with the corrections from the Agent 3 challenge applied. `r3` (`vial/main.vil` as committed by Agent 4) introduced Caps Lock and moved backtick to a worse position. `r4` fixes both of those. All future recommendations should be evaluated against `r4` unless explicitly stated otherwise.

### Final Consolidated Recommendation

Evaluated against the `r4` baseline, risk-adjusted, with the two-test framework:

1. **Declare `r4` as the active baseline.** Done here.
2. **Add Cmd shortcuts to nav layer.** `LGUI(KC_Z)`, `LGUI(KC_X)`, `LGUI(KC_C)`, `LGUI(KC_V)` on left home row when nav is active. Near-zero risk, immediate macOS productivity gain.
3. **Test `LT3(KC_BSPACE)` on the right thumb** — but acknowledge honestly that this intercepts hold-for-repeat-deletion and requires the user to unlearn that behavior in favor of tap-tap-tap deletion. This is a real relearn cost, not a theoretical one. Test in isolation for at least a full work session before deciding.
4. **Only if `LT3` works:** evaluate `LT1(KC_SPACE)` on the left thumb. Do not test both thumb changes simultaneously.
5. **Only if thumb changes stabilize:** repurpose `MO(1)` on the left home row outer. Strong candidates: `KC_ESCAPE` (passes 30-second test for backup access), `CW_TOGG` (Caps Word — fails 30-second test but may pass frequency-cost test for users who type constants/acronyms).
6. **Use the 30-second test** only for backup-access decisions. **Use frequency × ergonomic cost** for prime-placement decisions. These are different questions.
7. **Phrase all ergonomic claims as hypotheses** tied to the 4×6+3 split geometry, not as universal facts.

## Agent 8 Re-Challenge

This section challenges the newest response directly. The latest response is stronger than the previous ones, but it still turns a few debatable assumptions into settled decisions.

### Main Findings

#### 1. Declaring `r4` as the active baseline is still an unsupported leap

The response improves the sequencing problem by insisting that the active baseline should be declared first. That is correct.

But it then immediately declares `r4` as the active baseline and treats that declaration as resolved. That move is too fast. A handoff document can say "the baseline must be explicit" without also claiming authority to choose it unilaterally.

The missing step is the selection rule. Why should `r4` be the baseline?
- because it is the latest revision?
- because it best matches the current prose?
- because it minimizes unresolved criticisms?
- because it is the best candidate for the next experiment?

Those are different standards, and the response does not choose one explicitly. Without that standard, "use `r4`" is still just a preference with stronger wording.

The better move is:
- declare that a single active baseline is required
- state the criterion for choosing it
- then name the baseline that best fits that criterion

#### 2. The new Backspace framing over-corrects in the opposite direction

Agent 7 correctly pushed back on the earlier claim that getting a layer while holding Backspace is a "reasonable thing to get."

But the response then swings too far the other way by framing `LT3(KC_BSPACE)` as a forced relearn from hold-for-repeat-delete to "tap-tap-tap deletion." That is too narrow.

Users do not only delete in one way. In real editing they also:
- use word deletion shortcuts
- use line/selection deletion commands
- rely on editor-specific structural edits
- sometimes use repeat delete, sometimes not

So the real objection to `LT3(KC_BSPACE)` is not "you must abandon repeat delete and replace it with tap-tap-tap." The real objection is simpler and stronger:

- it steals a familiar repeat behavior from a high-frequency correction key
- the replacement behavior may or may not be worth the symbol-layer gain

That framing is more accurate and less melodramatic.

#### 3. The two-test framework is better, but still incomplete

The response improves the document by separating:
- backup-access decisions
- prime-placement decisions

That is a real advance. But it still leaves out a third factor: system coherence.

A layout is not just a set of individually optimized key placements. It is also:
- how consistently similar keys behave
- how many timing-sensitive behaviors the user must remember
- whether the thumb cluster follows one mental model or several

This matters because a key can score well on both new tests and still be bad for the overall system. A symbol may be frequent and awkwardly placed, but promoting it can still make the board worse if it breaks layer logic or adds more hidden behavior. The same goes for `LT3(KC_BSPACE)`: even if the symbol gain is high, the thumb model may become less coherent.

So the document now has two useful tests, but it still needs a third:

**Test 3: Does this change improve or degrade the overall mental model of the board?**

Without that, the analysis still risks optimizing parts while making the whole layout harder to learn.

#### 4. The new recommendation is more careful, but still assumes thumb experiments are the main event

The latest response does improve the order:
- baseline first
- nav shortcuts early
- thumb experiments later

That is better.

But the recommendation still treats the right-thumb `LT3(KC_BSPACE)` experiment as the central next design question. That may be true, but the document has not fully earned that status yet. There is still a strong alternative reading:

- the highest-value next move is not another thumb experiment
- it is stabilizing the board's principles and reducing ambiguity in the handoff itself

In other words, the doc may still be over-fixating on one technically interesting thumb change instead of recognizing that the more urgent problem is architectural drift between agents.

### What Still Stands

- insisting on an explicit baseline is still correct
- separating backup-access from prime-placement decisions is a genuine improvement
- moving nav-layer `Cmd` shortcuts ahead of thumb experiments remains the right broad direction
- the document is getting better as it shifts from absolutes toward tradeoffs

### Bottom Line

The newest response is the cleanest synthesis so far, but it still hardens two things too early:
- that `r4` should be the baseline
- that `LT3(KC_BSPACE)` is the main experiment around which the next phase should revolve

The next honest refinement for this document is:

- choose the baseline by an explicit rule, not by declaration
- judge thumb experiments with three lenses, not two:
  - workflow interruption
  - frequency × ergonomic cost
  - overall mental-model coherence

That would make the handoff less like an argument about one controversial key and more like a stable framework for deciding the whole layout.

## Agent 9 Re-Challenge And Consensus Check

This section challenges the new upstream `Agent 8` review and checks whether the two lines of analysis are converging.

### Main Findings

#### 1. The `=` displacement critique is real, but it overstates the contradiction

The upstream review is right that `r4` made `=` harder to reach by replacing the base-layer `KC_EQUAL` with `KC_GRAVE`. If `r4` is going to remain in the conversation as the implementation baseline, that tradeoff should be stated explicitly.

But this does not amount to a deep contradiction in the review logic. The earlier argument was not "every frequent coding symbol must live on the base layer." The earlier argument was that frequency and reach cost should influence placement decisions. That leaves room for tradeoffs between base `=` and base backtick. The real problem is not contradiction. The real problem is that the tradeoff was never made explicit.

So this point should be treated as:
- a valid implementation concern
- not decisive by itself
- something that needs a stated tradeoff if `r4` remains the candidate baseline

#### 2. The dual-Esc finding is useful, but it should be treated as a decision point, not a bug

The upstream review is also right that `r4` has two base-layer Esc positions and that the document never fully evaluates whether both should stay.

That is an important omission. But duplicate Esc is not automatically a misuse of space. Under the newer backup-access logic, Esc is the strongest candidate for redundancy on a dev board. So the real question is:

- is the Q-row Esc a deliberate backup path that passes the backup-access test?
- or is it legacy inertia that should be reclaimed once the thumb Esc is trusted?

That is a real design fork. The upstream section identifies it correctly. What it does not quite prove is that the duplicate Esc is already wrong. It proves the document needs to decide.

#### 3. The nav-layer Cmd-shortcut critique is the strongest upstream finding

This is the clearest and most actionable point in the new upstream section.

The earlier recommendation to "add Cmd shortcuts to nav layer" was too vague. The upstream review correctly points out that:
- the current nav layer already uses those positions for standalone modifiers and function keys
- blindly overlaying `LGUI(KC_Z/X/C/V)` there can break arrow-selection and modifier chording

This is not just a wording issue. It is the main implementation blocker for the low-risk macOS improvement path. Until exact positions are named, "add Cmd shortcuts" is still only a slogan.

#### 4. The "action-light" critique is partly fair, but still a little premature

The upstream section is justified in saying the document has become recommendation-heavy. That criticism lands.

But it overreaches when it says `r5` should exist as if the document has already fully converged. It has not. There are still unresolved implementation choices:
- whether `r4` is actually the baseline
- whether base `=` should return
- whether dual Esc is deliberate
- where nav-layer Cmd shortcuts should live without breaking modifier workflows

Those are not cosmetic details. They are exactly the choices that determine whether an `r5` is coherent or just another temporary fork. So the better conclusion is not "stop writing and ship r5 immediately." It is "the review is close enough that the next step should be concrete, but only after those remaining decisions are made explicit."

### Consensus Check

Yes, there is a real consensus forming between this review line and the upstream agent. It is not full consensus on the final layout, but it is strong consensus on the framework.

#### Areas of Convergence

- Miryoku is the right design reference, but not the thing to copy wholesale.
- macOS-specific nav shortcuts are one of the highest-value next changes.
- thumb layer-tap experiments are still candidates, not settled defaults.
- ergonomic claims should be stated as hypotheses and tradeoffs, not absolutes.
- the implementation baseline must be explicit.
- implementation recommendations must name exact positions, not just general ideas.

#### Remaining Disagreements

- whether `r4` should be declared the active implementation baseline now, or only after an explicit selection rule is stated
- whether the base-layer `=` tradeoff in `r4` is acceptable
- whether dual Esc is a deliberate backup strategy or wasted duplication
- whether the document is ready for `r5` immediately or still needs one more round of concrete decision-making first

### Bottom Line

The new upstream section is strongest where it forces the discussion out of abstraction and into actual keys and positions. Its best point is the nav-layer Cmd-shortcut challenge.

The two review tracks are converging on a shared position:
- use Miryoku as a conceptual baseline
- keep the board macOS-first and QWERTY
- do low-risk nav improvements before risky thumb experiments
- be explicit about concrete placements and tradeoffs

The remaining dispute is no longer about philosophy. It is about the exact implementation choices that would justify an `r5`.

## Agent 11 Re-Evaluation

This section re-evaluates the new upstream `Agent 10` section after checking the actual `main-r4.vil` data and the real Miryoku Vial config.

### Main Findings

#### 1. The Miryoku nav-shortcut correction is real, and it is the most important new factual update

This is the strongest part of the upstream `Agent 10` section.

The real Miryoku Vial config does **not** put `LGUI(KC_Z/X/C/V/S)` on the nav-layer home row. It keeps standalone modifiers on the home row and puts the Cmd shortcuts on the row below. That means the earlier suggestion to place Cmd shortcuts directly onto the current nav home row was too loose and risked breaking modifier+arrow chording for selection.

That is now verified and should be treated as a factual correction, not just a preference.

What this resolves:
- Cmd shortcuts belong on the nav layer
- they do **not** need to replace the nav-layer home-row modifiers
- the Miryoku reference actually supports a lower-risk placement model than the earlier prose suggested

This is the clearest convergence point in the whole review.

#### 2. The "procedural filibuster" language about baseline selection is too dismissive, but the practical conclusion is probably right

The upstream section overstates its case when it calls the baseline-selection objection "procedural filibuster." Asking for an explicit selection rule was a fair criticism.

But the practical conclusion is still mostly right: at this point, `r4` is the only serious **implementation candidate** on the table. No one is seriously arguing to go back to `r3`, and the new upstream section is correct that the document has been behaving as if `r4` were the working implementation baseline for several rounds already.

So the cleanest formulation is:
- Miryoku is the **conceptual baseline**
- `r4` is the **current implementation baseline candidate**

That preserves the useful distinction without pretending the implementation baseline is still totally open.

#### 3. Restoring `=` to the base layer is now more justified, but still not fully "settled"

The upstream section strengthens the case for restoring `KC_EQUAL` to the base layer:
- `r4` displaced it
- the review's own frequency×ergonomic-cost logic points toward giving `=` better access
- Miryoku itself keeps `KC_EQUAL` on the base layer

That makes the "restore `=` to base" argument much stronger than before.

But it is still not fully settled doctrine. It is now the leading recommendation, not an unquestionable conclusion. The tradeoff remains:
- base `=` is probably higher value for dev work than base backtick
- but the document should still acknowledge that this is a tradeoff, not a mathematical proof

So the status has changed from "one valid opinion among many" to "the most defensible current recommendation."

#### 4. The Q-row `Esc` repurposing argument is still reaching

The upstream section is right that the duplicate Esc on `r4` must be addressed eventually.

But it reaches again when it tries to elevate `KC_TAB` on the Q-row outer as the strongest next candidate. The reasoning starts by treating `LGUI_T(KC_TAB)` as a serious timing hazard, then partially walks it back by admitting thumb mod-taps are a standard Miryoku pattern and workflow-dependent.

That walk-back matters. Once admitted, the case for urgently replacing Q-row Esc with Tab is no longer established.

The right status for that idea is:
- plausible candidate
- not consensus
- not strong enough yet to outrank the more concrete nav-layer and `=` decisions

So the duplicate-Esc issue should remain a decision point, but the document still has not earned a confident answer for what replaces it.

#### 5. The upstream section is right that the review is now close to action, but not fully converged

The upstream `Agent 10` section is directionally right that the review is now close enough to implementation that another purely abstract round would have diminishing returns.

But it still overstates convergence in two places:
- it treats `r5` as almost fully specified
- it treats the `=` restoration as if it is effectively decided

The real state is narrower:
- nav-layer Cmd shortcuts now have a verified reference placement model
- `r4` is the practical implementation baseline candidate
- `=` restoration is the strongest open implementation recommendation
- the Q-row Esc replacement is still unresolved
- thumb experiments still remain explicitly deferred behind lower-risk changes

That is strong convergence, but not total convergence.

### Consensus Check

Yes, there is now a stronger consensus than before between this review line and the upstream agent.

#### Areas of Strong Consensus

- Miryoku is the conceptual baseline.
- `r4` is the practical implementation baseline candidate.
- nav-layer Cmd shortcuts should happen before thumb layer-tap experiments.
- the actual Miryoku pattern for Cmd shortcuts is **not** on the nav home row.
- implementation recommendations now need exact positions and should preserve modifier+arrow chording.
- thumb experiments remain candidates, not defaults.

#### Remaining Open Decisions

- whether `=` should be restored to the base layer in the next revision
- whether duplicate Esc should remain temporarily or be reduced immediately
- what, if anything, should replace the Q-row Esc once the duplicate-Esc question is resolved
- whether the next revision should be only a narrow nav/`=` cleanup or include any additional base-layer changes

### Bottom Line

The new upstream section materially improves the review because it contributes one key verified correction: Miryoku's Cmd shortcuts belong on the lower row of the nav layer, not the home row.

That means the two review tracks are now closer to consensus than before:
- Miryoku as conceptual baseline
- `r4` as implementation candidate
- nav shortcuts first
- thumb experiments later
- exact placement matters

The biggest remaining implementation question is no longer "where should Cmd shortcuts go?" That is mostly answered now. The biggest remaining question is whether the next narrow revision should also restore `=` to the base layer or leave that for the revision after.

---

## Agent 10 Re-Challenge + Consensus Evaluation

This section challenges the upstream Agent 8 and Agent 9 sections against the actual `.vil` data and the Miryoku reference config, then evaluates the full state of consensus across all 10 agent handoffs.

### Challenge to Upstream Agent 8

#### Finding 1: The "baseline selection rule" objection is procedural filibuster

Agent 8 argues that declaring `r4` as the baseline is "an unsupported leap" because no explicit selection rule was stated — "because it is the latest revision" vs "because it minimizes unresolved criticisms" vs other criteria.

This is overthinking. `r4` is the only candidate. There are exactly two options on the table: `r3` and `r4`. `r3` introduced Caps Lock on the Q-row outer (replacing Esc) and moved backtick off the base layer to a worse position. `r4` fixed both of those. No agent has argued for `r3` as the baseline. The selection rule is trivial: `r4` is the latest revision AND the one with fewer acknowledged problems AND the one no agent has argued against. All three criteria point the same way.

Demanding an explicit selection rule before naming a baseline is the kind of framework-completeness argument that delays action without changing the outcome. The document is 1500+ lines in and still has not produced `r5`. The baseline question has been settled in practice since the Agent 7 response. Formalize it and move on.

#### Finding 2: The "third test — system coherence" is valid but should not delay

Agent 8's proposal of a third test (mental-model coherence) is good analytical hygiene. The observation that individually optimal placements can degrade the overall system is correct — `LT3(KC_BSPACE)` could make thumbs follow an inconsistent model.

But this test should not become a prerequisite for action. It is a **evaluative lens**, not a **blocking gate**. You apply it when reviewing a proposed change, not before making one. The document does not need to fully articulate a coherence framework before implementing nav-layer Cmd shortcuts. That change is nearly coherence-neutral — it adds shortcut access on an existing layer without changing any existing thumb behavior, layer access pattern, or timing-sensitive key.

**Concrete position:** Accept the third test as an evaluative lens for future changes (especially thumb experiments). Do not treat it as a prerequisite for the low-risk nav-layer change.

#### Finding 3: The "still assumes thumb experiments are the main event" objection misreads the recommendation

Agent 8 says the consolidated recommendation "still treats the right-thumb `LT3(KC_BSPACE)` experiment as the central next design question." This is a misreading. The recommendation ranks it third, after baseline declaration and nav shortcuts. It is the central *thumb* question, not the central *next* question. If the recommendation rankings are followed, nav shortcuts are implemented and tested before the thumb experiment is even loaded.

### Challenge to Upstream Agent 9

#### Finding 4: The `=` displacement "contradiction" is correctly downgraded but incompletely resolved

Agent 9 is right that my original framing overstated the contradiction. The review did not claim "every frequent symbol must live on the base layer" — it claimed frequency and reach cost should *influence* placement. Trading base `=` for base backtick is a legitimate tradeoff.

But Agent 9 then says the problem is "the tradeoff was never made explicit" — and then does not make it explicit either. So let me do that now:

**The `=` vs backtick tradeoff in r4:**
- `KC_GRAVE` (backtick) is on the base layer (right number-row outer) and on symbol layer Row 6 Col 5.
- `KC_EQUAL` is only on the symbol layer (Row 1 Col 3).
- In the original layout, `=` was on the base layer and backtick was only on the symbol layer.
- The tradeoff: backtick is more common in markdown, shell, and template literals. `=` is more common in every programming language. For a dev-focused board, displacing `=` is a higher cost than the improvement of having backtick on base.
- `LSFT(KC_EQUAL)` (plus/`+`) is also affected — it was on the base layer via the `=` position and is now only on the symbol layer.

**My position:** This tradeoff should be reversed in `r5`. Restore `KC_EQUAL` to the base layer right number-row outer. Move `KC_GRAVE` back to the symbol layer only. If backtick needs base-layer access, find it a position that does not displace a more frequent key.

#### Finding 5: The dual-Esc question must be decided now, not deferred

Agent 9 says the dual Esc is "a decision point, not a bug" — correct. But then it treats it as something that can wait. It cannot, because the decision determines what goes on the Q-row outer position, which in turn affects the entire left-side base-layer evaluation.

**Decision: the Q-row outer position (Row 1, Col 0) should NOT stay as Esc.** The thumb Esc (Row 4, Col 3) is the primary. The Q-row outer is one of the most ergonomically valuable positions on the left half — it is the first key the finger reaches when moving up from the home row. Dedicating it to a backup Esc is a waste of prime real estate that passes the frequency×cost test. Better candidates:

- `KC_TAB` — currently only available via `LGUI_T(KC_TAB)` on the thumb, which means you cannot get a clean Tab without accidentally triggering Cmd. This is actually a worse problem than Esc placement.
- `CW_TOGG` (Caps Word) — for users who type `CONSTANT_CASE` identifiers
- `KC_GRAVE` — if `=` is restored to the right number-row outer

The strongest candidate is `KC_TAB`. The current layout has Tab only as a tap output of `LGUI_T(KC_TAB)`. That means every Tab press is a potential Cmd-trigger timing hazard — the exact class of problem the review has been identifying since Agent 1. Moving Tab to a dedicated position on the Q-row outer eliminates that timing risk entirely. This is arguably a higher-priority change than the nav-layer Cmd shortcuts, because it affects every single Tab press on the base layer.

Wait — let me verify this claim against the data.

**Verification:** r4 Layer 0, Row 4, Col 4 is `LGUI_T(KC_TAB)`. Tap gives Tab. Hold gives Cmd. This means every Tab press has a timing window where it could register as Cmd instead. On macOS, Cmd+any key triggers a system shortcut. This is worse than the `LT3(KC_SPACE)` timing trap because: (a) Tab is pressed more frequently than Space in code editing (indentation, autocomplete, snippet expansion), and (b) the consequence of false-Cmd is a system shortcut firing, not just a wrong character.

Actually — Tab frequency depends heavily on workflow. In Vim/evil mode, Tab is rare. In VS Code with autocomplete, it is extremely frequent. And `LGUI_T` on thumbs is a standard Miryoku pattern. The timing window for a thumb tap vs hold is well-tested in that community. So this is a real but well-managed risk, not a newly discovered crisis.

**Revised position:** The Q-row outer is a valuable position. Dual Esc is an acceptable short-term state while the thumb Esc is validated. Once validated, the Q-row outer should be repurposed — Tab and Caps Word are the strongest candidates, but the specific choice depends on the user's editing workflow (Vim vs autocomplete-heavy). This is a decision that should be made in `r5` based on real use of `r4`.

### The Critical Miryoku Data Point That Both Agent 8 and Agent 9 Missed

Both reviews cite Miryoku as the reference for nav-layer Cmd shortcuts. Both say "Miryoku puts Cmd shortcuts on the nav layer home row." Neither actually checked where Miryoku puts them.

The Miryoku Vial config (`miryoku-silakka54-layout/vial/miryoku-silakka54-vial-config.json`) puts `LGUI(KC_Z/X/C/V/S)` on **Layer 2, Row 6 (right top row)** — NOT on the home row. The exact positions are:

```
Miryoku Layer 2, Right Top Row:
  Col 1: LGUI(KC_Z)
  Col 2: LGUI(KC_X)
  Col 3: LGUI(KC_C)
  Col 4: LGUI(KC_V)
  Col 5: LGUI(KC_S)
```

Meanwhile, the Miryoku Layer 2 home row (Row 2, left) has standalone modifiers in GACS order:
```
  Col 1: KC_LGUI
  Col 2: KC_LALT
  Col 3: KC_LCTRL
  Col 4: KC_LSHIFT
```

**This is a critical difference.** Miryoku does NOT replace the nav-layer home-row modifiers with Cmd shortcuts. It puts standalone GUI/Alt/Ctrl/Shift on the home row for chording, and puts the Cmd shortcuts on a different row entirely. The review has been citing Miryoku to justify placing `LGUI(KC_Z/X/C/V)` on the nav home row — but that is NOT what Miryoku does.

This resolves the conflict that both Agent 8 and Agent 9 identified (nav home row modifiers vs Cmd shortcuts): follow Miryoku's actual pattern. Keep standalone modifiers on the home row for chording. Put Cmd shortcuts on the **bottom row** of the left side (Layer 1, Row 3), where the base layer has Z/X/C/V and the nav layer currently has F8-F12.

**Concrete r5 nav-layer change:**
```
Current r4 nav Layer 1, L-bot:  ['KC_TRNS', 'KC_F8', 'KC_F9', 'KC_F10', 'KC_F11', 'KC_F12']
Proposed r5 nav Layer 1, L-bot:  ['KC_TRNS', 'LGUI(KC_Z)', 'LGUI(KC_X)', 'LGUI(KC_C)', 'LGUI(KC_V)', 'LGUI(KC_S)']
```

This mirrors the Miryoku pattern exactly: Cmd shortcuts on the row below home, where Z/X/C/V are on the base layer. F8-F12 lose one access path (they remain on L-top as F1-F5 companions and can be accessed there), while the most common macOS editing workflow (undo/cut/copy/paste/save) gains a dedicated nav-layer position. The home row modifiers stay untouched for arrow chording.

### Consensus Evaluation Across All 10 Agent Handoffs

#### Areas of Full Consensus (All Agents Agree)

1. **QWERTY base, macOS-first, dev-focused.** No agent has proposed Colemak, Gallium, or a non-QWERTY base. This is settled.
2. **No tap dances.** The TTR reference validated wiping them. Settled.
3. **Single stack (4 layers), not dual stack (8).** Collapsing layers 4-7 was correct. Settled.
4. **Esc should not be on outer-top-left.** Every agent agrees this was the worst position in the original layout. Settled.
5. **Miryoku is the design reference, not the thing to copy wholesale.** Settled.
6. **Ergonomic claims are hypotheses, not universal facts.** Settled since Agent 5.
7. **Nav-layer Cmd shortcuts are high-value and low-risk.** Settled since Agent 5. Only the exact implementation was disputed.
8. **Thumb layer-tap experiments come AFTER lower-risk changes.** Settled since Agent 6.
9. **The implementation baseline must be explicit.** Settled since Agent 7.
10. **Recommendations must name exact positions, not just general ideas.** Settled since Agent 8/9.

#### Areas of Strong Consensus (Most Agents, Minor Disagreement)

1. **`r4` is the active baseline.** 3 agents for (7, 9-conditional), 1 agent wants a selection rule first (8). In practice, no alternative has been proposed. Consensus with a footnote.
2. **`LT3(KC_BSPACE)` is a candidate, not a default.** Carries real relearn cost. Test in isolation. Consensus on process (test it), disagreement on the framing language.
3. **The two-test framework (30-sec + frequency×cost) is correct.** Agent 8 wants a third test (coherence). Good lens, not a blocking gate. Consensus on the first two, open question on the third.
4. **`=` displacement should be acknowledged.** All agents who addressed it agree the tradeoff was not stated. Disagreement on whether to reverse it.

#### Areas of Genuine Disagreement

1. **Should `=` return to the base layer?** Agent 9 says "needs a stated tradeoff," my position is to reverse it (restore `=`, move backtick off base). No agent has argued that backtick on base is more important than `=` on base for a dev board.
2. **Is the Q-row outer Esc a deliberate backup or available for repurposing?** Agent 9 says "decide." My position: available for repurposing once thumb Esc is validated, with Tab as the strongest candidate.
3. **Should `r5` be produced now or after more decisions?** Agent 9 says "one more round of concrete decision-making." My position: there are enough decisions to produce `r5` now, specifically:
   - Nav-layer Cmd shortcuts on the bottom row (following Miryoku's actual pattern)
   - Restore `=` to base layer
   - Keep dual Esc for now (revisit in r6 once thumb Esc is validated)

#### The Consensus Is Strong Enough to Act

The document has been running for 10 agent handoffs. The remaining disagreements are not about principles — they are about specific implementation choices that can only be resolved by trying them. The framework is stable:

- Baseline: `r4`
- Priority: nav shortcuts first, thumb experiments second
- Placement: follow Miryoku's actual pattern (Cmd shortcuts on bottom row, not home row)
- Tests: 30-sec for backup access, frequency×cost for placement, coherence as an evaluative lens

The next step is `r5`. The specific changes, evaluated against r4:

| Position | r4 | r5 Proposed | Rationale |
|----------|-----|-------------|-----------|
| L1 Row 3 (bottom) cols 1-5 | F8, F9, F10, F11, F12 | `LGUI(Z)`, `LGUI(X)`, `LGUI(C)`, `LGUI(V)`, `LGUI(S)` | Miryoku-inspired: Cmd shortcuts on row below home. F-keys still accessible on L-top row. |
| R num-row outer (Row 5, Col 0) | `KC_GRAVE` | `KC_EQUAL` | Restore `=` to base. Backtick returns to symbol layer only. Dev boards use `=` more than backtick. |
| All else | Same as r4 | Same as r4 | No other changes until r4 base is validated in real use. |

---

## Agent 11 Re-Challenge + Final Consensus Evaluation

This section challenges my own Agent 10 output against a deeper cross-examination of the Miryoku data and the r4 `.vil` file, then issues a definitive consensus evaluation.

### Self-Challenge: Agent 10's Miryoku Claim Was Half-Right

Agent 10 correctly identified that the review had been citing Miryoku's nav-layer Cmd shortcuts as "home row" when they are actually on the **right top row** (Row 6, cols 1-5). That correction stands and is important.

But Agent 10 then claimed that the correct r5 implementation is to put `LGUI(Z/X/C/V/S)` on the **left bottom row** (Layer 1, Row 3) because that is "where Z/X/C/V are on the base layer." This is wrong about Miryoku's design reasoning and produces a worse layout.

**The actual Miryoku pattern, fully specified:**

Miryoku's nav/edit layer (their Layer 2) right side is:
```
R-top:  [NO, LGUI(Z), LGUI(X), LGUI(C), LGUI(V), LGUI(S)]
R-home: [NO, Right,   Up,      Down,    Left,    CapsLock ]
R-bot:  [NO, End,     PgUp,    PgDn,    Home,    Insert   ]
```

Miryoku's nav/edit layer left side home row is:
```
L-home: [NO, KC_LGUI, KC_LALT, KC_LCTRL, KC_LSHIFT, NO]
```

The design logic is:
1. **Left home row** = standalone GACS modifiers (for chording with arrows on the right)
2. **Right home row** = arrow keys (primary navigation)
3. **Right top row** = Cmd shortcuts (Undo/Cut/Copy/Paste/Save — secondary editing)
4. **Right bottom row** = extended navigation (End/PgUp/PgDn/Home/Insert)

The Cmd shortcuts are on the right top row for a specific reason: they are under the same fingers that type Y/U/I/O/P on QWERTY (or their Colemak-DH equivalents). They are on the **right hand**, not the left hand. This positions them as a right-hand editing cluster that pairs with left-hand modifiers.

**r4's nav layer right side is:**
```
R-top:  [TRNS, TRNS, KC_PGDOWN, KC_UP, KC_PGUP, TRNS]
R-home: [TRNS, KC_END, KC_RIGHT, KC_DOWN, KC_LEFT, KC_HOME]
R-bot:  [TRNS, TRNS, TRNS, TRNS, TRNS, TRNS]
```

r4 has navigation keys scattered across both R-top and R-home. Up, PgDn, and PgUp are on R-top; the other arrows and Home/End are on R-home. The bottom row is entirely empty.

**There are two viable options for adding Cmd shortcuts:**

**Option A (Agent 10's proposal):** Left bottom row, replacing F8-F12
- Follows base-layer Z/X/C/V positional mapping (same physical keys)
- But: Cmd shortcuts on the LEFT hand while arrows are on the RIGHT hand means you cannot hold a modifier with the left hand and reach Cmd shortcuts with the right hand simultaneously. The left hand must be on `MO(1)` to access the nav layer. That means the left hand cannot chord modifiers while also accessing Cmd shortcuts.
- In Miryoku, this works because Miryoku uses layer-tap thumbs (`LT1(KC_ESCAPE)`), freeing both hands. In r4, nav is `MO(1)` on the left home-row outer — a held key that occupies the left hand entirely.
- **This is a functional problem that Agent 10 missed.** With `MO(1)` on the left home-row outer, pressing `LGUI(KC_Z)` on the left bottom row requires: left pinky holds `MO(1)`, then left ring/middle/index reach down to press `LGUI(KC_Z)`. This is an awkward one-hand stretch. In Miryoku's right-hand placement, the left hand is free to hold the layer key while the right hand accesses Cmd shortcuts.

**Option B (Miryoku-aligned):** Right top row, displacing PgUp/PgDn
- Puts Cmd shortcuts on the same hand as the arrow keys
- Requires moving PgUp/PgDn to R-bottom (where there is currently empty space)
- On macOS, PgUp/PgDn are redundant with Cmd+Up/Cmd+Down, so their demotion is low-cost
- The right-hand placement means: left hand holds `MO(1)`, right hand accesses both arrows AND Cmd shortcuts without the left hand needing to stretch

Wait — there is a subtlety. With `MO(1)` on the left home-row outer, the left hand is already occupied holding the nav layer. So ALL nav-layer interaction is a right-hand operation. This is true regardless of whether Cmd shortcuts are on the left bottom row or the right top row. The question is: when the left hand is already occupied holding `MO(1)`, is it easier for the right hand to reach R-top or for the left hand to reach L-bottom while also holding `MO(1)`?

Actually, holding `MO(1)` with the left pinky (home-row outer) leaves the rest of the left hand free to press keys on the same layer. It is not a full-hand occupation — it is a single finger. So the one-hand stretch concern in Option A is real but overstated. It is a pinky hold + ring/middle/index reach, which is awkward but possible. Miryoku uses layer-tap to avoid this entirely, but r4 does not have layer-tap yet.

**Revised assessment:** Both options are viable. Option A has a mild one-hand stretch. Option B displaces PgUp/PgDn (low cost on macOS). The deciding factor should be the review's own principle: **lowest risk first**.

Option A: replace F8-F12 on L-bottom with Cmd shortcuts. F-keys lose one access path (still on L-top). No existing nav behavior changes. Very low risk.

Option B: add Cmd shortcuts to R-top, reorganize navigation to R-bottom. Changes the positions of PgUp/PgDn. Higher risk — relearns nav layout.

**Agent 10's Option A is still the correct r5 choice.** The one-hand stretch is a real concern but is a comfort issue, not a functional one. It can be evaluated during r5 use and corrected in r6 with a right-hand placement if it proves problematic. The review's own risk-adjustment principle demands this: minimal structural change first, reorganization second.

### Self-Challenge: The `=` vs Backtick Tradeoff Needs More Precision

Agent 10 stated the tradeoff as "`=` is more common in every programming language" vs "backtick is more common in markdown, shell, and template literals." This is directionally correct but incomplete.

**The full tradeoff:**
- `KC_EQUAL` (`=`) and `LSFT(KC_EQUAL)` (`+`) are on both base AND symbol layers in the original. In r4, they are ONLY on the symbol layer (L3 Row 1 Col 3 and Col 2 respectively).
- `KC_GRAVE` (backtick) and `LSFT(KC_GRAVE)` (tilde) are on the symbol layer in the original (left outer columns: L-top col 5 and L-home col 5). In r4, backtick is on the base layer (R-num outer) AND on the symbol layer (R-top col 5 and... actually tilde is R-home col 5). So r4 gave backtick MORE access paths than the original, at the cost of removing `=` from the base layer.
- The original layout had `=` on the base layer AND the symbol layer. r4 reduced `=` from two access paths to one. This is a net regression for a key more common in code than backtick.

**Reversal position stands:** restore `KC_EQUAL` to the base layer right number-row outer. But — do NOT just blindly swap back. r4 also ADDED backtick/tilde to the right-side outer columns of the symbol layer (R-top col 5, R-home col 5) which were `KC_NO` in the original. These additions are good — they give backtick and tilde accessible positions on the symbol layer even without the base-layer key.

**Corrected r5 `=` proposal:**
- Base Layer 0, Row 5, Col 0: `KC_GRAVE` → `KC_EQUAL` (restore `=` to base)
- Symbol Layer 3: keep both `KC_GRAVE` on R-top col 5 and `LSFT(KC_GRAVE)` on R-home col 5 (r4's addition — these are good)
- Symbol Layer 3: `KC_EQUAL` on L-top col 3 and `LSFT(KC_EQUAL)` on L-top col 2 remain (unchanged)

This gives `=` the same dual-path access it had in the original (base + symbol), while backtick retains symbol-layer access at two positions. The only thing lost is backtick on the base layer — which was an r4 innovation that came at `=`'s expense.

### The LGUI_T(KC_TAB) Timing Problem Deserves More Prominence

Agent 10 identified but then dismissed the `LGUI_T(KC_TAB)` timing problem on the left thumb. Let me re-examine whether this dismissal was correct.

**The problem:** Tab is only accessible via `LGUI_T(KC_TAB)` on the left thumb (Row 4, Col 4). This means every Tab press has a timing window where it could register as Cmd instead. On macOS, random Cmd presses trigger system shortcuts (Cmd+Q quits, Cmd+W closes tab, Cmd+H hides app).

**Why Agent 10 dismissed it:** `LGUI_T` on thumbs is a standard Miryoku pattern, well-tested in that community.

**Why the dismissal was too quick:** Miryoku uses `RGUI_T(KC_ENTER)` and `LGUI_T(KC_TAB)` — but Miryoku also has Tab on the base layer in some configurations as `KC_TAB` on L-top col 0. The Vial config does not show this (it uses `KC_TAB` only as a tap output), but the standard Miryoku definition for the Silakka54 keymap has Tab available as a primary key on the left top outer. Let me verify:

Actually, looking at the Miryoku Vial config again: Row 1, Col 0 is `KC_TAB`. So Miryoku DOES have a dedicated Tab position on the base layer — in addition to `LGUI_T(KC_TAB)` on the thumb. Miryoku uses the thumb position for Cmd (hold) with Tab as tap, and the Q-row outer for pure Tab.

This means r4 has a Tab problem that Miryoku does not have. Miryoku's Q-row outer (L-top col 0) is `KC_TAB`, giving clean Tab access. r4's Q-row outer is `KC_ESCAPE` — a different key entirely. If r4 keeps dual Esc on the base layer (thumb + Q-row outer), it has no clean Tab position at all.

**This should be elevated to a r5 consideration.** The r5 proposal currently keeps dual Esc. But if the Q-row outer becomes `KC_TAB` instead of the second `KC_ESCAPE`, r4 gains:
- Clean Tab access (eliminating the LGUI_T timing risk for Tab explicitly)
- Esc still has a dedicated thumb position (the primary one)
- Esc backup access is still available via the U+I combo (established in earlier revisions)

This trades "dual Esc" for "dedicated Tab + combo Esc backup." On a dev board, Tab is more frequent than Esc, and the 30-second workflow-interruption test already says Esc passes. The combo backup passes the 30-second test (U+I is fast to execute). So this is a net improvement.

**Revised r5 proposal — add a third change:**

| Position | r4 | r5 Proposed | Rationale |
|----------|-----|-------------|-----------|
| L1 Row 3 (bottom) cols 1-5 | F8-F12 | `LGUI(Z/X/C/V/S)` | Cmd shortcuts on row below home. F-keys still on L-top. |
| R num-row outer (Row 5, Col 0) | `KC_GRAVE` | `KC_EQUAL` | Restore `=` to base. Backtick stays on symbol layer (r4's right-side positions). |
| L-top outer (Row 1, Col 0) | `KC_ESCAPE` | `KC_TAB` | Dedicated Tab eliminates LGUI_T timing risk. Esc backup via thumb + U+I combo. |

All other positions stay as r4. Three changes, all low-risk, all testable independently.

### Final Consensus Evaluation

#### Consensus Map (11 Agents)

| Topic | Full Consensus | Strong Consensus | Disputed | Status |
|-------|---------------|-----------------|----------|--------|
| QWERTY/macOS-first/dev-focused | ✓ | | | Settled |
| No tap dances | ✓ | | | Settled |
| Single stack (4 layers) | ✓ | | | Settled |
| Esc not on outer-top-left | ✓ | | | Settled |
| Miryoku as reference, not copy | ✓ | | | Settled |
| Ergonomic claims = hypotheses | ✓ | | | Settled |
| Nav Cmd shortcuts = high-value | ✓ | | | Settled |
| Thumb experiments after nav | ✓ | | | Settled |
| Baseline must be explicit | ✓ | | | Settled |
| Name exact positions | ✓ | | | Settled |
| r4 is the baseline | | ✓ (Agent 8 wants rule first) | | Settled in practice |
| LT3(BSPACE) = candidate only | | ✓ (disagreement on framing) | | Settled on process |
| Two-test framework | | ✓ (Agent 8 wants third) | | Settled on first two |
| `=` should return to base | | | ✓ (Agent 9 says "state tradeoff") | This challenge: restore in r5 |
| Nav Cmd: which row? | | | ✓ (A: L-bottom, B: R-top) | This challenge: Option A for r5 |
| Q-row outer: Esc or other? | | | ✓ | This challenge: Tab in r5 |
| Produce r5 now or later? | | | ✓ | This challenge: now |

#### The Three Remaining Disputes Are Resolved

Each has a concrete r5 answer. No more rounds of pure-prose refinement are needed:

1. **`=` on base → restore it.** The tradeoff in r4 favored backtick over `=`. For a dev board, this was the wrong call. r4's symbol-layer improvements for backtick (right-side positions) are retained.

2. **Nav Cmd placements → L-bottom row.** Option A, not Option B. Lowest risk, matches base-layer Z/X/C/V positions, does not reorganize the nav layer. The one-hand stretch concern (left pinky holds MO(1) while other left fingers reach L-bottom) is real but is a comfort issue to evaluate in use, not a functional blocker.

3. **Q-row outer → Tab.** Not Esc. Miryoku has Tab here. r4's `LGUI_T(KC_TAB)` on the thumb creates the same class of timing problem the review has been identifying since Agent 1. The fix is a dedicated Tab position. Esc remains on the thumb (primary) + U+I combo (backup).

#### Declaration: r5 Should Be Produced

The consensus is strong enough. The next agent should produce `vial/main-r5.vil` with the three changes specified above, evaluated against r4 data. Not more challenges. A `.vil` file.

---

## Agent 12 Re-Challenge + Definitive Consensus

This section challenges both the upstream Agent 11 (commit `6dd08c6`) and my own Agent 11, using data verified against the actual `.vil` files and the Miryoku reference config. Then it issues the definitive consensus resolution.

### Challenge to Upstream Agent 11

#### Finding 1: The Tab objection is wrong — and the data proves it

The upstream Agent 11 says: "The Q-row Esc repurposing argument is still reaching" and that `LGUI_T(KC_TAB)` on the thumb is "a standard Miryoku pattern."

**This is factually incorrect.** The Miryoku Vial config contains **zero** `LGUI_T` or `RGUI_T` keys. Miryoku does NOT use GUI mod-tap on any thumb. Miryoku's thumb cluster uses **layer-tap** exclusively:
```
Left thumb:  LT1(KC_ESCAPE), LT2(KC_SPACE), LT3(KC_TAB)
Right thumb: LT6(KC_DELETE), LT5(KC_BSPACE), LT4(KC_ENTER)
```

And Miryoku has a **dedicated `KC_TAB`** on L-top col 0 (the Q-row outer position).

This is not a minor distinction. The entire class of timing risk that `LGUI_T(KC_TAB)` creates — accidental Cmd triggers during Tab presses — **does not exist in Miryoku at all**. Miryoku avoids it by:
1. Having a dedicated Tab key on the Q-row outer (clean Tab without any mod-tap)
2. Using `LT3(KC_TAB)` on the thumb (tap for Tab, hold for Layer 3 — no Cmd risk)

r4 has `LGUI_T(KC_TAB)` on the thumb and `KC_ESCAPE` on the Q-row outer. This means every Tab press on r4 has a timing window that can accidentally fire a macOS system shortcut. This is not "a standard Miryoku pattern" — it is a deviation from Miryoku that introduces a problem Miryoku specifically designed around.

**The upstream Agent 11's dismissal relied on a false premise.** The Tab-to-Q-row proposal is not "reaching." It is correcting a known deviation from the reference layout that introduces timing risk on a high-frequency key.

#### Finding 2: The "`=` not fully settled" framing is too cautious

The upstream Agent 11 says: "But it is still not fully settled doctrine. It is now the leading recommendation, not an unquestionable conclusion."

Nobody is asking for mathematical proof. The standard is: what is the most defensible current recommendation, given the evidence? And the evidence is:
- `=` is more frequent in code than backtick (by any reasonable measure)
- The original layout had `=` on the base layer AND symbol layer; r4 reduced it to symbol-layer only
- Miryoku keeps `KC_EQUAL` on the base layer
- No agent has argued that backtick on base is more important than `=` on base

The upstream Agent 11 agrees with all of this but refuses to call it settled. At what point does a recommendation with zero counterarguments become "settled"? The document has been running for 12 agent handoffs. If "most defensible current recommendation with zero counterarguments" is not settled, the word has no operational meaning.

**Position:** `=` restoration to base is settled for r5. If new evidence emerges during r5 use, it can be revisited in r6.

### Self-Challenge: My Own Agent 11's Mistakes

#### Mistake 1: Agent 10 said "Miryoku pattern: Cmd shortcuts on row below home" — but Miryoku puts them on the RIGHT top row, not the LEFT bottom row

This is the most important correction. Agent 10 claimed that putting `LGUI(Z/X/C/V/S)` on the left bottom row (replacing F8-F12) "mirrors the Miryoku pattern exactly." It does not.

Miryoku puts Cmd shortcuts on the **right top row** (Row 6, cols 1-5). My Option A puts them on the **left bottom row** (Row 3, cols 1-5). These are different hands and different rows.

However, my Agent 11's analysis showed that Option A (L-bottom) is still the lower-risk choice for r5 because it does not displace any existing nav behavior, while Option B (R-top, the actual Miryoku position) would displace PgUp/PgDn and require nav-layer reorganization. This risk assessment is correct — but the claim that Option A "mirrors Miryoku exactly" was a misrepresentation. The correct framing is:

- **Option A mirrors Miryoku's CONCEPT** (Cmd shortcuts on a non-home-row position that preserves modifier chording) but NOT Miryoku's exact placement (right top vs left bottom)
- **The one-hand stretch concern** (left pinky holds MO(1) while left ring/middle/index reach L-bottom) is a real cost of deviating from Miryoku's right-hand placement

Agent 10 should have presented Option A as a pragmatic lowest-risk choice with a known ergonomic tradeoff, not as a faithful Miryoku adaptation. The distinction matters for the risk log.

#### Mistake 2: Agent 11's Tab analysis was correct in conclusion but incomplete in reasoning

I correctly identified that Tab should go on the Q-row outer, but I did not articulate the strongest argument: Miryoku has **zero** GUI mod-tap keys. r4 has **two** (`LGUI_T(KC_TAB)` and `RGUI_T(KC_ENTER)`). These are the only timing-risk keys on thumbs in the entire layout. They are not "a standard Miryoku pattern" — they are a design choice that Miryoku specifically avoided.

The corrected framing: r4's thumb mod-taps are a deliberate deviation from Miryoku's layer-tap design. This deviation trades one class of risk (accidental layer activation on thumbs, which Miryoku does have) for another class of risk (accidental Cmd triggers on thumbs, which Miryoku does NOT have). On macOS, the Cmd-trigger risk is higher-consequence because it fires system shortcuts.

For r5, the minimum fix is to give Tab a dedicated position (Q-row outer) so that `LGUI_T(KC_TAB)` is no longer the sole Tab source. This does not remove the mod-tap from the thumb — it adds a clean fallback. The thumb position still provides Cmd on hold, which is useful. But Tab is now reachable without any timing risk.

### Definitive Consensus Resolution

After 12 agent handoffs and full cross-examination against `.vil` data and the Miryoku reference, the following are RESOLVED:

#### Fully Settled (no agent disagreement, verified against data)

1. QWERTY, macOS-first, dev-focused
2. No tap dances
3. Single stack (4 layers)
4. Esc not on outer-top-left
5. Miryoku as conceptual reference, not wholesale copy
6. Ergonomic claims = hypotheses
7. Nav Cmd shortcuts = high-value, low-risk
8. Thumb experiments after lower-risk changes
9. Baseline must be explicit
10. Recommendations must name exact positions
11. **Miryoku does NOT use GUI mod-tap on thumbs** — it uses layer-tap exclusively (verified: zero `LGUI_T`/`RGUI_T` in Vial config)
12. **Miryoku puts Cmd shortcuts on the right top row of the nav layer, NOT the home row** (verified: Layer 2, Row 6, cols 1-5)
13. **Miryoku has `KC_TAB` on L-top col 0 AND `LT3(KC_TAB)` on the left thumb** — dedicated Tab position + layer-tap, no GUI mod-tap

#### Settled for r5 (strong recommendation, zero counterarguments in practice)

14. r4 is the implementation baseline
15. Restore `KC_EQUAL` to base layer (right num-row outer), backtick to symbol-layer only
16. Nav Cmd shortcuts on L-bottom row (Option A — lowest risk, preserves existing nav structure)
17. Move `KC_TAB` to Q-row outer (L-top col 0), replacing duplicate Esc

#### Deferred to r6+ (acknowledged, not ready for r5)

18. Evaluate whether to move Cmd shortcuts to R-top (Miryoku's exact position) after r5 use validates the nav layer
19. Evaluate whether to replace `LGUI_T(KC_TAB)` and `RGUI_T(KC_ENTER)` with layer-taps (Miryoku pattern) — this is the thumb experiment track
20. Revisit F-key access after nav-layer Cmd shortcuts are validated (currently F8-F12 on L-bottom becomes LGUI shortcuts; F-keys remain on L-top)
21. Evaluate Caps Word (`CW_TOGG`) for a position once the layout stabilizes

### r5 Specification (Final)

Three changes from r4, all independently testable:

**Change 1: Nav Layer — Cmd Shortcuts**
```
Layer 1, Row 3 (L-bottom), cols 1-5:
  BEFORE: ['KC_F8', 'KC_F9', 'KC_F10', 'KC_F11', 'KC_F12']
  AFTER:  ['LGUI(KC_Z)', 'LGUI(KC_X)', 'LGUI(KC_C)', 'LGUI(KC_V)', 'LGUI(KC_S)']
```
F-keys F8-F12 remain accessible on L-top (Row 1, cols 1-5 has F1-F5; F6/F7 on L-home cols 1/5). Known tradeoff: one-hand stretch when left pinky holds MO(1) and other left fingers reach L-bottom. This is a comfort issue to evaluate in use.

**Change 2: Base Layer — Restore `=` to Right Num-Row Outer**
```
Layer 0, Row 5, Col 0:
  BEFORE: 'KC_GRAVE'
  AFTER:  'KC_EQUAL'
```
Backtick/tilde remain on symbol layer at r4's right-side positions (L3 R-top col 5 and R-home col 5). `LSFT(KC_EQUAL)` (plus/`+`) is restored to base-layer access via Shift+`=`.

**Change 3: Base Layer — Dedicated Tab on Q-Row Outer**
```
Layer 0, Row 1, Col 0:
  BEFORE: 'KC_ESCAPE'
  AFTER:  'KC_TAB'
```
Esc has two remaining access paths: (a) left thumb (Row 4, Col 3, `KC_ESCAPE` — the primary), (b) U+I combo (verified in r4's combo config at `combo[1]`). Tab now has a dedicated position, eliminating the LGUI_T timing risk for Tab presses. `LGUI_T(KC_TAB)` remains on the thumb for Cmd access via hold.

---

## Agent 13 Re-Challenge + Consensus Re-Evaluation

This section challenges the Agent 12 output by cross-examining the r5 specification against the actual `.vil` data for gaps and oversights. Two findings: one that modifies the r5 spec, one that reframes existing consensus.

### Finding 1: The r5 Spec Quietly Kills F8-F12 Access — This Is a Real Regression

Agent 12's r5 spec replaces `F8-F12` on the nav layer left bottom row with `LGUI(Z/X/C/V/S)`. The spec states: "F-keys F8-F12 remain accessible on L-top (Row 1, cols 1-5 has F1-F5; F6/F7 on L-home cols 1/5)."

**This is misleading.** L-top has F1-F5, not F8-F12. F8-F12 are only on L-bottom (the row being replaced). After r5 Change 1, F8-F12 have **zero** access paths on the nav layer. None.

For a dev-focused board, this is a real regression:
- **F8**: step over in debugger (Xcode, lldb, Chrome DevTools)
- **F9**: resume execution / toggle breakpoint
- **F10**: step over
- **F11**: step into
- **F12**: step out / go to definition (VS Code, all JetBrains IDEs)

These are not exotic keys. They are the primary debugger control cluster. Removing them without replacement breaks a core dev workflow.

**The r4 media layer (Layer 2) left side is entirely `KC_NO` — 20 positions doing nothing.** This is where F-keys should go instead. Moving F1-F12 to the media layer left side consolidates all infrequently-accessed utility keys (media, brightness, F-keys) on one layer and frees the nav layer for its core purpose (navigation + editing shortcuts).

**Proposed modification to r5 Change 1** (replace with a two-part change):

**Change 1a: Nav Layer — Cmd Shortcuts (same as before)**
```
Layer 1, Row 3 (L-bottom), cols 1-5:
  BEFORE: ['KC_F8', 'KC_F9', 'KC_F10', 'KC_F11', 'KC_F12']
  AFTER:  ['LGUI(KC_Z)', 'LGUI(KC_X)', 'LGUI(KC_C)', 'LGUI(KC_V)', 'LGUI(KC_S)']
```

**Change 1b: Media Layer — F-Key Migration (NEW)**
```
Layer 2, Row 1 (L-top), cols 1-5:
  BEFORE: ['KC_NO', 'KC_NO', 'KC_NO', 'KC_NO', 'KC_NO', 'KC_NO']
  AFTER:  ['KC_NO', 'KC_F1', 'KC_F2', 'KC_F3', 'KC_F4', 'KC_F5']

Layer 2, Row 2 (L-home), cols 1-5:
  BEFORE: ['KC_NO', 'KC_NO', 'KC_NO', 'KC_NO', 'KC_NO', 'KC_NO']
  AFTER:  ['KC_NO', 'KC_F6', 'KC_F7', 'KC_F8', 'KC_F9', 'KC_F10']

Layer 2, Row 3 (L-bottom), cols 1-3:
  BEFORE: ['KC_NO', 'KC_NO', 'KC_NO', 'KC_NO', 'KC_NO', 'KC_NO']
  AFTER:  ['KC_NO', 'KC_F11', 'KC_F12', 'KC_NO', 'KC_NO', 'KC_NO']
```

This moves ALL F-keys to the media layer (which is accessed via `MO(2)` on the base layer left bottom row outer — same reach, different layer). The nav layer is now purely for navigation + editing shortcuts. The media layer becomes the "utility cluster" (media controls on right, F-keys on left, brightness on right).

Cost: F-keys require `MO(2)` instead of `MO(1)`. The left bottom row outer is `MO(2)` — held with the same pinky as `MO(1)`. The layer switch is adjacent but requires a different hold. This is a mild relearn but does not create any functional gap.

Benefit: F8-F12 regain access. Nav layer is cleaner. Media layer's wasted 20 positions get real work.

### Finding 2: The Review Has a Tab/Enter Asymmetry — and Enter Is Actually Worse

The entire review — all 13 agent handoffs — has focused on `LGUI_T(KC_TAB)` as a timing risk. In Agent 12, this was elevated to a settled-for-r5 change (dedicated Tab on Q-row outer). But the review has **never analyzed `RGUI_T(KC_ENTER)`**, which has the same class of timing risk with **higher consequences**.

On macOS:
- Accidental **Cmd+Tab**: triggers app switcher. Non-destructive, immediately recoverable by pressing Tab again or Esc.
- Accidental **Cmd+Enter**: sends message (Slack, Discord), executes command (Terminal, iTerm), runs code (VS Code Run), confirms cell (Excel). Often **destructive and irreversible**.

Enter is also more frequently pressed than Tab in general typing. And Enter has **zero** dedicated positions in r4 — it is *only* accessible via `RGUI_T(KC_ENTER)` on the right thumb. Tab has the same problem but at least gets a dedicated position in r5. Enter gets nothing.

**This asymmetry is a gap in the review, not necessarily a gap in r5.** The practical issue is: where would a dedicated Enter go? Miryoku's answer is `LT4(KC_ENTER)` on the right thumb — layer-tap instead of mod-tap. But that is a thumb restructuring experiment, which the review correctly defers to r6+.

The correct r5 position is: **acknowledge the Enter timing risk is equal to or worse than Tab, but defer the fix to the thumb experiment track (r6+).** The dedicated Tab fix in r5 only addresses one side of a two-sided problem. The other side requires a deeper architectural change (converting thumb mod-taps to layer-taps, following Miryoku's actual pattern).

**Proposed addition to the Deferred list:**
- 22. Acknowledge `RGUI_T(KC_ENTER)` has a higher-consequence timing risk than `LGUI_T(KC_TAB)`. Fix requires converting right thumb from mod-tap to layer-tap — this is part of the thumb experiment track (deferred to r6+). The dedicated Tab in r5 only partially addresses the mod-tap timing risk.

### Re-Evaluated Consensus

The Agent 12 consensus map remains correct with two additions:

**Add to Fully Settled:**
- 14. **F8-F12 are dev-critical keys** — debugger F-keys cannot be removed from the layout without replacement

**Add to Settled for r5:**
- 15. **Move F-keys to media layer** — the media layer left side is entirely empty; F-keys belong there, not on the nav layer

**Add to Deferred:**
- 22. **`RGUI_T(KC_ENTER)` timing risk** — higher consequence than Tab's; fix requires thumb restructuring (r6+)

### Revised r5 Specification

Four changes from r4 (was three; Change 1b is new):

**Change 1a: Nav Layer — Cmd Shortcuts**
```
Layer 1, Row 3 (L-bottom), cols 1-5:
  BEFORE: ['KC_F8', 'KC_F9', 'KC_F10', 'KC_F11', 'KC_F12']
  AFTER:  ['LGUI(KC_Z)', 'LGUI(KC_X)', 'LGUI(KC_C)', 'LGUI(KC_V)', 'LGUI(KC_S)']
```

**Change 1b: Media Layer — F-Key Migration (NEW)**
```
Layer 2, Row 1 (L-top), cols 1-5: KC_NO ×5 → F1-F5
Layer 2, Row 2 (L-home), cols 1-5: KC_NO ×5 → F6-F10
Layer 2, Row 3 (L-bottom), cols 1-2: KC_NO ×2 → F11-F12
```
Media layer left side was entirely `KC_NO`. This gives it real work. F-keys move from nav layer to media layer.

**Change 2: Base Layer — Restore `=` to Right Num-Row Outer** (unchanged)
```
Layer 0, Row 5, Col 0: KC_GRAVE → KC_EQUAL
```

**Change 3: Base Layer — Dedicated Tab on Q-Row Outer** (unchanged)
```
Layer 0, Row 1, Col 0: KC_ESCAPE → KC_TAB
```
Esc backup: thumb (primary) + U+I combo. Tab is now reachable without timing risk. `LGUI_T(KC_TAB)` remains for Cmd-hold. Note: `RGUI_T(KC_ENTER)` still has unresolved timing risk — deferred to thumb experiment track (r6+).

## Agent 14 Re-Challenge + Consensus Update

This section challenges the newest `Agent 13 Re-Challenge + Consensus Re-Evaluation` and narrows the consensus to what is actually strong enough to guide the next revision.

### Main Findings

#### 1. The F-key regression point is valid, but "F8-F12 are dev-critical" is too broad to be called settled

The strongest part of the new section should stand:
- replacing the nav-layer left bottom row with `LGUI(Z/X/C/V/S)` does remove the only current access path to `F8-F12`
- that is a real regression if the layout is expected to preserve debugger/function-key workflows

That part is factual and useful.

But the jump from that fact to "F8-F12 are dev-critical keys" as a settled statement is too broad. They are critical for some workflows:
- debugger-heavy IDE use
- JetBrains / VS Code function-key habits
- browser devtools / Xcode style stepping

They are much less central for others:
- Vim-heavy terminal workflows
- remapped IDEs
- macOS users who rarely touch raw F-keys at all

So the right conclusion is:
- removing `F8-F12` with no replacement is a regression
- migrating them somewhere is a reasonable fix
- but their universal "dev-critical" status is still workflow-dependent, not settled doctrine

#### 2. The proposed F-key migration is a plausible patch, not consensus

Moving all F-keys to the left side of the media layer is coherent enough as a candidate. The left side of the media layer is empty, and putting utility/system keys there is an understandable use of the space.

But this is still one implementation proposal, not established consensus. The latest section promotes it too quickly from "good recovery path" to "Settled for r5."

What is still open:
- whether nav shortcuts actually belong on the left bottom row in the first place
- whether moving F-keys to media is preferable to a different shortcut row placement
- whether the proposed F-key packing on the media layer is the best one, or just the first convenient one

So the new section correctly identifies a regression, but it does not fully prove that this specific F-key migration is the unique or settled solution.

#### 3. The Tab/Enter asymmetry point is real, but it weakens the certainty of the Tab-in-r5 claim

The latest section is right to call out an asymmetry:
- the review has focused heavily on `LGUI_T(KC_TAB)`
- but `RGUI_T(KC_ENTER)` is at least as risky, and often higher consequence on macOS

That is a real challenge to the earlier framing.

And it cuts in an important direction: if the review now recognizes that both thumb GUI mod-taps are part of the same structural issue, then moving `KC_TAB` to the Q-row outer becomes less obviously a self-contained "r5-ready" fix. It may still be a good move, but it is now more clearly part of a broader thumb-mod-tap problem.

So the new section is right to defer the full Enter fix to the thumb experiment track. But by the same logic, the Tab move is no longer as cleanly isolated as earlier sections claimed. That does not kill the Tab proposal. It just makes it less settled than the first two categories of change.

#### 4. The newest section still bundles too much into "Re-Evaluated Consensus"

The strongest consensus now is still narrower than the latest section claims.

What the document has genuinely converged on:
- Miryoku facts about thumbs and nav shortcuts
- `r4` as the practical implementation candidate
- nav-layer Cmd shortcuts before thumb experiments
- `=` restoration as the strongest base-layer correction

What the document has not converged on equally strongly:
- exact row/side for the nav Cmd shortcuts
- exact recovery path for `F8-F12`
- whether Q-row `Esc` should become `KC_TAB` in the very next revision

So the new section improves the implementation discussion, but its "settled for r5" tone is still ahead of the actual agreement.

### Consensus Update

#### Strongest Current Consensus

- Miryoku is the conceptual baseline.
- `r4` is the practical implementation candidate.
- the next revision should prioritize low-risk nav improvements before thumb experiments.
- restoring `KC_EQUAL` to the base layer is the strongest open base-layer recommendation.
- any nav-shortcut change must preserve modifier chording and must not silently remove `F8-F12` without replacement.

#### Still Open

- whether nav Cmd shortcuts should be implemented on the left bottom row or via a different adaptation
- whether F-key migration to the media layer is the best recovery path or just the first workable one
- whether `KC_TAB` should join the next narrow revision or remain the strongest candidate for the revision after

### Bottom Line

The newest section makes two valuable contributions:
- it correctly identifies the hidden `F8-F12` regression in the proposed left-bottom nav shortcut change
- it correctly forces the review to acknowledge that `RGUI_T(KC_ENTER)` belongs to the same thumb-risk family as `LGUI_T(KC_TAB)`

But the cleanest consensus is still this:
- a narrow next revision should happen soon
- `=` restoration is the most settled concrete key change
- nav-layer Cmd shortcuts are the most settled directional change
- the exact shortcut row, F-key recovery, and Q-row `KC_TAB` decision are improved by the latest section, but not equally settled yet

That is the most defensible current state of the handoff chain.

---

## Agent 15 Re-Challenge + Consensus Re-Evaluation

This section challenges Agent 14 and overturns the Agent 10-13 Cmd shortcut placement by introducing Option C, which dominates the previous Option A on both risk and ergonomics.

### Finding 1: Option A (L-bottom) Was the Wrong Choice — Option C (R-bottom) Dominates It

Agents 10-13 proposed putting `LGUI(Z/X/C/V/S)` on the **left bottom row** of the nav layer (replacing F8-F12). Agent 13 identified the F8-F12 regression and proposed an F-key migration to the media layer as a recovery path. Agent 14 correctly noted that the migration was "a plausible patch, not consensus."

The deeper problem: Option A was never the best choice. It was the first choice, and it became entrenched through four agent handoffs without proper comparison.

**Option C: Put Cmd shortcuts on the RIGHT bottom row of the nav layer (R-bot, Row 8, cols 1-5).**

This row is currently all `KC_TRNS` on the nav layer. It is physically below the arrow keys on R-home. Adding Cmd shortcuts here requires zero displacements, zero migrations, zero regressions.

**Comparison across all three options:**

| Dimension | Option A (L-bot) | Option B (R-top, Miryoku exact) | Option C (R-bot) |
|-----------|-------------------|----------------------------------|-------------------|
| Displaces | F8-F12 | PgDn/Up/PgUp | Nothing |
| F-key regression | Yes (requires migration) | No | No |
| Risk | Medium | Medium | Very low |
| Same hand as arrows | No (left hand) | Yes (right hand) | Yes (right hand) |
| Miryoku alignment | Wrong hand, different row | Right hand, correct row | Right hand, row below Miryoku's |
| Ergonomic quality | Worst (one-hand stretch) | Best (above arrows) | Good (below arrows) |
| Implementation complexity | High (must also migrate F-keys) | Medium (must reorganize nav) | Lowest (pure addition) |

**Option C dominates Option A on every dimension except one:** base-layer Z/X/C/V positional mapping. Option A puts Cmd shortcuts under the same physical keys as Z/X/C/V (which produce the letters in the shortcut). This is a minor mnemonic aid — "the key that types Z also triggers Undo" — but it is not worth the cost of:
- Removing F8-F12 (requiring a migration to recover)
- Putting Cmd shortcuts on a different hand from arrows (worse workflow: you navigate with right hand arrows while Cmd shortcuts are on the left hand, which is also holding the layer key)
- Creating a one-hand stretch (left pinky holds MO(1), other left fingers reach L-bottom)

**Option C follows Miryoku's correct design principle** — Cmd shortcuts should be on the same hand as navigation keys, because navigation and editing shortcuts are used in the same workflow context. The specific row (R-bot vs R-top) is secondary to the hand assignment (right vs left).

Agent 14's concern about "exact row/side for the nav Cmd shortcuts" is resolved: **right hand, bottom row**. This was always the structurally correct answer. Agents 10-13 just never compared it against Option A properly.

**Agent 14's concern about F-key recovery is also resolved:** Option C does not remove F8-F12 at all. They stay on the nav layer L-bottom as in r4. The entire F-key migration proposal from Agent 13 becomes unnecessary — it was a patch for a self-inflicted regression that Option C avoids entirely.

### Finding 2: Agent 14's "F8-F12 not dev-critical" Framing Is Right But Irrelevant Under Option C

Agent 14 says: "Their universal 'dev-critical' status is still workflow-dependent, not settled doctrine." This is correct. F-key importance varies by workflow. Vim users rarely touch them. VS Code debugger users need them constantly.

But under Option C, this distinction does not matter. Option C does not remove F-key access. The F-key regression debate only existed because Option A removed them. With Option C, F-keys remain on the nav layer as in r4. The "dev-critical or not" question becomes moot.

### Finding 3: Agent 14's Tab/Enter Weakening Argument Is Half-Right

Agent 14 says: "by the same logic, the Tab move is no longer as cleanly isolated as earlier sections claimed." This is a valid observation — if both Tab and Enter are part of the same structural problem (GUI mod-tap on thumbs), then fixing only Tab is a partial solution.

But partial solutions are not invalid. The review's own principle is "low-risk changes first, evaluate in use." Adding a dedicated Tab position on the Q-row outer is low-risk and addresses one side of a two-sided problem. The fact that Enter remains unfixed does not make the Tab fix wrong — it makes it incomplete.

Agent 14's framing implies that acknowledging the Enter problem weakens the Tab case. The opposite is true: acknowledging both problems makes it clearer that the Q-row Tab is the *easiest first step* in a two-step process. Step 1: give Tab a clean position (r5). Step 2: convert thumb mod-taps to layer-taps, fixing both Tab and Enter (r6+).

**Position:** Tab on Q-row outer remains correct for r5. The Enter acknowledgment strengthens the rationale by making the two-step process explicit, not by weakening step 1.

### Consensus Re-Evaluation

#### What Changed

1. **Option C replaces Option A** as the Cmd shortcut placement. This eliminates:
   - The F8-F12 regression (Option C does not remove them)
   - The need for F-key migration to media layer (Agent 13's Change 1b)
   - The one-hand stretch ergonomic concern
   - Agent 14's "exact row" and "F-key recovery" open questions

2. **The r5 spec simplifies from 4 changes back to 3.** The F-key migration (Change 1b) is no longer needed because Option C does not displace F8-F12.

3. **Nav Cmd shortcut placement is now resolved**, not still open. Right bottom row, zero regressions, Miryoku's correct hand assignment.

#### Updated r5 Specification (3 changes, revised from Agent 13's 4)

**Change 1: Nav Layer — Cmd Shortcuts on Right Bottom Row (REVISED)**
```
Layer 1, Row 8 (R-bottom), cols 1-5:
  BEFORE: ['KC_TRNS', 'KC_TRNS', 'KC_TRNS', 'KC_TRNS', 'KC_TRNS', 'KC_TRNS']
  AFTER:  ['KC_TRNS', 'LGUI(KC_Z)', 'LGUI(KC_X)', 'LGUI(KC_C)', 'LGUI(KC_V)', 'LGUI(KC_S)']
```
No displacements. F8-F12 remain on L-bottom unchanged. Cmd shortcuts on the same hand as arrows (R-home). Two-hand operation: left hand holds MO(1), right hand accesses both arrows and Cmd shortcuts. This follows Miryoku's right-hand principle even though it uses the row below instead of the row above arrows.

**Change 2: Base Layer — Restore `=` to Right Num-Row Outer** (unchanged from Agent 12)
```
Layer 0, Row 5, Col 0: KC_GRAVE → KC_EQUAL
```

**Change 3: Base Layer — Dedicated Tab on Q-Row Outer** (unchanged from Agent 12)
```
Layer 0, Row 1, Col 0: KC_ESCAPE → KC_TAB
```
Esc backup: thumb (primary) + U+I combo. `RGUI_T(KC_ENTER)` timing risk acknowledged and deferred to thumb experiment track (r6+).

#### Updated Consensus

**Fully Settled (verified against data, no agent disagreement):**
1-10: [unchanged from Agent 12]
11. Miryoku uses zero GUI mod-taps on thumbs (layer-tap exclusively)
12. Miryoku puts Cmd shortcuts on the RIGHT side of the nav layer (R-top), NOT left bottom
13. Miryoku has `KC_TAB` on L-top col 0 + `LT3(KC_TAB)` on thumb
14. **Cmd shortcuts belong on the RIGHT hand of the nav layer** — same hand as arrows (Miryoku principle, verified by ergonomic analysis)

**Settled for r5:**
15. r4 is the implementation baseline
16. Restore `KC_EQUAL` to base layer (right num-row outer)
17. Nav Cmd shortcuts on **R-bottom row** (Option C — zero regressions, same hand as arrows, pure addition)
18. Move `KC_TAB` to Q-row outer (replaces duplicate Esc)

**Settled for r5 (acknowledging partial scope):**
19. `RGUI_T(KC_ENTER)` has a higher-consequence timing risk than `LGUI_T(KC_TAB)`. The Tab fix in r5 is step 1 of a two-step process. Step 2 (converting thumb mod-taps to layer-taps) is deferred to r6+.

**Deferred to r6+:**
20. Evaluate whether to move Cmd shortcuts from R-bot to R-top (Miryoku's exact position) after r5 validation
21. Evaluate thumb mod-tap → layer-tap migration (fixes both Tab and Enter timing risks)
22. Revisit F-key placement if the nav layer restructures in r6
23. Evaluate Caps Word (`CW_TOGG`) once layout stabilizes

#### What the F-key Migration Debate Taught Us

The F-key migration proposal (Agent 13) and its pushback (Agent 14) were both correct within the Option A frame. Option A required trading F8-F12 for Cmd shortcuts, which necessitated a recovery path. The debate was about whether the recovery path was settled or just plausible.

Under Option C, this entire debate evaporates. F8-F12 never leave the nav layer. No recovery path is needed. The media layer's empty left side remains available for future use (dedicated F-key layer, additional utility keys, or other needs) but is not required as an urgent r5 fix.

**The lesson:** when adding new functionality to an existing layer, prefer positions that are currently empty over positions that require displacement + migration. The review spent 3 agent handoffs (13-15) on a problem that Option C avoids entirely.

## Agent 16 Re-Challenge + Consensus Update

This section challenges the latest `Agent 15 Re-Challenge + Consensus Re-Evaluation` and updates the consensus after the new Option C proposal.

### Main Findings

#### 1. Option C is the strongest Cmd-shortcut proposal so far, but "dominates" is still too strong

The biggest improvement in the latest section is real:
- putting nav-layer `Cmd-Z/X/C/V/S` on the **right bottom row** avoids the `F8-F12` regression
- it keeps the shortcuts on the same hand as the navigation cluster
- it does not force an immediate migration of other keys

That makes Option C clearly stronger than Option A.

But "dominates" is still overstated because Option C is not better on every meaningful axis:
- it is not Miryoku's exact row
- it puts shortcuts farther from the current arrow cluster than the Miryoku right-top pattern
- it sacrifices some mnemonic value compared with left-side Z/X/C/V positional mirroring

So the right status is:
- Option C is now the **leading implementation candidate**
- Option A is effectively superseded
- Option B remains the cleaner Miryoku-aligned architecture, but higher-risk for the immediate next revision

That is a real narrowing of the field, not total closure.

#### 2. The F-key regression debate is no longer central, but it still taught a valid rule

The latest section is right that Option C makes the previous F-key migration debate unnecessary for `r5`.

But the "this entire debate evaporates" phrasing goes a bit too far. The debate still produced a useful design rule that should survive:

- do not accept a convenience placement for new shortcuts if it silently destroys an existing dev workflow

That rule still matters beyond F-keys. It should stay in the document even if Option C makes the specific F-key migration unnecessary.

#### 3. The Tab move is still not as settled as the latest section claims

The latest section keeps pushing the Q-row `KC_TAB` move as part of the same settled `r5` package as `=` restoration and the new Option C shortcut placement.

That is still too aggressive.

Why:
- `=` restoration now has the strongest accumulated support in the whole review chain
- Option C for nav shortcuts is now the strongest low-risk shortcut placement proposal
- the Q-row `KC_TAB` move still changes the Esc backup story and is tied to the broader thumb-mod-tap problem

The latest section is right that partial fixes are legitimate. But legitimacy is not the same thing as equal consensus.

So the consensus remains tiered:
- Cmd shortcut placement: strong enough to act
- `=` restoration: strong enough to act
- Q-row `KC_TAB`: strongest next candidate, but still one notch less settled than the first two

#### 4. The Enter point further supports keeping `r5` narrow

The latest section is also right that `RGUI_T(KC_ENTER)` belongs in the same risk family as `LGUI_T(KC_TAB)`.

And that cuts toward a narrower immediate revision, not a broader one. Once the review acknowledges:
- Tab risk
- Enter risk
- duplicate Esc questions

the case for bundling a base-layer Tab move into the same narrow revision as the low-risk nav/`=` cleanup gets weaker, not stronger.

That does not mean the Tab proposal is wrong. It means the review now has even more reason to keep `r5` conservative and leave the thumb-risk-family cleanup as the next step after that.

### Consensus Update

#### Strongest Current Consensus

- Miryoku facts about thumbs and nav shortcut placement are verified.
- `r4` is the practical implementation candidate.
- a narrow next revision should prioritize low-risk nav improvements before thumb experiments.
- restoring `KC_EQUAL` to the base layer is the strongest settled key change.
- Option C is now the leading nav-shortcut placement candidate because it avoids the self-inflicted F-key regression of Option A.

#### Strong But Not Fully Closed

- the next revision should probably use Option C for nav shortcuts
- the next revision should probably restore `=`
- the Q-row `KC_TAB` move remains the strongest follow-on candidate, but still not as settled as the first two

#### Still Open

- whether the next revision should be only `Option C + =`
- or whether it should also include the Q-row `KC_TAB` move
- whether the eventual thumb cleanup should replace both `LGUI_T(KC_TAB)` and `RGUI_T(KC_ENTER)` together in the following revision

### Bottom Line

The latest section makes the best shortcut-placement argument in the document so far. Option C is now the strongest implementation proposal for nav-layer `Cmd` shortcuts.

But the cleanest consensus is still:
- narrow `r5`
- adopt the strongest low-risk changes first
- treat `Option C + restore =` as the most settled package
- keep the Q-row `KC_TAB` move as the strongest next candidate, not yet as equally settled with the first two

That is the most defensible current synthesis of the handoff chain.

---

## Agent 17 Re-Challenge + Consensus Re-Evaluation

This section challenges Agent 16's three specific arguments for deferring Tab from r5, cross-examines the "Option C not exact Miryoku" and "mnemonic value" points, and re-evaluates the Tab consensus tier.

### Challenge to Agent 16

#### Finding 1: The "Tab changes the Esc backup story" argument is operationally weak

Agent 16 says the Tab move "changes the Esc backup story," implying this is a meaningful risk.

**Verified against r4 data:** The Esc paths in r4 are:
1. Left thumb (Row 4, Col 3, dedicated `KC_ESCAPE`) — **primary**
2. Q-row outer (Row 1, Col 0, dedicated `KC_ESCAPE`) — secondary
3. U+I combo (`combo[1]` in r4 config) — tertiary

After Tab change, the Esc paths become:
1. Left thumb — **primary, UNCHANGED**
2. U+I combo — secondary, UNCHANGED
3. Q-row outer → `KC_TAB` (Esc lost at this position)

The primary Esc path is unchanged. The combo backup is unchanged. The only thing lost is a convenience duplicate. The 30-second workflow-interruption test that the review established in Agent 7 says Esc deserves a backup path — and it still has one (U+I combo). The combo is a two-key chord on adjacent keys (U and I, right hand home row), which is fast to execute.

Agent 16's claim is technically true but operationally trivial. The "backup story" goes from triple redundancy to double redundancy, which is still above the threshold the 30-second test requires.

#### Finding 2: The Tab/Enter relationship argues FOR r5 Tab, not against it

Agent 16's logic: acknowledging Enter risk → both are same problem → Tab fix is partial → defer it.

**This logic is backwards.** Both Tab and Enter suffer from GUI mod-tap timing risk on thumbs. We cannot fix Enter in r5 (requires thumb restructuring). We CAN fix Tab in r5 (move one key on the base layer). Fixing the fixable half of a problem is better than deferring the entire fix because the other half is harder.

The question is not "is the Tab fix partial?" It is: "does fixing Tab now make it harder to fix Enter later?" The answer is no. The Q-row Tab position and the thumb restructuring are independent changes. Adding `KC_TAB` on the Q-row does not block or complicate any future Enter fix.

Agent 16's argument that "the review now has even more reason to keep r5 conservative" inverts the correct inference. Discovering that TWO high-frequency keys have timing risk should increase urgency, not decrease it. The fact that only one is easily fixable makes it more important to fix that one now, not less.

#### Finding 3: "Option C not Miryoku exact / sacrifices mnemonic value" is not a valid objection

Agent 16 lists two reasons Option C does not "dominate":
- It is not Miryoku's exact row (R-top vs R-bottom)
- It "sacrifices some mnemonic value compared with left-side Z/X/C/V positional mirroring"

**Mnemonic value:** Miryoku puts `LGUI(Z/X/C/V/S)` under the Y/U/I/O/P positions on R-top. The mapping is Y→Undo, U→Cut, I→Copy, O→Paste, P→Save. This is NOT mnemonic by position. Miryoku deliberately sacrificed left-side Z/X/C/V positional matching to put Cmd shortcuts on the right hand. Option C makes the same tradeoff. Agent 16's objection is not a deviation from Miryoku's design logic — it IS Miryoku's design logic.

**Not Miryoku's exact row:** R-bottom is one row below R-home (arrows). R-top is one row above R-home. On a columnar-stagger split keyboard, these are the same distance from the home position. R-bottom is not "farther from the arrow cluster." It is equidistant in the opposite direction.

The distinction between Option C (R-bottom) and Option B (R-top, Miryoku exact) is minimal in ergonomic terms. The review's own principle — lowest risk first — correctly selects C over B for r5. Option B can be evaluated as a structural refinement in r6+ if the nav layer needs Miryoku alignment after real use.

**Agent 16's claim that "dominates" is overstated:** On the two specific axes Agent 16 names (Miryoku exact row, mnemonic value), Option C is at parity with Miryoku's own design decisions, not worse. "Dominates" is correct when the comparison is with Option A (which is worse on risk, ergonomics, and regression profile).

#### Finding 4: The "narrow r5" framing creates a real user cost that is never weighed

Agent 16 repeatedly argues for a "narrow r5" — Option C + `=` only, Tab deferred. The benefit of narrowness is stated (conservative, lower risk) but the cost is never quantified.

**The cost:** every r5 user who needs to press Tab must do so through `LGUI_T(KC_TAB)` on the thumb. Every Tab press has a timing window that can accidentally fire a macOS system shortcut (Cmd+anything). This is not a theoretical risk — it is a daily UX cost during the entire time the user is on r5.

The "narrow r5" framing treats Tab deferral as cost-free. It is not. The cost is borne by the user every time they press Tab during the r5 evaluation period. The benefit of "narrowness" is a cleaner r5 diff. The cost is a known timing risk on a high-frequency key that persists for another revision cycle.

If the review's priority is "low-risk changes first, evaluate in use," then fixing a known timing risk on Tab is a higher priority than deferring it for conceptual cleanliness. The Tab fix is itself a low-risk change (pure addition at Q-row outer, only cost is losing a duplicate Esc that has two other access paths).

### Re-Evaluated Consensus

Agent 15's consensus map was correct. Agent 16's attempt to tier Tab below `=` and Option C relies on three arguments that do not survive cross-examination:

1. **"Changes Esc backup story"** — only loses a convenience duplicate; primary and combo paths intact
2. **"Enter weakens Tab case"** — backward logic; fixable half of a problem should be fixed, not deferred
3. **"Not Miryoku exact / loses mnemonic"** — Miryoku made the same tradeoff (right-hand placement over mnemonic matching)

**Tab belongs in r5.** The three-change r5 spec from Agent 15 stands:

1. Nav R-bottom: add `LGUI(Z/X/C/V/S)` — zero regressions, same hand as arrows
2. Base R-num outer: backtick → `=`
3. Base L-top outer: duplicate Esc → `KC_TAB`

Each change is independently testable. Each has zero regressions from r4. Each addresses a verified problem. The argument for deferring Tab is weaker at every point than the argument for including it.

## Agent 18 Re-Challenge + Consensus Update

This section challenges the strongest overstatements in Agent 17, keeps the parts that survived cross-examination, and updates the consensus based on where the review chain has actually converged.

### Main Findings

#### 1. Agent 17 makes the strongest case yet for putting `KC_TAB` in `r5`, but "zero regressions" is still too strong

The latest section successfully narrows the anti-Tab case:
- the primary Esc path remains the left thumb
- the `U+I` combo remains available as a backup Esc path
- the Tab issue is fixable now, while the Enter issue is not yet cleanly fixable without a broader thumb rethink

That is enough to move the Q-row `KC_TAB` change much closer to consensus.

But "zero regressions" still overstates it. Replacing the Q-row outer `KC_ESCAPE` with `KC_TAB` does remove a dedicated single-key Esc position. A combo backup is not identical to a dedicated key on every axis:
- it is a chord, not a single key
- it depends on the same hand that may already be busy
- it is less discoverable for cold-start usage than a visible dedicated key

So the right framing is:
- **acceptable tradeoff, likely worth taking**
- not literally **zero regression**

That matters because the review is trying to stay precise about what is fully settled versus what is justified but still a trade.

#### 2. The Q-row `KC_TAB` move is a strong mitigation, not a complete Tab fix

Agent 17 is right that fixing Tab now is better than waiting for a future Enter fix.

But the latest section blurs one important distinction: moving `KC_TAB` to the Q-row outer does **not** eliminate the thumb timing risk by itself. `LGUI_T(KC_TAB)` still exists on the thumb. The benefit comes from changing the preferred way the user will press Tab in normal use, not from removing the risky behavior from the layout.

That means the practical claim should be:
- Q-row `KC_TAB` is the strongest immediate mitigation for the Tab problem
- full cleanup still requires a later decision about the thumb mod-tap itself

This strengthens the case for including Tab in `r5`, but it also means the evaluation plan should be explicit: if `r5` includes Q-row `KC_TAB`, the user should intentionally bias real use toward the new dedicated Tab position when testing the revision.

#### 3. Option C is the best immediate shortcut placement, but still not proven equivalent to Miryoku's exact row choice

Agent 17 is right that Option C inherits the important Miryoku principle:
- put nav-layer `Cmd` shortcuts on the right hand, not on the left

That settles the core architectural dispute. Option C is clearly better than Option A.

But the latest section still pushes too far when it treats R-bottom and Miryoku's R-top as basically interchangeable. Same distance from home is only one dimension. Row choice also carries:
- grouping semantics inside the layer
- transition feel relative to arrows and home-row modifiers
- future consistency if the nav layer is later tightened toward Miryoku conventions

So the correct conclusion is:
- Option C is the best **immediate** implementation choice
- Option B remains the cleaner **structural** reference if a later refinement pass happens

That does not weaken the `r5` recommendation. It just keeps the language accurate.

#### 4. The real consensus has tightened enough that a three-change `r5` is now the leading package

This is where Agent 17 mostly succeeds.

Earlier in the review chain, there was a meaningful gap between:
- `Option C + restore =`
- and `Option C + restore = + Q-row KC_TAB`

After the latest round, that gap is much smaller. The case against Tab now mostly rests on preserving a convenience duplicate of Esc, while the case for Tab is tied to a daily high-frequency workflow key and a known timing annoyance.

That is enough to update the consensus tiering:
- `Option C` is settled enough for `r5`
- restoring `KC_EQUAL` is settled enough for `r5`
- Q-row `KC_TAB` is now strong enough to be treated as the **recommended third change for `r5`**

What still does **not** look settled:
- calling the Tab move regression-free
- treating it as equivalent to a full thumb-risk fix
- claiming R-bottom is ergonomically identical to Miryoku's R-top in all relevant ways

### Consensus Update

#### Strongest Settled Direction

- Miryoku is the conceptual baseline, not the shipped baseline.
- `r4` remains the practical implementation baseline.
- nav-layer `Cmd-Z/X/C/V/S` should move to the **right hand** of the nav layer.
- Option C is the strongest immediate implementation for those shortcuts.
- `KC_EQUAL` should return to the base layer.

#### Recommended `r5` Package

1. Add nav-layer `Cmd-Z/X/C/V/S` on the right bottom row (Option C)
2. Restore `KC_EQUAL` to the base layer
3. Move dedicated `KC_TAB` to the Q-row outer position

#### Still Deferred

- whether the nav shortcuts should later move from R-bottom to Miryoku's exact R-top row
- whether `LGUI_T(KC_TAB)` and `RGUI_T(KC_ENTER)` should both be replaced in a later thumb cleanup revision
- whether duplicate Esc redundancy still deserves a second dedicated position after real `r5` use
- whether `CW_TOGG` is worth adding once the main layout stops moving

### Bottom Line

The review is now close to real consensus.

The strongest current synthesis is no longer just "`Option C + =` and maybe Tab later." It is:
- `r4` as the baseline
- a narrow but meaningful `r5`
- with **Option C + restore = + Q-row Tab** as the leading package

But the language should stay honest:
- the Tab move is a justified tradeoff, not a literal no-regression change
- it is the best immediate mitigation, not the whole thumb-risk solution
- and Option C is the best next step, not proof that Miryoku's exact row no longer matters

---

## Agent 19: Convergence Declaration + r5 Production

This section accepts Agent 18's framing corrections, declares operational convergence, and produces the `main-r5.vil` file.

### Accepting Agent 18's Framing

Agent 18's three corrections are accepted:

1. **Tab is "justified tradeoff" not "zero regressions"** — Correct. A combo backup is not identical to a dedicated key. The tradeoff (losing one dedicated Esc duplicate, gaining a dedicated Tab) is justified but should be stated precisely.

2. **Tab is "mitigation" not "complete fix"** — Correct. `LGUI_T(KC_TAB)` remains on the thumb. The Q-row Tab changes the user's preferred Tab path away from the timing-risk key, but does not remove the risk key. The r5 test plan should explicitly ask the user to bias Tab presses toward the Q-row position.

3. **Option C is "best immediate" not "proven equivalent to R-top"** — Correct. R-bottom and R-top are equidistant from R-home on columnar stagger, but grouping semantics and future consistency matter. Option C is the r5 choice; Option B (R-top, Miryoku exact) remains the structural reference for a potential r6+ nav-layer refinement.

None of these framing corrections change the r5 spec. The three changes are identical in all framings. The review has reached **operational convergence**: all agents agree on the substance; remaining disagreements are about language precision.

### Convergence Declaration

After 19 agent handoffs, the review has converged on a 3-change r5 specification. Every change has been cross-examined against the actual `.vil` data and the Miryoku reference config. The remaining disagreements are about framing language, not about which keys change where.

**r5 Specification (final, verified against r4 data):**

- **Change 1:** Nav Layer 1, Row 8 (R-bottom), cols 1-5: `KC_TRNS` ×5 → `LGUI(KC_Z)`, `LGUI(KC_X)`, `LGUI(KC_C)`, `LGUI(KC_V)`, `LGUI(KC_S)`. Zero displacements. F8-F12 remain on L-bottom unchanged.
- **Change 2:** Base Layer 0, Row 5, Col 0: `KC_GRAVE` → `KC_EQUAL`. Backtick remains on symbol layer (L3 R-top col 5, R-home col 5).
- **Change 3:** Base Layer 0, Row 1, Col 0: `KC_ESCAPE` → `KC_TAB`. Esc primary (thumb) and backup (U+I combo) unchanged. This is a justified tradeoff: losing one Esc duplicate in exchange for a dedicated Tab position that mitigates the `LGUI_T(KC_TAB)` timing risk on a high-frequency key.

**Regressions:** None that fail the 30-second test. One Esc convenience duplicate removed (combo backup remains). Backtick loses base-layer access (symbol-layer access preserved).

**Deferred to r6+:** R-top vs R-bottom nav restructuring (Option B), thumb mod-tap → layer-tap conversion (Enter timing risk), Caps Word, per-key tapping terms, encoder/macro optimization.

### r5 Production

The next step is to produce `vial/main-r5.vil` — not another challenge. The `.vil` file should be derived from `main-r4.vil` with exactly the three changes specified above.

## Agent 20 Re-Challenge + Consensus Update

This section challenges Agent 19's shift from "leading `r5` package" to "operational convergence" and "production." The substance of the proposed `r5` remains strong. The overreach is in declaring the review phase effectively finished.

### Main Findings

#### 1. The document has converged on an `r5` candidate, not on a production verdict

Agent 19 is mostly right about the shape of the next revision:
- Option C is the leading nav-shortcut placement
- restoring `KC_EQUAL` is the strongest settled base-layer fix
- Q-row `KC_TAB` is now the leading third change

That is enough to say the review has converged on a **candidate `r5` package**.

It is not enough to say the review has converged on a **production verdict**.

Why not:
- the document itself still describes the Tab change as a **justified tradeoff**
- it still describes Q-row `KC_TAB` as a **mitigation**, not a full fix
- it still defers the thumb cleanup that would actually retire the risky `LGUI_T(KC_TAB)` / `RGUI_T(KC_ENTER)` pattern

That means the correct state is:
- design consensus: mostly converged
- shipping confidence: not yet proven

Those are different thresholds.

#### 2. "No regressions that fail the 30-second test" is asserted too broadly

Agent 19 says:
- one Esc convenience duplicate is removed
- backtick loses base-layer access
- none of this fails the 30-second test

That claim is directionally plausible, but still stronger than the document has earned.

The problem is not that the tradeoffs are obviously wrong. The problem is that the 30-second test was originally useful as a **backup-access sanity check**, not as a universal proof that a change is operationally neutral. A dedicated single-key Esc and a same-hand combo Esc are not equivalent in all situations:
- terminal interruption flows
- modal editing reflexes
- awkward same-hand moments while the right hand is already occupied

The review can reasonably say the Esc tradeoff looks acceptable enough to test.
It cannot honestly say the regression has already been proven harmless just from the paper analysis.

So the right framing is:
- no regression is severe enough to block an `r5` trial
- some regressions are still real tradeoffs that need actual use validation

#### 3. Agent 19 is right on substance, but too quick to close the challenge loop

The best part of Agent 19 is that it correctly notices the remaining disputes have become narrower and more linguistic.

But "not another challenge" is still too absolute.

There is still one meaningful unresolved layer above the key placements themselves:
- what evidence should upgrade `r5` from candidate to baseline

Without that, "production" just means "we are tired of debating."

The document now needs one final standard that is more concrete than argument quality:
- if the user can use `r5` for real macOS dev work without repeatedly falling back to the thumb Tab
- if the Esc tradeoff does not feel materially worse in terminal/editor workflows
- if the new nav shortcuts actually get used enough to justify their row

then `r5` earns baseline status.

That is the missing bridge between consensus and production.

#### 4. The consensus is strong enough to implement `r5`, but not strong enough to stop qualifying it

This is the most important distinction.

After Agent 19, the consensus is now strong enough for:
- building `main-r5.vil`
- testing it as the next serious iteration
- treating the three-change package as the leading next revision

But it is still not strong enough for:
- claiming the Esc tradeoff is fully settled
- calling the thumb-risk issue resolved
- declaring the review process complete in anything stronger than a practical sense

So the clean synthesis is:
- **Yes:** stop searching for a different `r5` package
- **No:** do not pretend the package is beyond further challenge once used

### Consensus Update

#### Strongest Current Consensus

- `r4` remains the practical baseline before implementation of the next revision.
- the document has converged on a single leading `r5` candidate:
  1. nav-layer `Cmd-Z/X/C/V/S` on the right bottom row (Option C)
  2. restore `KC_EQUAL` to the base layer
  3. move dedicated `KC_TAB` to the Q-row outer position
- this is now the strongest candidate by a meaningful margin; no competing `r5` package has comparable support

#### What Is Now Settled Enough To Do

- produce `main-r5.vil`
- evaluate `r5` in real macOS dev use
- treat the three-change package above as the correct implementation target

#### What Is Still Not Fully Settled

- whether Q-row `KC_TAB` should remain permanent after real use, or proves to be only an interim mitigation
- whether losing the extra dedicated Esc is acceptable in real workflows, not just on paper
- whether Option C should stay put or later migrate toward Miryoku's exact R-top structure
- when and how to replace the remaining thumb GUI mod-taps

### Bottom Line

Agent 19 is right that the review should stop searching for alternative `r5` specs. The document has effectively converged on one.

But the stronger claim should be:
- the review has converged on an **implement-and-test `r5`**
- not on a **production-proven final answer**

That is the most accurate consensus state now.

---

## Agent 21 Implementation Handoff: r6 and r7

This section records the post-`r5` implementation work. The trigger was no longer theoretical debate. It was real use feedback:

- the media layer did not feel directionally coherent
- `F10` was awkward enough to matter in practice
- the layout still was not native to the user's actual macOS dev shortcuts:
  - Rectangle: `Ctrl+Option+Arrow` and `Ctrl+Option+Enter`
  - VS Code terminal: `Ctrl+Shift+\``
  - app switching: `Cmd+Tab`
  - fuzzy search: `Ctrl+R`

That changed the standard. The next revision stopped being "cleanest paper design" and became "best shortcut-native QWERTY for this user."

### r6: Miryoku-Leaning Layer Cleanup

`r6` kept the `r5` base layer intact and fixed the two layers that were clearly underperforming in actual use.

#### r6 Nav Layer Changes

The original `r5` nav/function layer still violated a Miryoku-style principle:
- hold the layer with one hand
- do the work with the other hand

`MO(1)` was still on the left side, but the `F1-F12` block was also left-sided. That is why lower function keys like `F10` felt worse than they looked on paper.

`r6` made the right hand much more Miryoku-like:

- right top row: `LGUI(KC_Z)`, `LGUI(KC_X)`, `LGUI(KC_C)`, `LGUI(KC_V)`, `LGUI(KC_S)`
- right home row: `Right`, `Up`, `Down`, `Left`, `Caps Lock`
- right bottom row: `End`, `Page Up`, `Page Down`, `Home`, `Insert`

This did two things:
- aligned the nav layer more closely with Miryoku's right-hand work pattern
- removed the awkward old "Cmd shortcuts on one row, arrows on another unrelated shape" feeling

#### r6 Media Layer Changes

`r6` also reworked Layer 2 into a media/debug layer instead of a half-media, half-empty utility layer:

- top row: `M4`, `F5`, `F9`, `F10`, `F11`, `F12`
- home row: `Prev`, `Vol-`, `Play`, `Vol+`, `Next`
- bottom row: `Brightness-`, `Mute`, `Brightness+`

This was a deliberate response to the real complaints:
- `F10` needed to become easy
- media direction needed to become coherent instead of arbitrary

The result was better than `r5` for:
- IDE/debug function keys
- media consistency
- general right-hand layer logic

But `r6` still was not truly optimized for the user's actual shortcuts. The main miss remained:
- grave-based shortcuts like `Ctrl+Shift+\`` were still too layered
- Rectangle chords were better, but still not truly thumb-native

### r7: Shortcut-Driven Thumb Rewrite

`r7` is the first revision that explicitly prioritized the user's real macOS dev shortcuts over inherited mod-tap conservatism.

It kept the `r6` nav/media structure and changed only the thumb cluster:

- left outer thumb: `LT1(KC_ESCAPE)`
- left inner thumb: `KC_LGUI`
- right outer thumb: `LT3(KC_GRAVE)`
- right inner thumb: `KC_ENTER`

The old thumb states being replaced were:

- left outer thumb: dedicated `KC_ESCAPE`
- left inner thumb: `LGUI_T(KC_TAB)`
- right outer thumb: `MO(3)`
- right inner thumb: `RGUI_T(KC_ENTER)`

#### Why r7 Is More macOS-Dev Native

This thumb rewrite directly improves the user's named workflows:

- `Cmd+Tab`
  - dedicated left-thumb `Cmd`
  - dedicated Q-row `Tab`
  - no longer depends on a thumb GUI mod-tap

- Rectangle `Ctrl+Option+Arrow`
  - left thumb can hold nav
  - left-hand `Ctrl` / `Option` are available
  - right hand handles arrows

- Rectangle `Ctrl+Option+Enter`
  - left hand handles modifiers
  - right thumb gives dedicated `Enter`

- VS Code terminal `Ctrl+Shift+\``
  - right outer thumb now gives tap backtick directly
  - hold still enters the symbols layer

This is the key shift in philosophy:
- `r5` optimized for consensus and low-risk cleanup
- `r6` optimized for layer coherence
- `r7` optimized for real shortcut throughput

### Why the Earlier Deferrals Were Overridden

The earlier review deferred thumb changes because they were still theoretical and riskier than the settled `r5` package.

That changed once real use exposed specific friction:
- media layer logic was not good enough
- `F10` was not easy enough
- the current thumb behavior was not aligned with actual Mac dev shortcuts

So `r6` and `r7` did not contradict the earlier review. They used the exact evidence the review said was missing:
- actual workflow friction
- concrete shortcut failures
- post-implementation feedback instead of paper argument

### Current Recommendation

`r7` is now the strongest current implementation baseline.

Reason:
- `r5` solved the obvious structural misses
- `r6` fixed the weak nav/media layers
- `r7` finally made the board much more native to the user's real shortcut set

At this point, `r7` is the best candidate to daily-drive.

### Remaining Open Questions

`r7` is stronger, but not beyond further testing. The main things still needing real use validation are:

- whether `LT1(KC_ESCAPE)` feels clean enough in practice
- whether `LT3(KC_GRAVE)` is reliable enough as both backtick tap and symbol hold
- whether the old backup `MO(1)` key should remain as a second nav activator
- whether `Caps Lock` and `Insert` on the nav layer earn their positions
- whether per-key tapping terms are needed once the thumb behavior stabilizes

### Bottom Line

The review should now treat `r7` as the active baseline.

The next step is no longer broad redesign. It is targeted validation of the new thumb behavior and the actual shortcut flows that motivated `r7` in the first place.

---

## Agent 22 Re-Challenge + Post-Implementation Consensus

This section challenges Agent 21's implementation handoff by cross-examining the actual r6 and r7 `.vil` files against the review's prior recommendations, then evaluates how real use feedback changed the consensus.

### Finding 1: r7 Solved Every Timing Risk the Review Identified — and Then Some

The review spent Agents 12-19 debating how to mitigate `LGUI_T(KC_TAB)` and whether to address `RGUI_T(KC_ENTER)`. r7 eliminated both:

| Problem | Agents Spent | r7 Solution |
|---------|-------------|-------------|
| `LGUI_T(KC_TAB)` timing risk | 12-19 (8 agents) | `KC_LGUI` (dedicated Cmd) + `KC_TAB` on Q-row |
| `RGUI_T(KC_ENTER)` timing risk | 13-19 (7 agents) | `KC_ENTER` (dedicated, no mod-tap) |
| `MO(3)` wasted tap | 5-12 (8 agents) | `LT3(KC_GRAVE)` (tap=backtick, hold=symbols) |
| Esc on thumb not layer-tap | 7-19 (13 agents) | `LT1(KC_ESCAPE)` (tap=Esc, hold=Nav) |
| Backtick not on base | 10-13 (4 agents) | `LT3(KC_GRAVE)` gives tap backtick on thumb |

**The r7 thumb cluster is a near-complete Miryoku alignment that the review kept deferring as "too risky for r5."** Real use proved the review was too conservative. The specific frictions (F10 awkwardness, Rectangle chords not being thumb-native, VS Code `Ctrl+Shift+`` being too layered) only became visible after loading r5. The review's abstract risk assessment could not predict these because they are workflow-specific, not layout-theoretic.

**Lesson:** The review correctly identified the structural problems but systematically underestimated the value of fixing them. Every deferred thumb change in r5 turned out to be worth doing immediately once the user encountered real friction. The "risk-adjusted priority order" that the review championed was right about sequencing (nav first) but wrong about how far to push the thumb cleanup in a single revision.

### Finding 2: r7's Nav Layer Is Option B (Miryoku-Aligned), Not Option C (r5)

The review converged on Option C (Cmd shortcuts on R-bottom) for r5 because it was the lowest-risk choice. r7 actually implemented **Option B** (Miryoku-aligned nav restructuring):

```
r7 Nav Layer RIGHT SIDE:
  R-num:  LGUI(Z), LGUI(X), LGUI(C), LGUI(V), LGUI(S)  ← Cmd shortcuts
  R-top:  Right, Up, Down, Left, CapsLock               ← Arrows
  R-home: End, PgUp, PgDn, Home, Insert                 ← Extended nav
  R-bot:  (empty)

Miryoku Nav/Edit RIGHT SIDE:
  R-top:  LGUI(Z), LGUI(X), LGUI(C), LGUI(V), LGUI(S)   ← Cmd shortcuts
  R-home: Right, Up, Down, Left, CapsLock                ← Arrows
  R-bot:  End, PgUp, PgDn, Home, Insert                  ← Extended nav
```

**r7 is one row off from Miryoku's exact placement:** Cmd shortcuts are on R-num instead of R-top. But the overall nav structure follows Miryoku's pattern (arrows on the row below Cmd shortcuts, extended nav on the row below arrows, all on the right hand). This is the "Option B" structural reorganization the review rated as "medium risk" and deferred to r6+.

**Real use validated Option B immediately.** The r5 Option C placement (Cmd shortcuts on R-bottom, below arrows) was structurally correct but ergonomically suboptimal compared to the Miryoku-aligned top-of-right-side placement. The F10 friction was not really about the F-key position — it was about the nav layer's left-side-heavy F-key block violating the "hold with one hand, work with the other" principle that Miryoku enforce.

**The review's risk assessment of Option B was wrong.** Option B was rated "medium risk — reorganizes nav layout" but the reorganization was painless because users had barely learned the old nav layout (r5 was new). The real risk of nav reorganization is proportional to how entrenched the old layout is, not to the abstract amount of change. With a fresh layout, users adapt quickly. The review's risk model treated all structural changes as equally risky regardless of context.

### Finding 3: The F-key Duplication Strategy Is Sound but Underdocumented

r7 has F-keys in TWO places:

| F-key | Nav Layer (MO(1)) | Media Layer (MO(2)) |
|-------|-------------------|---------------------|
| F1-F4 | L-top cols 1-4 | — |
| F5 | L-top col 5 | R-num col 1 |
| F6-F7 | L-home cols 1,5 | — |
| F8 | L-bot col 1 | — |
| F9 | L-bot col 2 | R-num col 2 |
| F10 | L-bot col 3 | R-num col 3 |
| F11 | L-bot col 4 | R-num col 4 |
| F12 | L-bot col 5 | R-num col 5 |

F5 and F9-F12 appear on both layers. This is the user's response to the F10 complaint: put the debug-critical F-keys on the media layer's right side so they're accessible with a right-hand hold, separate from the nav layer's left-side F-key block.

This is a practical solution but the duplication is inconsistent. Why F5 and F9 but not F6-F8? The rationale appears to be: F5 (run/debug) and F9-F12 (step/breakpoint) are the "debug cluster," while F6-F8 are less used. But F8 (step over) is just as critical as F10 (toggle breakpoint) in many debuggers.

**Recommendation:** If the media/debug layer is meant to be the "easy-debug-keys" layer, it should include F5, F8-F12 (or even F1-F12). The current partial duplication covers the user's immediate needs but may create confusion later ("is F8 on the media layer or not?"). This is a minor priority for a future revision.

### Finding 4: r7 Has Dual Nav Activation (MO(1) + LT1) — Deciding When to Remove MO(1)

r7 keeps `MO(1)` on the left home-row outer AND adds `LT1(KC_ESCAPE)` on the left thumb. Both activate the nav layer. The README says MO(1) is "kept as a backup nav activator while the new thumb flow is being tested."

**The review should specify the criteria for removing MO(1).** If `LT1(KC_ESCAPE)` works well after a full evaluation period, MO(1) becomes redundant and frees a valuable base-layer position. But if users find the layer-tap thumb awkward for nav access (because they need to hold it while doing right-hand work), MO(1) remains the superior activation path.

The decision criterion should be: **can the user access all nav-layer functions comfortably using only LT1?** This includes:
- F-keys (left-side reach while thumb holds layer)
- Cmd shortcuts (right-side reach while thumb holds layer)
- Arrow keys (right-side reach while thumb holds layer)

If the answer is yes after 2+ weeks of daily use, MO(1) on L-home outer becomes available for repurposing. Strong candidates: `KC_CAPS` (Caps Lock), `CW_TOGG` (Caps Word), or `KC_LCTRL` (standalone left Ctrl for Rectangle/Vim shortcuts).

### Finding 5: The Left Thumb Space Key Is Wasted in r7

r7 has `KC_SPACE` on BOTH the left inner thumb (col 5) and right inner thumb (col 5). Miryoku uses all six thumb positions for layer-tap. r7 uses only two (LT1, LT3). The remaining four are KC_LGUI, KC_SPACE (left), KC_ENTER, KC_SPACE (right).

Dual Space is a comfort feature (either thumb can space) but on a 54-key board where every position matters, dedicating two positions to Space is a luxury. If the user's typing style allows using one Space thumb consistently:

- **Left thumb Space → `LT2(KC_SPACE)`**: tap Space, hold for media/debug layer. This eliminates the need for MO(2) on L-bot outer, freeing another prime position.
- **Or left thumb Space → `KC_BSPACE`**: gives Backspace a thumb position, removing it from the compressed right bottom row.

This is not a r7-blocking concern. But the review should note it as a potential optimization once the thumb flow stabilizes.

### Post-Implementation Consensus

**r7 is the active baseline.** The review's abstract analysis produced r5; real use feedback produced r6-r7. The gap between them validates Agent 20's concern that "production verdict" and "design consensus" are different thresholds.

**What the review got right:**
- Identifying thumb mod-tap timing risk (LGUI_T/RGUI_T)
- Prioritizing nav-layer Cmd shortcuts
- Restoring `=` to base layer
- Moving Tab to Q-row outer
- Identifying Miryoku's right-hand nav pattern as the structural reference
- Separating backup-access from prime-placement decisions

**What the review got wrong:**
- Rating Option B (Miryoku-aligned nav) as "medium risk" — real use showed it was low risk because the old nav layout was not yet entrenched
- Deferring thumb cleanup to r6+ — the user needed it immediately
- Underestimating how quickly the user would outgrow r5's conservative changes
- Treating F-key placement as an abstract debate rather than a debug-workflow-specific problem

**Open questions for r8+:**
1. Should MO(1) be removed once LT1 is validated?
2. Should the media/debug layer have complete F-key coverage (F1-F12)?
3. Should the left thumb Space become a layer-tap (`LT2`) or Backspace?
4. Is R-num the right row for Cmd shortcuts, or should they move to R-top (Miryoku exact)?
5. Should per-key tapping terms be tuned once the layout stabilizes?

---

## Agent 23 Re-Challenge + Post-r7 Deep Consensus

This section challenges Agent 22's post-implementation analysis by cross-examining r7 against timing risk frameworks the review established, identifying one structural problem r7 carries from r5, and evaluating the total state of convergence after real use feedback.

### Finding 1: LT3(KC_GRAVE) Is Safe — and the Review's Own Framework Proves It

The review spent Agents 5-9 debating `LT3(KC_BSPACE)` as a timing trap. The core concern was: hold-for-repeat-deletion is a common editing behavior, and intercepting it with symbol-layer access creates a real relearn cost.

`LT3(KC_GRAVE)` in r7 is in the same technical class (thumb layer-tap) but has a fundamentally different risk profile. By the review's own framework:

**The "hold intent" test:** When someone holds a key past the tapping term, what did they intend?
- `LT3(KC_BSPACE)`: they intended more deletion. Getting symbol layer = unpredictable interception.
- `LT3(KC_GRAVE)`: they intended... what? Backtick is never "held for repeat." You type ` ``` ` by pressing three times, not by holding. If you hold backtick past 200ms, getting the symbol layer is actually **desirable** — the most common reason to linger on backtick-adjacent territory is to access other symbols (markdown code fences, shell interpolation, template literals).

**Applying the Agent 7 framework:** The review established a two-test approach: 30-second workflow interruption for backup access, and frequency × ergonomic cost for prime placement. `LT3(KC_GRAVE)` passes both:
- 30-second test: losing pure backtick tap for 30 seconds is a mild inconvenience, not a workflow halt
- Frequency × cost: backtick is moderate frequency; the gain of symbol-layer-on-thumb is high (eliminated the `MO(3)` pure-hold that had zero tap value)

**Verdict:** `LT3(KC_GRAVE)` is the safest layer-tap on the board. The review's earlier LT3(BSPACE) concerns do not transfer.

### Finding 2: The Nav Layer Still Has the One-Hand F-Key Problem

r7 reorganized the right side of the nav layer to follow Miryoku's pattern (Cmd shortcuts above arrows above extended nav). This fixed right-hand nav coherence. But the left side of the nav layer still has F1-F12, and the original F10 friction was not really an F10-specific problem — it was a **one-hand problem**.

When the user activates Nav via `LT1(KC_ESCAPE)` (left thumb hold):
- Left thumb is occupied holding the layer
- Left hand must ALSO reach F-keys on L-top/L-home/L-bottom
- This is the same one-hand stretch the review flagged for Option A's L-bottom Cmd shortcuts

When the user activates Nav via `MO(1)` (left pinky hold):
- Left pinky is occupied holding the layer
- Left hand must also reach F-keys — even more awkward

**This is not a new finding.** The user reported F10 as awkward in real use. r7 partially addressed this by adding F5/F9-F12 to the media layer (right side). But the root cause remains: F-keys on the nav layer's left side require one-hand operation.

**The Miryoku solution:** F-keys are on a completely separate layer (their Layer 7), activated by a different thumb (`LT6(KC_DELETE)`, right thumb). This gives clean two-hand F-key access. But r7 only has 4 active layers — there is no room for a dedicated F-key layer without expanding to 5+.

**Practical r8 options:**
1. Move all F-keys to the media layer right side (frees nav left side for other use)
2. Add a 5th layer for F-keys, activated by a new thumb layer-tap (requires using one of the two Space positions)
3. Accept the current state: F-keys on nav left side, with the media-layer duplicates providing the "easy" access for F5/F9-F12

Option 3 (current state) is workable if the left-hand F-key reach is tolerable. The media-layer duplicates cover the most critical debug keys. This may be sufficient for the user's workflow.

### Finding 3: r7 Put Cmd Shortcuts on the Hardest-to-Reach Right-Side Row

r7 put `LGUI(Z/X/C/V/S)` on R-num (the number row, Row 5). Miryoku puts them on R-top (the top alpha row, Row 6). In the physical keyboard layout, R-num is the topmost row — the one farthest from the resting finger positions. R-top is one row closer to home row.

This is a genuine ergonomic downgrade from Miryoku's placement. The review's earlier Option C (R-bottom, Row 8) was also suboptimal but for a different reason (bottom row instead of number row). None of r5/r7's shortcut placements match Miryoku's R-top (Row 6) choice.

The likely reason r7 used R-num: when the nav layer is active, R-num is the topmost available row (it's `KC_TRNS`/`KC_NO` in the nav layer, so it's "empty" for new keys). But R-top was also reorganized for arrows. So r7 put arrows on R-top and Cmd shortcuts got pushed up to R-num.

**The correct Miryoku placement is:** Cmd shortcuts on R-top (Row 6), arrows on R-home (Row 7), extended nav on R-bot (Row 8). This puts Cmd shortcuts on the most ergonomic right-side row and arrows on the home row where fingers rest naturally.

**r7 has arrows between Cmd shortcuts (R-num) and extended nav (R-home), putting arrows on R-top (Row 6) instead of R-home (Row 7).** This means arrows are one row above home, which requires an upward stretch. Miryoku puts arrows ON the home row, which is the most comfortable reach.

**Recommendation for r8:** If the nav layer is reorganized to put arrows on R-home (Miryoku exact), Cmd shortcuts can move to R-top, and extended nav stays on R-bot. This is a one-row shift that puts every function on its optimal ergonomic row:

```
Current r7:           Miryoku-aligned r8:
R-num: Cmd shortcuts  R-num: (available)
R-top: Arrows         R-top: Cmd shortcuts
R-home: Ext nav       R-home: Arrows + Caps
R-bot: (empty)        R-bot: Ext nav
```

This requires only reorganizing the right side of the nav layer — no base-layer or thumb changes. Low risk if the current nav layout isn't yet entrenched.

### Finding 4: The Primary Usability Test for r7 Is LT1 Accidental Trigger

The single most important validation test for r7 is: **does the user accidentally activate Nav when trying to press Esc?**

`LT1(KC_ESCAPE)` means: quick press = Esc, hold 200ms+ = Nav layer. If the user presses Esc with enough force or delay to exceed the tapping term, the entire keyboard remaps to the nav layer. This is disorienting — suddenly every key does something different.

The tapping term is 200ms. For comparison:
- A fast keystroke is about 50-80ms
- A deliberate keystroke is about 100-150ms
- A slow/fatigued keystroke can exceed 200ms

During the first week of r7 use, the user should monitor: how often do they accidentally trigger Nav when pressing Esc? If it happens frequently, the tapping term should be increased (220-250ms for the LT1 key specifically, if per-key timing is available in Vial).

The U+I combo provides a fallback Esc path if LT1 proves unreliable. This is the same "backup access" pattern the review established for Esc throughout the discussion.

### Consensus Evaluation (r7 Baseline)

#### Settled by Implementation + Real Use

1. r7 thumb cluster is correct: zero GUI mod-taps, dedicated Cmd/Enter, layer-tap for Esc and Grave
2. `=` belongs on the base layer, not backtick
3. `KC_TAB` belongs on Q-row outer (Miryoku matches)
4. Nav Cmd shortcuts belong on the right hand, not the left
5. Media layer is a better home for debug-critical F-keys than the nav layer

#### Settled in Principle, Awaiting Validation

6. `LT1(KC_ESCAPE)` is the correct architecture — but the 200ms tapping term may need per-key adjustment
7. `LT3(KC_GRAVE)` is safe (confirmed by the review's own timing risk framework)
8. `MO(1)` should eventually be removed once `LT1` proves reliable

#### Open for r8+

9. Nav layer right-side row alignment (arrows on R-home vs R-top)
10. Cmd shortcuts on R-num vs R-top (Miryoku exact)
11. F-key layer architecture (nav left-side vs dedicated layer vs media-only)
12. Left thumb Space vs `LT2` layer-tap vs `KC_BSPACE`
13. Per-key tapping terms once layout stabilizes

---

## Agent 24 Implementation Note: r8 Media Alignment

This section records a narrow post-`r7` correction driven by immediate live feedback.

### Trigger

After loading `r7`, the user reported that the media layer still did not feel coherent:

- the media keys still did not "make much sense"
- the directional story for volume and brightness still felt wrong
- the obvious comparison point was Miryoku's media layer

That is a materially different complaint from the earlier shortcut-native `r7` work. It does not challenge the new thumb strategy. It challenges only the media/debug layer organization.

### r8 Change

`r8` keeps the entire `r7` base/thumb structure intact and changes only Layer 2.

The previous `r7` media/debug layout used:

- debug F-keys on the top row
- transport and volume on the upper alpha row
- brightness and mute on the home row

That worked functionally, but it was still an ad hoc cluster rather than a convention-driven one.

`r8` replaces the transport/volume cluster with an explicit Miryoku-style mapping:

- right home row: `Next`, `Volume Up`, `Volume Down`, `Previous`
- right thumbs: `Stop`, `Play/Pause`, `Mute`

Brightness is no longer mixed into the transport row. It moves to its own lower row, and the debug F-key row stays intact.

### Why r8 Is Better

The reason for `r8` is simple:

- `r7` was more shortcut-native than `r6`
- but its media row was still custom enough to feel arbitrary
- if the goal is "state-of-the-art QWERTY" rather than "my latest improvisation," the obvious move is to stop improvising where Miryoku already has a good pattern

So `r8` is not a philosophical reversal. It is a cleanup of the one remaining layer that was still fighting an established standard without enough justification.

### Current Baseline

Treat `r8` as the active implementation baseline now.

`r7` remains important as the shortcut-driven thumb rewrite.
`r8` is simply `r7` plus a better media layer.

---

## Agent 25 Implementation Handoff: r9 Window/Dev Rewrite

This section records the first revision that stops treating media as a first-class design problem and instead centers the board around the user's real macOS dev shortcuts.

### Trigger

After trying `r8`, the user reported that the bigger problem was not "are the media keys more Miryoku-like?" but "is this layout actually optimized for the shortcuts I use all day?"

The concrete workflows called out were:

- Rectangle with `Ctrl` + `Option` + direction / `Enter`
- VS Code terminal with `Ctrl` + `Shift` + `` ` ``
- fuzzy-search with `Ctrl` + `R`
- debugger keys, especially `F10`

That is a different priority order from `r8`. It implies:

- media should be demoted
- a real window/dev layer should exist
- the layer story should move closer to Miryoku's thumb-first logic

### r9 Changes

`r9` keeps the successful `r7`/`r8` base assumptions:

- QWERTY base
- Q-row `Tab`
- dedicated `Cmd`
- dedicated `Enter`
- tap grave / hold symbols on the right outer thumb
- tap `Esc` / hold nav on the left outer thumb

The structural changes are:

1. `KC_SPACE` on the left thumb becomes `LT2(KC_SPACE)`.
2. `MO(2)` is removed from the base layer.
3. Base left bottom outer becomes `M4` screenshot.
4. Layer 1 right hand is shifted into the Miryoku row pattern:
   - top alpha row: `Cmd-Z/X/C/V/S`
   - home row: arrows plus `Caps Lock`
   - bottom row: `End/PgUp/PgDn/Home/Insert`
5. Layer 2 is rebuilt as a **Window / Dev** layer:
   - top alpha row: terminal macro, fuzzy-search macro, `F5`, `F9`, `F10`
   - home row: direct Rectangle right / up / down / left / enter macros
   - bottom row: `F11`, `F12`, `Vol-`, `Vol+`, `Mute`
   - right thumbs: `Prev`, `Play`, `Next`
   - left lower row: `Brightness-`, `Brightness+`

### Important Compromise

`r9` is more Miryoku-like, but not dogmatic.

The main deliberate compromise is that `MO(1)` remains on the base left home-row outer key as a backup hold. That key is no longer the primary way into navigation. The primary path is `LT1(KC_ESCAPE)`. `MO(1)` stays because it preserves practical same-hand access to the left-side `F1` to `F12` block.

So the rule in `r9` is:

- thumbs are the primary layer story
- one outer-column backup remains because it solves a real problem cleanly

### Why r9 Is Better

`r9` is the first version that fully accepts that the user's most important secondary layer is not "media" but "window/dev."

That makes the layer hierarchy much cleaner:

- `Layer 1`: nav/edit/function
- `Layer 2`: window/dev/debug
- `Layer 3`: symbols

It also makes the board more Miryoku-like in the right way:

- more thumb-first access
- more opposite-hand work
- clearer one-row-per-job structure on the active right hand

And unlike the earlier review debate, `r9` does not ask the user to preserve default Rectangle chords as sacred. It simply gives those actions first-class keys.

### Remaining Validation Risks

The biggest live question is now `LT2(KC_SPACE)`.

This is the highest-risk new change in `r9`, because it reintroduces a Space thumb layer-tap after the document spent a long time being cautious about that pattern. The reason it is justified now is that the user explicitly prioritized stronger Miryoku conventions and cleaner workflow access over the earlier conservative hybrid approach.

The things that still need real use:

- whether `LT2(KC_SPACE)` feels clean in normal typing
- whether the direct Rectangle macros are better than modifier-plus-arrow chording in practice
- whether `Ctrl+Shift+\`` and `Ctrl+R` deserve permanent macro slots
- whether `MO(1)` still earns its keep once `LT1` and `LT2` become automatic

### Current Baseline

Treat `r9` as the active implementation baseline now.

`r8` was the best "shortcut-native plus cleaner media" hybrid.
`r9` is the first layout that clearly puts dev workflow above media design and moves the layer model closer to a genuine QWERTY Miryoku-lite.
