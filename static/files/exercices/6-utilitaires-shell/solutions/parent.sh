#!/bin/bash

echo "Entrez le chemin complet du répertoire"
read rep

if [[ -d $rep ]]; then
	cd $rep
	cd ../..
	mv $rep .
	cd
else
	echo "Aucun répertoire avec ce nom"
fi
