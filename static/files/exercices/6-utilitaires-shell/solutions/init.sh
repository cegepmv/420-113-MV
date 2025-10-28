#!/bin/bash

echo "Quel nom voulez-vous donner au répertoire?"
read rep

if [[ -d $rep ]]; then
	rm -rf $rep
fi

mkdir $rep
mkdir $rep/perso
mkdir $rep/documents
mkdir $rep/bin
