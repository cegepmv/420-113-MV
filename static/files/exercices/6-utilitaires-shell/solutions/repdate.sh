#!/bin/bash

annee=$(date | cut -d' ' -f4)
mois=$(date | cut -d' ' -f3)
jour=$(date | cut -d' ' -f2)

if [[ -e $PWD/$annee$mois$jour ]]; then
	exit 1
fi

mkdir $annee$mois$jour
