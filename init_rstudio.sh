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
    "editor_theme": "Material",
    "server_editor_font_enabled": true,
    "save_workspace": "never",
    "load_workspace": false,
    "remove_history_duplicates": true,
    "auto_detect_indentation": true,
    "highlight_selected_line": true,
    "relative_line_numbers": true,
    "show_invisibles": true,
    "highlight_r_function_calls": true,
    "rainbow_parentheses": true,
    "auto_append_newline": true,
    "strip_trailing_whitespace": true,
    "check_unexpected_assignment_in_function_call": true,
    "style_diagnostics": true,
    "default_encoding": "UTF-8",
    "indent_guides": "gray",
    "syntax_color_console": true,
    "show_panel_focus_rectangle": true,

}'
# Écrire le contenu JSON dans le fichier de configuration
echo "$JSON_CONTENT" > "$PREFS_FILE"
echo "Native pipe and Material theme used"
