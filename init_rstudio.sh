#!/bin/bash

# Chemin vers le fichier .Rprofile dans le répertoire personnel de l'utilisateur
RPROFILE="$HOME/.Rprofile"

# Commande R à ajouter à .Rprofile
R_COMMAND='prenom <- "John"'

# Vérifier si la commande est déjà présente dans .Rprofile
if grep -Fxq "$R_COMMAND" "$RPROFILE"
then
    echo "La variable 'prenom' est déjà définie dans .Rprofile."
else
    # Ajouter la commande au fichier .Rprofile
    echo "$R_COMMAND" >> "$RPROFILE"
    echo "La variable 'prenom' a été ajoutée à .Rprofile."
fi

# Optionnel : Afficher un message pour confirmer que le script a été exécuté
echo "Le script d'initialisation bash a été exécuté."
