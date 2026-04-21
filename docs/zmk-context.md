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

## Current keymap shape

- `config/totem.keymap` currently defines ten layers:
  `MacOS`, `PC`, `Nav`, `Nav `, `Num`, `Num `, `Fun`, `Fun `, `Media`, and `Board`.
- `PC` is a transparent base overlay that swaps the relevant GUI and Control home-row holds for PC use.
- `Nav `, `Num `, and `Fun ` are transparent PC-specific overlays that are activated through conditional layers when `PC` is combined with `Nav`, `Num`, or `Fun`.
- The keymap keeps its custom behavior definitions inline today: `Meh` and `Hyper` macros plus six positional hold-tap helpers for left/right home-row mods and left/right bottom-row `Meh`/`Hyper`.
- All of those hold-tap helpers currently share the same tuning style: `balanced`, `quick-tap-ms = 175`, `require-prior-idle-ms = 150`, `retro-tap`, and `hold-trigger-on-release`.
- `config/totem_left.conf` now carries the central-side BLE battery reporting settings used for host-side monitoring apps in addition to disabling USB logging.
- `config/totem_right.conf` disables USB and the USB device stack for the peripheral half.

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
- `docs/battery-monitoring.md`

## Policy

- Keep `config/totem.keymap` as the editor-safe keymap surface.
- Keep layout metadata in `config/totem.json`.
- Prefer GitHub Actions for routine firmware builds.
- Keep reusable advanced logic out of this repo when it belongs in a module.
- Keep the transparent PC overlay pattern readable instead of hiding it behind preprocessor aliases.

## Local build reminder

Use the sibling workspace helper:

```bash
cd ~/zmk/zmk_workspace
./scripts/build-local-firmware.sh all
ZMK_SKIP_UPDATE=1 ZMK_SKIP_PIP=1 ./scripts/build-local-firmware.sh all
ZMK_ARTIFACT_DIR=$PWD/firmware ./scripts/build-local-firmware.sh all
```

That helper mirrors this repo into a disposable west workspace under `${TMPDIR:-/tmp}/zmk-local-build` by default, so local verification does not leave `.west/` state behind here.
It also copies the finished UF2 files into `~/zmk/zmk_workspace/artifacts/firmware/` by default so the flashing artifacts stay easy to reach.

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
