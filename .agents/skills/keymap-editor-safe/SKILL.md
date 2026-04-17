---
name: keymap-editor-safe
description: Use this when a task changes the editor-facing ZMK keymap and should remain friendly to Nick Coutsos' Keymap Editor. Focus on keeping `config/totem.keymap` round-trippable and preserving local keyboard metadata in `config/totem.json`.
---

## Purpose

Protect the hybrid workflow: raw source for advanced work, Keymap Editor for safe visual edits.

## Rules

- Keep `config/totem.keymap` as the plain, editor-safe surface.
- Prefer direct devicetree bindings over heavy preprocessor alias layers.
- Keep advanced reusable logic in module repos when it stops being pleasant in the main keymap.
- Keep `config/totem.json` present and local so layout metadata does not depend on external repository discovery.
- If a change would make editor round-tripping fragile, say so explicitly.

## Good outcomes

- Layers, combos, and common macros remain readable in the editor.
- Low-level build/module wiring stays outside the keymap.
- The repo can still use local source editing and keymap-drawer without giving up the editor.
