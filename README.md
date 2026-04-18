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

## Local verification

When this repo is part of the full local workspace, run local firmware builds from `../zmk_workspace`:

```bash
cd ../zmk_workspace
./scripts/build-local-firmware.sh all
```

That keeps disposable west state out of this repository.

## Note

When working in the full local multi-repo setup, the canonical project-level context lives in [../zmk_workspace/docs/project-context.md](/Users/jarnolouhelainen/Projects/keyboards/zmk/zmk_workspace/docs/project-context.md).
