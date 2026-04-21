# zmk_config

This repository is the buildable ZMK user-config repo for the Totem keyboard.

## Owns

- `build.yaml`
- `config/west.yml`
- `config/totem.keymap`
- `config/totem_left.conf`
- `config/totem_right.conf`
- `config/totem.json`
- GitHub Actions workflows for firmware builds and keymap drawing

## Does not own

- upstream ZMK source
- project-wide agent docs
- reusable out-of-tree behaviors, drivers, or shield logic

Those belong in sibling repos:

- `../zmk`
- `../zmk_workspace`
- `../zmk_modules/*`

## Tooling

- firmware build: pinned reusable ZMK GitHub Actions workflow
- visual editor: Nick Coutsos' Keymap Editor
- diagrams: `caksoylar/keymap-drawer`

## Current keymap shape

- `config/totem.keymap` is the maintained editor-safe source for the live Totem layout.
- The current layout defines ten layers: `MacOS`, `PC`, `Nav`, `Nav `, `Num`, `Num `, `Fun`, `Fun `, `Media`, and `Board`.
- `PC` plus `Nav `, `Num `, and `Fun ` are transparent overlays used to swap the relevant GUI and Control holds for PC usage without duplicating whole layers.
- Custom `Meh` and `Hyper` macros and the left/right positional hold-tap helpers are currently defined inline in the keymap rather than split into a separate module.

## Local verification

When this repo is part of the full local workspace, run local firmware builds from `../zmk_workspace`:

```bash
cd ../zmk_workspace
./scripts/build-local-firmware.sh all
```

That keeps disposable west state out of this repository and copies the flashable UF2 files into `../zmk_workspace/artifacts/firmware/`.

## Host-side status apps

- Battery monitoring notes for the current macOS setup live in [docs/battery-monitoring.md](/Users/jarnolouhelainen/Projects/keyboards/zmk/zmk_config/docs/battery-monitoring.md).

## Note

When working in the full local multi-repo setup, the canonical project-level context lives in [../zmk_workspace/docs/project-context.md](/Users/jarnolouhelainen/Projects/keyboards/zmk/zmk_workspace/docs/project-context.md).
