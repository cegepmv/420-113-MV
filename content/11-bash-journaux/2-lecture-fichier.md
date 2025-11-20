+++
pre = '<b>2. </b>'
title = 'Lecture de Fichier'
date = 2025-11-20T08:38:38-05:00
weight=1102
+++

Les boucles *while* sont souvent utilisées pour lire une à une les lignes d'un fichier. Dans ce cas on doit utiliser une redirection *à partir* d'un fichier avec l'opérateur `<`, comme suit:
```sh
while read ligne; do
	echo $ligne | wc -m
done < fichier.txt
```
Dans cet exemple la commande `wc -m` permet de compter le nombre de caractères (incluant les sauts de ligne) de chaque ligne du fichier.