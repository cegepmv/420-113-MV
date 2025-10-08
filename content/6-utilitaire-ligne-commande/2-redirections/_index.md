+++
title = 'Redirections'
weight = "620"
+++
----------------------

Les données qui entrent et sortent d'un programme utilisent 3 "flux" (***streams*** en anglais): 
+ `STDIN` : Entrée standard, les données qui entrent dans un programme
+ `STDOUT` : Sortie standard, les données générées par un programme (qui s'affichent à l'écran par défaut)
+ `STDERR` : Erreur standard, les messages d'erreur générés par le programme (qui s'affichent à l'écran par défaut)

Les opérateurs `>`, `>>`, `<` et `|` permettent de connecter ces flux de données à des fichiers ou à d'autres commandes, ce qui offre de nombreuses possibilités.

### `>` et `>>`: Redirection vers un fichier
Prenons par exemple la commande `ls`. Celle-ci envoie des données sur la sortie standard; c'est pourquoi on voit les résultats de son exécution sur le terminal:

```bash
info@debian:~$ ls
Bureau  Documents  Images  Modèles  Musique  Public  Téléchargements  Vidéos
```

L'opérateur `>` redirige la sortie standard vers un fichier, donc `ls > liste.txt` aura pour effet d'écrire le résultat de `ls` dans un fichier nommé *liste.txt*:
```bash
info@debian:~$ ls > liste.txt
info@debian:~$ cat liste.txt
Bureau
Documents
Images
liste.txt
Modèles
Musique
Public
Téléchargements
Vidéos
```
Il est aussi possible d'utiliser la commande `echo` de cette manière pour créer rapidement un fichier sans utiliser un éditeur de texte comme *gedit* ou *nano*:
```bash
info@debian:~$ echo "Ceci est une ligne de texte" > fichier.txt
info@debian:~$ cat fichier.txt
Ceci est une ligne de texte
```
L'opérateur `>` crée un nouveau fichier: s'il existe déjà, son contenu sera écrasé. Pour ajouter le résultat de la commande à un fichier existant, il faut utiliser `>>`:
```bash
info@debian:~$ echo "Bonjour" > fichier.txt
info@debian:~$ cat fichier.txt
Bonjour
info@debian:~$ echo "Allo" > fichier.txt
info@debian:~$ cat fichier.txt
Allo
info@debian:~$ echo "Salut" >> fichier.txt
info@debian:~$ cat fichier.txt
Allo
Salut
```
### `2>` : Rediriger les erreurs
Les résultats des commandes et les erreurs ont des flux de sortie différents (respectivement STDOUT et STDERR) mais qui s'affichent les deux par défaut dans le terminal. L'effet de ceci est que les erreurs et les résultats d'une commande peuvent se mélanger à l'écran, par exemple :

```bash
info@debian:~$ grep -l "config" /etc/*
/etc/adduser.conf
grep: /etc/alsa: est un dossier
grep: /etc/alternatives: est un dossier
/etc/anacrontab
grep: /etc/apache2: est un dossier
grep: /etc/apparmor: est un dossier
grep: /etc/apparmor.d: est un dossier
(...)
```
La commande précédente recherche les fichiers qui contiennent le terme "config" et affiche leur nom à l'écran. Cependant la commande `grep` cause une erreur avec les dossiers car elle ne fonctionne qu'avec des fichiers ordinaires. Les messages à l'écran contiennent donc autant des noms de fichiers où "config" a été trouvé (par exemple `/etc/adduser`), mais aussi des messages d'erreur, ce qui peut rendre les réultats difficiles à lire.

Il est possible de rediriger uniquement les erreurs afin de laisser uniquement les résultats de la commande s'afficher dans le terminal. Habituellement, on redirige les erreurs vers `/dev/null`, un fichier spécial qui agit comme une sorte de "trou noir" où tout ce qu'on écrit disparaît. La commande précédente avec redirection des erreurs est donc celle-ci:

```bash
info@debian:~$ grep -l "config" /etc/* 2> /dev/null
/etc/adduser.conf
/etc/anacrontab
/etc/appstream.conf
/etc/bogofilter.cf
/etc/ca-certificates.conf
(...)
```

### `<` : Redirection à partir d'un fichier
Il est aussi possible de faire l'inverse, c'est-à-dire de rediriger le contenu d'un fichier vers une commande, avec l'opérateur `<`. Dans l'exemple suivant, on donne à une variable une valeur lue dans un fichier avec la commande `read`:

```bash
info@debian:~$ echo "12345" > valeur.txt
info@debian:~$ read VAR < valeur.txt
info@debian:~$ echo $VAR
12345
```

### `<()` : Substitution de processus
Lorsqu'un processus n'accepte en entrée que des fichiers, mais que non ne voulons pas créer de fichier inutilement, nous pouvons utiliser la substitution de processus.

```bash
info@debian:~$ read VAR < <(echo "12345")
info@debian:~$ echo $VAR
12345
```

### `|` : Enchaînement de commandes (*piping*)
Enfin, il est possible de rediriger la sortie d'une commande vers l'entrée d'une autre commande. Ceci est très utile car cela nous permet d'effectuer des opérations complexes en une seule ligne. 

Par exemple, prenons la commande `grep`, qui sert à rechercher des chaînes de caractères dans des fichiers: la commande suivante affiche la ligne qui contient "info" dans le fichier `/etc/passwd`:
```bash
info@debian:~$ grep "info" /etc/passwd
info:x:1000:1000:info,,,:/home/info:/bin/bash
```

Utiliser l'opérateur `|` permet d'exécuter `grep` sur le résultat d'une commande plutôt que sur le contenu d'un fichier. Dans l'exemple suivant on exécute `grep` sur le résultat de la commande `ls -l` sans passer par un fichier:

```bash
info@debian:~$ ls
Bureau   Documents    Images     Modèles  Public           valeur.txt
dir.txt  fichier.txt  liste.txt  Musique  Téléchargements  Vidéos
info@debian:~$ ls | grep "txt"
dir.txt
fichier.txt
liste.txt
valeur.txt
```