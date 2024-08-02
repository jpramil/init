#!/bin/bash

# Script d'init pour Rstudio ------------------------------------------------------------

# Utilisation du pipe natif
# Theme custom

RSTUDIO_CONFIG_DIR="$HOME/.config/rstudio/"
# Fichier de configuration des préférences
PREFS_FILE="$RSTUDIO_CONFIG_DIR/rstudio-prefs.json"
# Créer le répertoire de configuration si nécessaire (il ne se passe rien s'il existe déjà)
mkdir -p "$RSTUDIO_CONFIG_DIR"
# Contenu JSON pour modifier le raccourci clavier
JSON_CONTENT='{
    "insert_native_pipe_operator": true,
    "posix_terminal_shell": "bash",
    "editor_theme": "Material"
}'
# Écrire le contenu JSON dans le fichier de configuration
echo "$JSON_CONTENT" > "$PREFS_FILE"
echo "Native pipe and Material theme used"
