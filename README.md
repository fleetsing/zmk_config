# zmk_config

This repository is the buildable ZMK user-config repo for the Totem keyboard.

## Owns

- `build.yaml`
- `config/west.yml`
- `config/totem.keymap`
- `config/totem_left.conf`
- `config/totem_right.conf`
- `config/totem.json`
- `config/totem.conf.example`
- `config/totem.keymap.example`
- GitHub Actions workflows for firmware builds and keymap drawing
- `keymap_drawer.config.yaml`
- `keymap-drawer/`
- repo-local docs and helper scripts under `docs/` and `scripts/`

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
- The current layout defines thirteen layers: `MacOS`, `PC`, `Nav`, `Nav `, `AutoNav`, `Num`, `Num `, `AutoNum`, `Fun`, `Fun `, `Media`, `Mouse`, and `Board`.
- `PC` plus `Nav `, `Num `, and `Fun ` are transparent overlays used to swap the relevant GUI and Control holds for PC usage without duplicating whole layers.
- `AutoNav` and `AutoNum` are combo-driven auto layers used for navigation/editing and number entry flows that self-cancel once typing leaves their continue lists.
- Dedicated `Media`, `Mouse`, and `Board` layers handle host controls, pointer actions, and Bluetooth/output management.
- Custom `Meh` and `Hyper` macros, home-row and bottom-row positional hold-taps, combo helpers, and transparent-hold helpers are currently defined inline in the keymap rather than split into a separate module.
- `config/totem_left.conf` is the central-side `.conf` and carries the split battery reporting settings used by host-side monitoring apps.

## Local verification

When this repo is part of the full local workspace, run local firmware builds from `../zmk_workspace`:

```bash
cd ../zmk_workspace
./scripts/build-local-firmware.sh all
```

That keeps disposable west state out of this repository and copies the flashable UF2 files into `../zmk_workspace/artifacts/firmware/`.

Useful variants:

```bash
./scripts/build-local-firmware.sh left
./scripts/build-local-firmware.sh right
ZMK_SKIP_UPDATE=1 ./scripts/build-local-firmware.sh all
ZMK_SKIP_UPDATE=1 ZMK_SKIP_PIP=1 ./scripts/build-local-firmware.sh all
```

## Supporting files

- `config/totem.conf.example` and `config/totem.keymap.example` are starter templates, not the live build inputs.
- `scripts/update-totem-json.sh` refreshes `config/totem.json` from the current Keymap Editor contrib source.
- `keymap_drawer.config.yaml` and `keymap-drawer/` define and store the generated layer diagrams derived from `config/totem.keymap`.

## Host-side status apps

- Battery monitoring notes for the current macOS setup live in [docs/battery-monitoring.md](/Users/jarnolouhelainen/Projects/keyboards/zmk/zmk_config/docs/battery-monitoring.md).

## Note

When working in the full local multi-repo setup, the canonical project-level context lives in [../zmk_workspace/docs/project-context.md](/Users/jarnolouhelainen/Projects/keyboards/zmk/zmk_workspace/docs/project-context.md).
