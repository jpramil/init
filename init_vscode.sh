#!/bin/bash

# This init script is used for:
# - Defining personal keyboard shortcuts for VS Code.
# - Enforcing dark mode in VS Code, regardless of system/browser settings.
# - Installing and configuring tools like nbstripout, ruff, and pre-commit for better code quality.
#
# Features:
# 1. VS Code configuration:
#    - Enables "Default Dark Modern" color theme.
#    - Adds custom keyboard shortcuts for:
#      * Duplicating lines: CTRL + Shift + D
#      * Deleting lines: CTRL + D
#      * Navigating to the previous editor tab: CTRL + Alt + Left Arrow
#      * Navigating to the next editor tab: CTRL + Alt + Right Arrow
#
# 2. Code quality tools:
#    - Installs `nbstripout` to strip outputs from Jupyter notebooks, preventing notebook outputs from being included in version control.
#    - Installs `ruff` as a fast Python linter to enforce code style and quality.
#    - Installs `pre-commit` to manage and run pre-commit hooks for automatic checks before committing code (e.g., running `ruff`).
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
    }
]' > "$KEYBINDINGS_FILE"

# Install nbstripout
echo "Installing nbstripout..."
pip install nbstripout

# Run nbstripout installation command in the terminal
echo "Running nbstripout --install..."
nbstripout --install

# Install ruff
echo "Installing ruff..."
pip install ruff

# Install pre-commit
echo "Installing pre-commit..."
pip install pre-commit

# Run pre-commit installation
echo "Running pre-commit install..."
pre-commit install

echo "Personal init done."
