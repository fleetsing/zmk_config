#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
TARGET="$REPO_ROOT/config/totem.json"
URL="https://raw.githubusercontent.com/nickcoutsos/keymap-editor-contrib/main/keyboard-data/totem.json"

curl -fsSL "$URL" -o "$TARGET"
echo "Updated $TARGET"
