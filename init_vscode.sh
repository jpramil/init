#!/bin/bash

# This init script is used for : 
# - Defining personnal keyboard shortcuts
# - Using dark mode (regardless of the browser mode).
# Expected parameters : None
# Use nbstripout to prevent notebooks outputs to be pushed


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

# Add shortcuts for duplicating and deleting lines
echo '[
    {
        "key": "ctrl+shift+d",
        "command": "editor.action.duplicateSelection"
    },
    {
        "key": "ctrl+d",
        "command": "editor.action.deleteLines",
        "when": "editorTextFocus"
    }
]' > "$KEYBINDINGS_FILE"

# Install nbstripout
echo "Installing nbstripout..."
pip install nbstripout

# Run nbstripout installation command in the terminal
echo "Running nbstripout --install..."
nbstripout --install

echo "Personal init done."
