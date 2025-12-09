#!/bin/bash

# This init script is used for:
# - Defining personal keyboard shortcuts for VS Code.
# - Enforcing dark mode in VS Code, regardless of system/browser settings.
# - Installing and configuring tools like nbstripout
#
# Expected parameters: None
# Assumptions: 
# - Python environment with `pip` is already available for installing packages.
#
# Usage: 
# Simply run this script to set up your environment with the necessary configurations and tools.

# Define the configuration directory for VS Code
VSCODE_CONFIG_DIR="$HOME/.local/share/code-server/User"

# Create the configuration directory if necessary
mkdir -p "$VSCODE_CONFIG_DIR"

# User settings file
SETTINGS_FILE="$VSCODE_CONFIG_DIR/settings.json"

# Enable dark mode by default
echo '{
    "workbench.colorTheme": "Default Dark Modern"
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

# Install nbstripout
# echo "Installing nbstripout..."
# pip install nbstripout

# # Run nbstripout installation command in the terminal
# repo_name=$(echo $GIT_REPOSITORY | sed 's#.*/\([^/]*\)\.git#\1#')
# echo $repo_name
# echo "Running nbstripout --install..."
# cd $HOME/work/$repo_name && nbstripout --install

echo "Personal init done."
