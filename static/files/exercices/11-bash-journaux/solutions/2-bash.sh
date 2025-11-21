#!/usr/bin/bash
somme=0
nb=0
while read ligne; do
        read nom prenom note < <(echo $ligne | cut -d',' -f2,3,4 --output-delim>
        echo $prenom $nom $note
        somme=$(($somme+$note))
        nb=$(($nb+1))
done < listeEtudiants.txt

echo La moyenne est de $(($somme/$nb))%
