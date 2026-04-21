# ZMK config repo

## Source of truth
- `build.yaml`
- `config/west.yml`
- `config/totem.keymap`
- `config/totem_left.conf`
- `config/totem_right.conf`
- `config/totem.json`
- `docs/zmk-context.md`

If this repo is part of the local multi-repo workspace, read `../zmk_workspace/docs/project-context.md` first for the project-wide operating model.

## Repo rules
- `config/totem.keymap` is the editor-safe keymap surface.
- Keep low-level board, module, and build wiring out of the keymap when possible.
- Avoid introducing heavy preprocessor macro layers into `config/totem.keymap`.
- If a new feature becomes reusable or editor-hostile, move it into a module repo under `../zmk_modules`.
- Do not upgrade ZMK, module refs, or the pinned reusable build workflow unless explicitly asked.
- Keep diagram paths stable unless there is a good reason to change them.
- Update `docs/zmk-context.md` whenever repo-local build conventions, pins, or commands change.
- Prefer `../zmk_workspace/scripts/build-local-firmware.sh` for local verification instead of creating a west workspace inside this repo.
- Expect that helper to copy the finished UF2 files into `../zmk_workspace/artifacts/firmware/` by default.

## Verification expectations
- Explain which files changed and why.
- Call out any implications for Keymap Editor compatibility.
- Call out any implications for GitHub Actions builds or local builds.
- If the keymap changed, make sure the diagram workflow still matches the file locations.
