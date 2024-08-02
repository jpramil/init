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


# Ajout du pipi natif --------------------------------------------------------------------

#!/bin/bash

# Chemin vers le répertoire de configuration de RStudio
RSTUDIO_CONFIG_DIR="$HOME/.config/rstudio/keybindings"

# Fichier de configuration des raccourcis clavier
KEYBINDINGS_FILE="$RSTUDIO_CONFIG_DIR/rstudio_bindings.json"

# Créer le répertoire de configuration si nécessaire
mkdir -p "$RSTUDIO_CONFIG_DIR"

# Contenu JSON pour modifier le raccourci clavier
JSON_CONTENT='{
    "editor_keybindings": {
        "Ctrl+Shift+M": "insertText(\" |> \")"
    }
}'

# Écrire le contenu JSON dans le fichier de configuration
echo "$JSON_CONTENT" > "$KEYBINDINGS_FILE"

# Optionnel : Afficher un message pour confirmer que le script a été exécuté
echo "Le raccourci clavier Ctrl+Shift+M a été modifié pour générer le pipe natif |> dans RStudio."
