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
