#!/bin/bash

# Définir le répertoire de configuration de VS Code
VSCODE_CONFIG_DIR="$HOME/.local/share/code-server/User"

# Créer le répertoire de configuration si nécessaire
mkdir -p "$VSCODE_CONFIG_DIR"

# Fichier de paramètres utilisateur
SETTINGS_FILE="$VSCODE_CONFIG_DIR/settings.json"

# Activer le mode sombre par défaut
echo '{
    "workbench.colorTheme": "Default Dark Modern"
}' > "$SETTINGS_FILE"

# Fichier de raccourcis clavier
KEYBINDINGS_FILE="$VSCODE_CONFIG_DIR/keybindings.json"

# Ajouter le raccourci pour dupliquer les lignes
echo '[
    {
        "key": "ctrl+shift+d",
        "command": "editor.action.duplicateSelection"
    }
]' > "$KEYBINDINGS_FILE"

echo "Personal init done."
