# ZMK config repo

## Source of truth
- `build.yaml`
- `config/west.yml`
- `config/totem.keymap`
- `config/totem_left.conf`
- `config/totem_right.conf`
- `config/totem.json`
- `.github/workflows/build.yml`
- `.github/workflows/draw-keymaps.yml`
- `keymap_drawer.config.yaml`
- `scripts/update-totem-json.sh`
- `docs/zmk-context.md`
- `docs/battery-monitoring.md`

If this repo is nested in the local `zmk_workspace` checkout, read `../docs/project-context.md` first for the project-wide operating model.
Shared agent skills live in `../.agents/skills/`, so prefer starting agent sessions from the workspace root. This file and the docs it lists apply to every coding agent; keep tool-specific folders out of this repo unless a tool needs repo-local settings.

## Repo rules
- `config/totem.keymap` is the editor-safe keymap surface.
- Keep low-level board, module, and build wiring out of the keymap when possible.
- Avoid introducing heavy preprocessor macro layers into `config/totem.keymap`.
- If a new feature becomes reusable or editor-hostile, move it into a module repo under `../zmk_modules`.
- Do not upgrade ZMK, module refs, or the pinned reusable build workflow unless explicitly asked.
- Keep diagram paths stable unless there is a good reason to change them.
- Update `docs/zmk-context.md` whenever repo-local build conventions, pins, or commands change.
- Update `docs/battery-monitoring.md` if the central side, BLE battery settings, or the recommended host-side battery app changes.
- Prefer `../scripts/build-local-firmware.sh` for local verification instead of creating a west workspace inside this repo.
- Expect that helper to copy the finished UF2 files into `../artifacts/firmware/` by default.
- Treat `config/totem.conf.example` and `config/totem.keymap.example` as templates, not live build inputs.
- If the physical layout metadata changes, keep `config/totem.json`, `scripts/update-totem-json.sh`, and the keymap-drawer outputs aligned.

## Verification expectations
- Explain which files changed and why.
- Call out any implications for Keymap Editor compatibility.
- Call out any implications for GitHub Actions builds or local builds.
- If the keymap changed, make sure the diagram workflow still matches the file locations and generated `keymap-drawer/` outputs remain derivable from the documented inputs.
