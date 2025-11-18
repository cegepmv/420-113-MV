+++
title = 'Bash Partie 2'
date = 2025-11-13T09:58:40-05:00
weight = 2
+++
## Conditions 
Les structures conditionnelles doivent avoir la syntaxe suivante:
```
if [[ CONDITION ]]; then
    EXPRESSION
fi
```

Attention, les espaces entre `[[` et `]]` et la condition sont importants!

Il est évidemment possible d'utiliser les instructions `else` ou `elif`.

```sh
#!/bin/bash

echo "Entrez un mot:"
read mot1
echo "Un autre:"
read mot2

if [[ $mot1 = $mot2 ]]; then
        echo "Les deux mots sont identiques"
else
        echo "Les deux mots sont différents"
fi
```

### Opérateurs de comparaison
L'opérateur `=` dans l'exemple précédent permet seulement la comparaison entre deux chaînes de caractères. Lorsqu'on veut vérifier si deux nombres sont égaux, il faut utiliser `-eq`. Le tableau suivant contient la liste des opérateurs de compraison qu'on peut utiliser dans *bash*.

| Opérateur | Vrai si... | 
| --------- | ------- |
| **=** | deux chaînes de caractères sont identiques |
| **!=** | deux chaînes de caractères sont différentes |
| **<** | la première chaîne précède la deuxième dans l'ordre alphabétique |
| **>** | la première chaîne suit la deuxième dans l'ordre alphabétique|
| **-eq** | les deux nombres sont égaux |
| **-ne** | les deux nombres sont différents |
| **-gt** | le premier nombre est supérieur au deuxième |
| **-ge** | le premier nombre est supérieur ou égal au deuxième |
| **-lt** | le premier nombre est inférieur au deuxième |
| **-le** | le premier nombre est inférieur ou égal au deuxième |

> REMARQUE: *bash* est généralement **limité aux nombres entiers**: il ne permet pas de manipuler des nombres décimaux de façon simple. Lorsque vous souhaitez faire une programme qui traite des nombres décimaux, il est préférable d'utiliser un autre langage de programmation!

### Tests
Dans les expressions conditionnelles on peut aussi utiliser des opérateurs qui ne prennent qu'un seul terme (aussi appelés "opérateurs unaires"). Ceux-ci permettent de tester certaines conditions et valeurs de variables. 

Par exemple dans le code suivant, on utilise `-f` pour vérifier si un fichier avec le nom spécifié existe avant de le supprimer (ceci permet d'éviter l'erreur qui surviendra si on tente de supprimer un fichier inexistant).
```sh
#!/bin/bash

fichier=/home/info/document.txt
if [[ -f $fichier ]]; then
        rm $fichier
fi
```
Les opérateurs unaires les plus courants sont les suivants:

| Opérateur | Vrai si la variable... | 
| --------- | ------- |
| -z | est nulle / vide |
| -n | contient une chaîne de caractères |
| -f | désigne un fichier |
| -d | désigne un répertoire |
| -e | désigne un élément qui existe dans le système de fichiers (fichier, répertoire, lien symbolique, stockage, etc.) |

### Opérateurs logiques
Dans toute expression conditionnelle il est possible d'enchaîner plusieurs conditions avec les opérateurs logiques de conjonction (ET logique) et de disjonction (OU logique), et aussi d'inverser la valeur de vérité d'une expression avec l'opérateur de négation (NON logique):

```sh
#!/bin/bash

fichier=/home/info/abc
if [[ ! -f $fichier ]]; then
        echo "Il n'y a pas de fichier nommé $fichier"
fi
```
Dans l'exemple suivant on vérifie si une des deux variables est vide:
```sh
#!/bin/bash

echo "Entrez un mot:"
read mot1
echo "Un autre:"
read mot2

if [[ -z $mot1 || -z $mot2 ]]; then
        echo "Vous avez oublié au moins un mot"
fi
```

## Boucles
Les boucles en *bash* sont, comme dans la plupart des langages de programmation, de deux types: il y a les boucles **while** et les boucles **for**. Les contextes d'utilisation de chacune sont différents.

### `while`
Les boucles *while* doivent avoir la syntaxe suivante:
```
while [[ CONDITION ]]; do
    EXPRESSION
done
```
Le cas le plus simple est celui d'une boucle basée sur un compteur. Dans l'exemple suivant, on affiche la variable `$i` tant que sa valeur est inférieure à 10:
```sh
i=0
while [[ $i -lt 10 ]]; do
    echo $i
    i=$(($i+1))
done
```
On peut également utiliser des boucles infinies "while-true" lorsqu'on veut arrêter une itération uniquement au moment où une donnée est reçue. Par exemple, dans le code suivant, on boucle jusqu'à ce que l'utilisateur entre le mot "stop":
```sh
while true; do
	read mot
	if [[ $mot = "stop" ]]; then 
		echo $seq
		break	
	fi
	seq=$seq$mot
done
```
Le mot-clé `break` est ici utilisé pour sortir de la boucle. 

Enfin, les boucles *while* sont souvent utilisées pour lire une à une les lignes d'un fichier. Dans ce cas on doit utiliser une redirection *à partir* d'un fichier avec l'opérateur `<`, comme suit:
```sh
while read ligne; do
	echo $ligne | wc -m
done < fichier.txt
```
Dans cet exemple la commande `wc -m` permet de compter le nombre de caractères (incluant les sauts de ligne) de chaque ligne du fichier.



### `for`
On utilise *for* lorsque ce qui contrôle l'itération est un compteur ou des éléments d'une liste. La syntaxe est la suivante:
```
for ELEMENT in LISTE; do
    EXPRESSION
done
```
**ELEMENT** est une variable qui correspond à un élément de la liste différent pour chaque itération de la boucle. 

La **LISTE** peut être exprimée de différentes manières. Dans un premier cas, elle peut être une simple énumération de valeurs:
```sh
for s in 12 13 ananas go tiger; do
	echo $s
done
```

Lorsque les valeurs font partie d'une séquence de nombres entiers, on peut la spécifier entre accolades comme suit:
```sh
for i in {10..30}; do
	echo $i
done
```

Aussi, toute commande qui retourne une liste d'éléments peut être utilisée dans ce contexte:
```sh
i=0
for f in $(ls); do
	i=$(($i+1))
        echo "$i. $f"
done
```
> ATTENTION: `for` boucle sur tous les éléments *séparés par des espaces*. Donc si la commande retourne des lignes où plusieurs éléments sont séparés par des espaces, la variable `f` (dans l'exemple) ne correspondra pas à une ligne entière. Pour le constater, remplacez `$(ls)` par `$(ls -l)` dans l'exemple précédent.

Finalement, les boucles `for` peuvent itérer sur les éléments d'un répertoire. Dans l'exemple suivant, on affiche chacun des éléments du répertoire courant:
```sh
i=0
for elem in *; do
	echo $elem
done
```
Il est possible d'utiliser des expressions plus précises qu'un simple `*`, tant que cette expression peut être utilisée pour désigner des éléments du système de fichiers:
```sh
i=0
for elem in /home/info/Téléchargements/*.deb; do
	echo $elem
done
```

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
echo "La liste complète des arguments est:"
for arg in $@; do
        echo "- $arg"
done
```
