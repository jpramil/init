#!/bin/bash
# This init script is used for:
# - Defining personal keyboard shortcuts for VS Code.
# - Enforcing dark mode in VS Code, regardless of system/browser settings.
# - Disabling paste pop-ups (paste selector + multi-line terminal warning).
# - Installing Claude Code and pre-configuring its permissions globally.
# - Installing and configuring tools like nbstripout
#
# Expected parameters: None
# Assumptions:
# - Python environment with `pip` is already available for installing packages.
#
# Usage:
# Simply run this script to set up your environment with the necessary configurations and tools.

# ----------------------------------------------------------------------------
# VS Code configuration
# ----------------------------------------------------------------------------

# Define the configuration directory for VS Code
VSCODE_CONFIG_DIR="$HOME/.local/share/code-server/User"
# Create the configuration directory if necessary
mkdir -p "$VSCODE_CONFIG_DIR"

# User settings file
SETTINGS_FILE="$VSCODE_CONFIG_DIR/settings.json"
# Enable dark mode by default + disable paste pop-ups
echo '{
    "workbench.colorTheme": "Default Dark Modern",
    "editor.pasteAs.enabled": false,
    "terminal.integrated.enableMultiLinePasteWarning": "never"
}' > "$SETTINGS_FILE"

# Keybindings file
KEYBINDINGS_FILE="$VSCODE_CONFIG_DIR/keybindings.json"
# Add shortcuts for duplicating, deleting lines, and navigating tabs
echo '[
    {
        "key": "ctrl+shift+d",
        "command": "editor.action.duplicateSelection"
    },
    {
        "key": "ctrl+d",
        "command": "editor.action.deleteLines",
        "when": "editorTextFocus"
    },
    {
        "key": "ctrl+alt+left",
        "command": "workbench.action.previousEditor"
    },
    {
        "key": "ctrl+alt+right",
        "command": "workbench.action.nextEditor"
    },
    {
        "key": "ctrl+q",
        "command": "workbench.action.closeActiveEditor"
    },
    {
        "key": "ctrl+l",
        "command": "expandLineSelection",
        "when": "editorTextFocus"
    },
    {
        "key": "ctrl+numpad2",
        "command": "workbench.action.terminal.focus"
    },
    {
        "key": "ctrl+alt+down",
        "command": "workbench.action.terminal.focusNext"
    },
    {
        "key": "ctrl+numpad8",
        "command": "workbench.action.focusActiveEditorGroup"
    },
    {
        "key": "ctrl+numpad4",
        "command": "workbench.files.action.focusFilesExplorer"
    }
]' > "$KEYBINDINGS_FILE"

# ----------------------------------------------------------------------------
# Node + Claude Code
# ----------------------------------------------------------------------------

# Install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
# Load nvm
export NVM_DIR="$HOME/.nvm"
source "$NVM_DIR/nvm.sh"
# Install Node LTS
nvm install --lts
nvm use --lts

# Install Claude Code
npm install -g @anthropic-ai/claude-code
echo "Node version: $(node --version)"
echo "Claude Code version: $(claude --version)"

# ----------------------------------------------------------------------------
# Claude Code permissions (global - applies to every session, any repo)
# ----------------------------------------------------------------------------

mkdir -p "$HOME/.claude"
cat > "$HOME/.claude/settings.json" <<'EOF'
{
    "permissions": {
        "allow": [
            "Bash(git status)",
            "Bash(git diff:*)",
            "Bash(git log:*)",
            "Bash(git add:*)",
            "Bash(ls:*)",
            "Bash(cat:*)",
            "Bash(python:*)",
            "Bash(pytest:*)",
            "Bash(ruff:*)",
            "Bash(uv:*)",
            "Bash(pip:*)",
            "Read(*)",
            "Edit(*)"
        ],
        "deny": [
            "Bash(rm -rf:*)",
            "Bash(git push:*)"
        ]
    }
}
EOF
echo "Wrote global Claude Code permissions to ~/.claude/settings.json"

echo "Done! Run 'claude' to start."

# ----------------------------------------------------------------------------
# Other tools
# ----------------------------------------------------------------------------

# Install tmux
sudo apt-get update && sudo apt-get install -y tmux

# echo "Running nbstripout --install..."
# cd $HOME/work/$repo_name && nbstripout --install

echo "Personal init done."
