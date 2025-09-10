+++
title = "S'orienter dans linux"
weight = "510"
+++

------------------

## Invite de commandes
Sur la ligne de commande du terminal *Debian*, avant même d'avoir écrit quoi que ce soit, on peut déjà voir des informations utiles:
```bash
leon@debian:~$
```
On appelle cette chaîne de caractères l'*invite de commandes*. Elle contient les informations suivantes:
+ Nom de l'utilisateur courant
+ Nom de l'ordinateur (aussi appelé *hostname*)
+ Répertoire courant (`~` désigne le répertoire personnel)


## Hiérarchie du système de fichiers
En linux vous êtes toujours dans un répertoire:
![fslinux](/images/fslinux.svg)

Le système de fichiers est composé de fichiers et de répertoires qui forment une hiérarchie: dans le schéma ci-dessus (qui contient seulement une partie des fichiers et répertoires dans linux), les répertoires sont en blanc et les fichiers en bleu. On nomme **racine** le sommet de cette hiérarchie; en linux elle est désignée par `/`.

## Chemins absolus et relatifs
Un fichier ou un répertoire peut être désigné de deux manières: son chemin **absolu** ou son chemin **relatif**.

Le *chemin absolu* est le nom du fichier ou du répertoire précédé de tous ses parents jusqu'à la racine. Le *chemin relatif* est le nom du fichier sans celui de ses parents, et n'est valide que dans le contexte du répertoire courant (celui où on se trouve). Par exemple, pour le fichier `/var/log/messages`, son chemin relatif à partir du répertoire `/var` sera `log/messages`, et à partir de `/var/log` son chemin relatif sera `messages`.
> **ATTENTION!**: Remarquez le caractère `/`. Il est toujours présent dans un chemin absolu et toujours absent dans un chemin relatif. 

## Raccourcis
Aussi, on peut utiliser deux raccourcis pour désigner des répertoires en linux:
+ `.` pour le répertoire courant
+ `..` pour le répertoire parent
+ `~` pour le répertoire personnel
  
Par exemple, si on se trouve dans le répertoire `/usr/bin`:
+ `..` est égal à `/usr`
+ `.` est égal à `/usr/bin`
+ `./gzip` est égal à `/usr/bin/gzip`
+ `../share/gcc` est égal à `/usr/share/gcc`
+ `~` est égal à `/home/UTIL`, où "UTIL" est le nom de l'utilisateur connecté.

## Commandes utiles
| But | Commande | Signification |
| --- | --- | --- |
| Savoir où vous êtes | `pwd`  | *Present Working Directory* |
| Changer de répertoire | `cd` | *Change Directory* |
| Voir le contenu d'un répertoire | `ls` | *List contentS*
| Voir le contenu d'un fichier | `cat` | *conCATenate* |
| Connaître le type d'un fichier | `file` | |

> Pour plus d'informations sur une commande, affichez son manuel d'utilisation en lançant `man` suivi du nom de la commande, par exemple: 
```bash
leon@debian:~$ man ls
```

### `pwd`
Affiche le chemin complet du répertoire courant.

*Exemple:*
```bash
leon@debian:~$ pwd
```

### `ls` 
Affiche le contenu d'un répertoire. L'**argument** de la commande est le chemin de ce répertoire.

La commande `ls` a plusieurs **options**; les principales sont:
+ `-l` montre une liste détaillée
+ `-a` montre les fichiers cachés

On peut combiner ces options : `ls -la`

*Exemples:* 
```bash
leon@debian:~$ ls Téléchargements
leon@debian:~$ ls -l /etc
leon@debian:~$ ls -al .
``` 

### `cd`
Change le répertoire courant. L'argument de la commande est le répertoire où on veut aller. 

Si on ne donne aucun argument, on se retrouve dans notre répertoire personnel. 

Si on donne `-` comme argument on ira dans le dernier répertoire où on était.

*Exemples:*
```bash
leon@debian:~$ cd /etc/init.d
leon@debian:/etc/init.d$ cd ..
leon@debian:/etc$ cd -
leon@debian:/etc/init.d$ cd
leon@debian:~$
```

### `file`
Affiche des informations sur le type d'un fichier. L'argument est le fichier dont on veut avoir des informations.

*Exemples*
```bash
leon@debian:~$ file /etc/hosts
leon@debian:/usr/bin$ file xxd
```

### `cat`
Affiche à l'écran le contenu d'un fichier. L'argument est le fichier dont on veut afficher le contenu. 

*Exemples :*
```bash
leon@debian:~$ cat /etc/hosts
leon@debian:~$ cat .bashrc
```

<!-- 
 REMARQUES: Différence de coloration entre fichiers et répertoires; ­
 `cat` répertoire et `ls` fichier;  
 `file` permet de voir le type de fichier  
 `cat /dev/random`
-->



<!-- 
FUN TIMES: faites un snapshot et faites rm -rf /
>

<!---
## Liens symboliques
ln

## points de montage (intro périphériques de stockage)
mount, umount, du, df
Démo avec insérer/supprimer CD
Démo avec répertoire réseau
--->
