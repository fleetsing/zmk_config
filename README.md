# zmk_config

This repository is the buildable ZMK user-config repo for the Totem keyboard.

## Owns

- `build.yaml`
- `config/west.yml`
- `config/totem.keymap`
- `config/totem.conf`
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

## Note

When working in the full local multi-repo setup, the canonical project-level context lives in [../zmk_workspace/docs/project-context.md](/Users/jarnolouhelainen/Projects/keyboards/zmk/zmk_workspace/docs/project-context.md).
