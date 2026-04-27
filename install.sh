#!/bin/bash
#
# Confirm Letter Tool — Installer
# Installs the /confirm slash command for Claude Code
#

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
VERSION=$(cat "$SCRIPT_DIR/VERSION")

echo ""
echo "============================================"
echo "  Confirm Letter Tool — Installer v${VERSION}"
echo "============================================"
echo ""

# Install location: global commands directory so /confirm works in any project
COMMANDS_DIR="$HOME/.claude/commands"

echo "This will install the /confirm command for Claude Code."
echo ""
echo "Skill install location:   $COMMANDS_DIR"
echo ""

# Create directory if it doesn't exist
mkdir -p "$COMMANDS_DIR"

# Copy the skill file
cp "$SCRIPT_DIR/confirm.md" "$COMMANDS_DIR/confirm.md"
echo "Installed: $COMMANDS_DIR/confirm.md"

# Save version info for update checks
mkdir -p "$HOME/.claude/.confirm-tool"
echo "$VERSION" > "$HOME/.claude/.confirm-tool/installed-version"
echo "$SCRIPT_DIR" > "$HOME/.claude/.confirm-tool/repo-path"

# Check for python-docx dependency
echo ""
echo "Checking dependencies..."
if python3 -c "import docx" 2>/dev/null; then
    echo "  python-docx: installed"
else
    echo "  python-docx: not found — installing..."
    pip3 install python-docx
    echo "  python-docx: installed"
fi

# Friendly heads-up about the optional Dropbox folder
echo ""
echo "Optional power-up — Guru Wiki access:"
if [ -d "$HOME/Dropbox/AIVault/Guru Wikis" ]; then
    echo "  Dropbox AIVault Guru Wikis folder detected ✓"
    echo "  /confirm will use it automatically as Tier 1 for editor credibility."
else
    echo "  Dropbox AIVault Guru Wikis folder NOT detected."
    echo "  /confirm will still work — it falls back to reading credibility"
    echo "  from the promo plus web search. To get access to the shared"
    echo "  AIVault, email Joe at jschriefer@gmail.com."
fi

echo ""
echo "============================================"
echo "  Installation complete!"
echo "============================================"
echo ""
echo "To use it:"
echo "  1. Open Claude Code in any project"
echo "  2. Type: /confirm"
echo "  3. Provide the sales letter the reader bought from"
echo "  4. Find your confirmation letter on your Desktop as a .docx"
echo ""
echo "To update later, run: ./update.sh"
echo "To uninstall, run:    ./uninstall.sh"
echo ""
