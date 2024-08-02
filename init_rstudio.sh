#!/bin/bash

# Chemin vers le fichier .Rprofile dans le répertoire personnel de l'utilisateur
RPROFILE="$HOME/.Rprofile"

# Commande R à ajouter à .Rprofile
R_COMMAND='prenom <- "John"'

# Créer le fichier .Rprofile s'il n'existe pas
if [ ! -f "$RPROFILE" ]; then
    touch "$RPROFILE"
    echo "Le fichier .Rprofile a été créé."
fi

# Ajouter la commande R au fichier .Rprofile si elle n'est pas déjà présente
if grep -Fxq "$R_COMMAND" "$RPROFILE"
then
    echo "La variable 'prenom' est déjà définie dans .Rprofile."
else
    echo "$R_COMMAND" >> "$RPROFILE"
    echo "La variable 'prenom' a été ajoutée à .Rprofile."
fi

# Optionnel : Afficher un message pour confirmer que le script a été exécuté
echo "Le script d'initialisation bash a été exécuté."



# Utilisation du pipe natif  ------------------------------------------------------------
RSTUDIO_CONFIG_DIR="$HOME/.config/rstudio/"
# Fichier de configuration des préférences
PREFS_FILE="$RSTUDIO_CONFIG_DIR/rstudio_prefs.json"
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
