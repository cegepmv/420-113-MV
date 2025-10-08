+++
title = 'Introduction à bash'
weight = "610"
+++

Dans les systèmes linux, on peut créer des programmes pour organiser l'exécution de toutes les commandes qu'on a vues jusqu'ici. Le programme bash le plus simple qu'on peut imaginer est un fichier dans lequel on met une série de commandes linux, une par ligne. Les programmes les plus complexes utilisent (comme n'importe quel langage de programmation) des variables, des conditions ("if") et des boucles ("while" ou "for"). D'ailleurs, plusieurs commandes de linux, par exemple `gunzip`, `adduser` et `which` sont en réalité des programmes écrits en *bash*.

Par exemple, voici un programme simple qui supprime tout le contenu d'un répertoire et y crée 2 fichiers:

```bash
echo "Supprimer le contenu"
rm -r /home/info/travail/
echo "Créer les répertoires et les fichiers"
mkdir -p /home/info/travail/projet
touch /home/info/travail/fichier1.txt
echo "allo" > /home/info/travail/fichier2.txt
```

## Lancer un programme
Il y a deux manières d'exécuter un programme *bash*.

La première consiste simplement à appeler l'interpréteur en lui passant le fichier du programme en argument:

```bash
info@debian:~$ bash monProgramme.sh
```
La deuxième consiste à ajouter `#!/bin/bash` à la première ligne du fichier puis lui donner les permissions d'exécution avec la commande `chmod`. Ensuite on peut appeler le programme par son nom, comme suit:

```bash
# Donner la permission d'exécution au fichier (nous verrons comment fonctionne chmod dans un prochain chapitre)
info@debian:~$ chmod +x monProgramme.sh

# Lancer le programme
info@debian:~$ ./monProgramme.sh

```

{{% notice style="info" %}}

Pour appeler le programme sans avoir à le précéder de `./`, il suffit de le déplacer dans un des répertoires du `PATH`, par exemple `/usr/local/bin`. Nous allons voir cela plus en détail dans un chapitre consacré à l'exécution de programmes et de processus !

{{% /notice %}}


## Variables

### Affectation
L'opérateur `=` sert à donner une valeur à une variable. Lorsqu'on souhaite lire cette valeur, il faudra préfixer la variable par `$`:
```bash
info@debian:~$ a=10
info@debian:~$ echo $a
10
```

### Concaténation
Toutes les variables sont des chaînes de caractères dans *bash*: il est donc facile de les concaténer ou des les intégrer dans une chaîne de caractères:
```bash
info@debian:~$ a=bonjour
info@debian:~$ b=vous
info@debian:~$ echo $a $b
bonjour vous
info@debian:~$ echo "$a tout le monde"
bonjour tout le monde
```

### Valeurs numériques
Si on souhaite faire des opérations arithmétiques sur des variables numériques, il faut les inclure dans des doubles parenthèses:

```bash
info@debian:~$ a=10
info@debian:~$ b=10
info@debian:~$ echo $a+$b
10+10
info@debian:~$ echo $((a+b))
20
```
### Résultats de commandes
Il est possible de donner le résultat d'une commande comme valeur à une variable. Pour ce faire on doit mettre la commande entre parenthèses comme suit:

```bash
info@debian:~$ liste=$(ls)
info@debian:~$ echo $liste
Bureau cmd.sh Documents exemple.sh Images Modèles Musique Public Téléchargements travail Vidéos
info@debian:~$ liste=$(ls |grep "sh")
info@debian:~$ echo $liste
cmd.sh exemple.sh
```

### Valeurs saisies par l'utilisateur
La commande `read` permet de stocker dans une variable la chaîne de caractères entrée par l'utilisateur. Par exemple:
```bash
info@debian:~$ read a
ceci est une phrase
info@debian:~$ echo $a
ceci est une phrase
```

### Lire plusieurs valeurs simultanément
La commande `read` peut prendre plusieurs entrées simultanément.
```bash
info@debian:~$ echo "Fournier Maxime" > nomComplet.txt
info@debian:~$ read nom prenom < nomComplet.txt
info@debian:~$ echo $prenom $nom
Maxime Fournier
```