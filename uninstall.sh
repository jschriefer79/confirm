#!/bin/bash
#
# Confirm Letter Tool — Uninstaller
# Removes the /confirm slash command from Claude Code
#

echo ""
echo "============================================"
echo "  Confirm Letter Tool — Uninstaller"
echo "============================================"
echo ""

COMMANDS_DIR="$HOME/.claude/commands"

if [ -f "$COMMANDS_DIR/confirm.md" ]; then
    rm "$COMMANDS_DIR/confirm.md"
    echo "Removed: $COMMANDS_DIR/confirm.md"
else
    echo "Skill file not found at $COMMANDS_DIR/confirm.md — nothing to remove."
fi

if [ -d "$HOME/.claude/.confirm-tool" ]; then
    rm -rf "$HOME/.claude/.confirm-tool"
    echo "Removed version tracking data."
fi

echo ""
echo "Uninstall complete. The /confirm command has been removed."
echo ""
