#!/bin/bash
#
# Confirm Letter Tool — Updater
# Pulls the latest version and reinstalls
#

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

echo ""
echo "============================================"
echo "  Confirm Letter Tool — Updater"
echo "============================================"
echo ""

# Show current installed version
INSTALLED_VERSION="unknown"
if [ -f "$HOME/.claude/.confirm-tool/installed-version" ]; then
    INSTALLED_VERSION=$(cat "$HOME/.claude/.confirm-tool/installed-version")
fi
echo "Currently installed: v${INSTALLED_VERSION}"

# Pull latest from git
echo "Pulling latest version..."
cd "$SCRIPT_DIR"

if git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    git pull origin main
else
    echo "WARNING: This directory is not a git repo."
    echo "If you downloaded this as a zip, please re-download the latest version."
    echo "Then run ./install.sh again."
    exit 1
fi

NEW_VERSION=$(cat "$SCRIPT_DIR/VERSION")
echo "Latest version: v${NEW_VERSION}"

if [ "$INSTALLED_VERSION" = "$NEW_VERSION" ]; then
    echo ""
    echo "You're already on the latest version. No update needed."
    echo ""
    exit 0
fi

# Reinstall
echo "Installing update..."
"$SCRIPT_DIR/install.sh"

echo ""
echo "Updated from v${INSTALLED_VERSION} to v${NEW_VERSION}"
echo ""
