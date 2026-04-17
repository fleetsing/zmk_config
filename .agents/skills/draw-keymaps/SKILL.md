---
name: draw-keymaps
description: Use this when a task changes ZMK keymap layers, combos, legends, or diagram paths. Update the keymap-drawer workflow and related config if needed, and verify that output paths still match the repo conventions.
---

## Purpose

Keep the visualization path in sync with the keymap.

## Checklist

1. Inspect:
   - `config/*.keymap`
   - `.github/workflows/draw-keymaps.yml`
   - `keymap_drawer.config.yaml`
   - `keymap-drawer/`
2. If filenames or paths changed, update the workflow inputs.
3. Prefer the reusable `caksoylar/keymap-drawer` workflow pattern already checked into this repo.
4. Keep generated output under `keymap-drawer/` unless explicitly changing the convention.
5. Summarize any diagram-impacting changes in plain language.
