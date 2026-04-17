---
name: local-build
description: Use this when a task needs a local ZMK build, especially for CI debugging, external module work, or verifying a Totem configuration change against the local upstream ZMK checkout.
---

## Purpose

Run or propose the correct local build commands against the pinned upstream ZMK checkout.

## Assumptions

- Upstream checkout lives at `~/zmk/zmk`
- User config repo lives at `~/zmk/zmk_config`
- Optional module repo lives at `~/zmk/zmk_modules`

## Canonical commands

### Prepare local checkout
```bash
cd ~/zmk/zmk
python3 -m venv .venv
source .venv/bin/activate
pip install west
west init -l app/
west update
west zephyr-export
west packages pip --install
```

### Build Totem left
```bash
cd ~/zmk/zmk/app
west build -d build/totem-left -b seeeduino_xiao_ble -- \
  -DSHIELD=totem_left \
  -DZMK_CONFIG="$HOME/zmk/zmk_config/config"
```

### Build Totem left with extra modules
```bash
cd ~/zmk/zmk/app
west build -d build/totem-left -b seeeduino_xiao_ble -- \
  -DSHIELD=totem_left \
  -DZMK_CONFIG="$HOME/zmk/zmk_config/config" \
  -DZMK_EXTRA_MODULES="$HOME/zmk/zmk_modules"
```

Repeat for the right half by replacing `totem_left` with `totem_right`.

## Notes

- Do not change version pins unless the task explicitly asks for an upgrade or the build evidence proves a mismatch.
- When a build breaks because of reusable advanced logic, prefer moving that logic into a module repo under `~/zmk/zmk_modules`.
- In the full multi-repo workspace, `~/zmk/zmk_workspace` is the main agent entrypoint even though the build inputs live here.
