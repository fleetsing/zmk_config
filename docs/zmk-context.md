# zmk_config context

This is the repo-local summary for the Totem `zmk_config` repository.

When this repo is used inside the full local multi-repo workspace, the canonical project-level agent context is:

- [../zmk_workspace/docs/project-context.md](/Users/jarnolouhelainen/Projects/keyboards/zmk/zmk_workspace/docs/project-context.md)

## Purpose

This repo is the day-to-day buildable ZMK user-config repo for the Totem keyboard.

## Current pins and targets

- ZMK ref: `v0.3`
- GitHub build workflow pin: `v0.3`
- Totem module repo: `bildermankawasaki/zmk-keyboard-TOTEM`
- Board: `seeeduino_xiao_ble`
- Shields:
  - `totem_left`
  - `totem_right`

## Editable files in this repo

- `build.yaml`
- `config/west.yml`
- `config/totem.keymap`
- `config/totem_left.conf`
- `config/totem_right.conf`
- `config/totem.json`
- `.github/workflows/build.yml`
- `.github/workflows/draw-keymaps.yml`
- `keymap_drawer.config.yaml`

## Policy

- Keep `config/totem.keymap` as the editor-safe keymap surface.
- Keep layout metadata in `config/totem.json`.
- Prefer GitHub Actions for routine firmware builds.
- Keep reusable advanced logic out of this repo when it belongs in a module.

## Local build reminder

Use the sibling workspace helper:

```bash
cd ~/zmk/zmk_workspace
./scripts/build-local-firmware.sh all
```

That helper mirrors this repo into a disposable west workspace under `/tmp/zmk-local-build` by default, so local verification does not leave `.west/` state behind here.
