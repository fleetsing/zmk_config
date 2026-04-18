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

## Layout and platform context

- Totem uses a split, finger-splayed `3x5+3` core with one extra outer pinky key on each half.
- The logical matrix order in `config/totem.keymap` is important for positional hold-tap features such as home-row mods.
- The current default host OS is macOS, so modifier choices should favor macOS shortcut ergonomics unless a task explicitly targets a separate PC config.

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
ZMK_SKIP_UPDATE=1 ZMK_SKIP_PIP=1 ./scripts/build-local-firmware.sh all
```

That helper mirrors this repo into a disposable west workspace under `/tmp/zmk-local-build` by default, so local verification does not leave `.west/` state behind here.

In restricted sessions, the first helper run needs network access so west can fetch the pinned dependencies into that disposable workspace. After the workspace has already been populated, `ZMK_SKIP_UPDATE=1` can be used for rebuilds without refetching.
If the disposable virtualenv already has the required Python packages installed, `ZMK_SKIP_PIP=1` can also be used to skip pip refreshes in offline or network-restricted sessions.

## Expected warnings on the pinned stack

The current pinned ZMK and Zephyr versions may still emit a few known non-blocking warnings.

- `NRF_STORE_REBOOT_TYPE_GPREGRET` deprecated:
  This comes from upstream ZMK defaults for nRF52 on the pinned firmware version.
- Devicetree `label` deprecation warnings:
  These are currently tied to board or module devicetree usage, not normal keymap edits.
- Devicetree `duplicate unit-address` warnings:
  These are exposed once local `dtc` is installed and come from generated DTS content in the pinned board or module stack, not from ordinary keymap work.
- RWX `LOAD segment` linker warnings:
  These come from the embedded linker/toolchain path and are not currently actionable within repo-local keymap work.

Treat new warnings outside this list as worth investigating.
