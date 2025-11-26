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


## Arguments d'un programme
De la même façon que les commandes peuvent avoir des arguments, il est possible d'en passer à un script *bash* lorsqu'on le lance, comme suit:
```
info@debian:~$ ./prog.sh abc def
```
Dans cet exemple le programme est appelé avec deux arguments, "abc" et "def". Ceux-ci peuvent désigner des chaînes de caractères, des fichiers, des nombres et même être des variables. Les arguments peuvent être traités à l'intérieur du programme.

Des variables spéciales peuvent être utilisées dans le programme pour référer aux arguments passés. Le tableau suivant en fait la liste:

| Variable | Valeur |
| -------- | ------ |
| `$0` | Le nom du fichier du programme |
| `$1`, `$2`, etc. | Le 1er, 2e, etc. argument du programme |
| `$#` | Le nombre d'arguments passés au programme |
| `$@` | La liste des arguments du programme |

Le programme suivant illustre comment ces variables peuvent être utilisées:
```sh
#!/bin/bash
echo "Le programme se nomme $0"
echo "Il a été appelé avec $# arguments"
echo "Le premier argument est $1"
echo "Le deuxième argument est $2"
```
