---
name: local-build
description: Use this when a task needs a local ZMK build, especially for CI debugging, external module work, or verifying a Totem configuration change against the local upstream ZMK checkout.
---

## Purpose

Run or propose the correct local build commands against the pinned config manifest without turning this repo into a west workspace.

## Assumptions

- Main agent repo lives at `~/zmk/zmk_workspace`
- User config repo lives at `~/zmk/zmk_config`
- Upstream checkout lives at `~/zmk/zmk`
- Optional module repos live under `~/zmk/zmk_modules`

## Canonical commands

### Build both halves
```bash
cd ~/zmk/zmk_workspace
./scripts/build-local-firmware.sh all
```

### Build one half
```bash
cd ~/zmk/zmk_workspace
./scripts/build-local-firmware.sh left
./scripts/build-local-firmware.sh right
```

### Reuse an existing fetched disposable workspace
```bash
cd ~/zmk/zmk_workspace
ZMK_SKIP_UPDATE=1 ./scripts/build-local-firmware.sh all
```

## Notes

- Do not change version pins unless the task explicitly asks for an upgrade or the build evidence proves a mismatch.
- When a build breaks because of reusable advanced logic, prefer moving that logic into a module repo under `~/zmk/zmk_modules`.
- In the full multi-repo workspace, `~/zmk/zmk_workspace` is the main agent entrypoint even though the build inputs live here.
- Prefer the disposable helper over running `west init` inside `~/zmk/zmk_config`.
