+++
title = 'Permissions'
weight = "720"
+++
--------------------

En linux, tout est un fichier, que ce soit un fichier ordinaire, un programme, un répertoire ou un périphérique. Chacun de ces fichiers est associé à des *permissions* qui spécifient comment les utilisateurs peuvent s'en servir.

Chaque fichier est associé à un utilisateur et à un groupe. 

Les permissions touchent à la **lecture**, l'**écriture** ou l'**exécution** des fichiers. 

Pour chaque fichier, on peut donc définir des permissions de lecture, d'écriture et d'exécution différentes pour l'utilisateur, le groupe et les autres.

{{% notice style="info" title="Remarque"%}}
Exécuter un fichier consiste à lancer le programme qui correspond au fichier; exécuter un répertoire consiste à s'y déplacer.
{{% /notice%}}

Par exemple, pour un fichier nommé `doc1`, son propriétaire est **carl** et son groupe est **admin**. On peut définir les permissions suivantes:
+ **carl** a les droits de lecture et d'écriture sur le fichier
+ Les membres du groupe **admin** ont seulement les droits de lecture
+ Les autres utilisateurs ne peuvent ni lire ni écrire dans le fichier 

L'option `-l` de la commande `ls` permet d'afficher les informations relatives aux permissions des fichiers:

![perm](/420-113-MV/images/perm.svg)

Dans la partie *permissions*, le premier caractère donne le type de fichier (`d` pour les répertoires et `-` pour les fichiers ordinaires). Les 9 caractères qui suivent donnent les permissions de lecture (r), écriture (w) ou exécution (x) pour l'utilisateur, le groupe et les autres respectivement:

![rwx](/420-113-MV/images/rwx.svg)

Dans l'exemple précédent, les permissions sont les suivantes:
+ Le fichier est un répertoire
+ L'utilisateur propriétaire a les droits de lecture, écriture et exécution
+ Les membres du groupe ont les droits de lecture et d'exécution
+ Les autres ont les droits de lecture et d'exécution

Deux commandes sont utiles pour modifier les permissions d'un fichier: `chown` et `chmod`. 

## chown
Cette commande permet de changer le propriétaire ("Change Owner") ou le groupe d'un fichier. Elle doit être suivie d'une expression de forme **UTILISATEUR:GROUPE**, qui définit les nouveaux propriétaires, puis du nom du fichier. On peut omettre un des deux termes si on veut seulement changer le groupe ou l'utilisateur. Par exemple:
+ `chown bob:groupe1 document1` : le fichier *document1* aura 'bob' et 'groupe1' comme propriétaires
+ `chown bob document2` : le fichier *document1* aura 'bob' comme propriétaire (le groupe ne change pas)
+ `chown :groupe1 document3` : le fichier *document3* aura 'groupe1' comme propriétaire (l'utilisateur propriétaire ne change pas)


## chmod
Cette commande permet de changer les permissions d'un fichier ("Change Mode"). Elle fonctionne de deux manières: en notation **symbolique** ou en notation **octale**.

### Notation symbolique
Dans la notation **symbolique**, on définit 3 termes: 
+ Pour qui on modifie les permissions:
  + `u`: utilisateur
  + `g`: groupe
  + `o`: les autres
  + `a`: tous 
+ Le type de modification:
    + `+`: ajouter une permission
    + `-`: enlever une permission
    + `=`: affecter la valeur donnée
+ Les permissions
    + `r`: lecture
    + `w`: écriture
    + `x`: exécution

La commande doit être suivie d'une expression composée de ces termes puis du nom du fichier. Quelques exemples:

+ `chmod g+x doc2`: On ajoute au fichier `doc2` les droits d'exécution pour le groupe propriétaire
+ `chmod a=rw doc2`: Les permissions sur `doc2` seront rw pour tous
+ `chmod go-w doc2`: On ôte les permissions d'écriture sur le fichier `doc2` pour le groupe et les autres utilisateurs
+ etc.

### Notation octale
Dans la notation octale, on associe une valeur numérique à chaque type de permission:
+ `r` vaut 4
+ `w` vaut 2
+ `x` vaut 1
Ensuite on additionne ces valeurs pour obtenir un nombre:

+ 5 correspond à `r-x` (4+1)
+ 6 correspond à `rw-` (4+2)
+ 7 correspond à `rwx` (4+2+1)
+ 4 correspond à `r--` (4)

La commande `chmod` doit ensuite être suivie de 3 nombres (le premier pour l'utilisateur, le deuxième pour le groupe et le troisième pour les autres) puis du nom du fichier. Quelques exemples:

+ `chmod 666 doc2`: Les permissions sur `doc2` seront `rw-rw-rw-` (`rw` pour tous)
+ `chmod 700 doc2`: Les permissions sur `doc2` seront `rwx------` (le propriétaire a les droits de lecture, écriture et exécution)
+ `chmod 644 doc2`: Les permissions sur `doc2` seront `rw-r--r--`

## Élévation de privilèges
Dans linux il y a un utilisateur qui a toutes les permissions : `root`. Lorsqu'on a ouvert une session en tant que `root`, il est possible de lire, écrire et créer n'importe quel fichier, et il est aussi possible de modifier les permissions de n'importe quel fichier.

Étant donné le risque de sécurité que cela constitue, plusieurs distributions linux empêchent carrément de se connecter comme `root`. Le compte `root` existe, mais on doit l'utiliser par le biais d'une commande particulière : `su`.

### su
Cette commande ("*Substitute User*") ouvre une session au nom d'un autre utilisateur, avec tous les privilèges de celui-ci. On l'utilise généralement pour ouvrir une session comme `root` à partir d'une autre session.

Pour ouvrir une session comme un autre utilisateur "normal", on donne son nom à la suite de la commande et ensuite on donne son mot de passe, comme suit:
```bash
info@debian:~$ su alice
Mot de passe : 
alice@debian:/home/info$ _
```
Si on ne met pas le nom d'un utilisateur après su, c'est sur le compte de root qu'on se connecte:
```bash
info@debian:~$ su 
Mot de passe : 
root@debian:/home/info$ _
```
Remarquez qu'on ne change pas de répertoire suite à cette commande: à la première ligne, l'invite de commande montre qu'on se trouve dans le répertoire `~`, le répertoire personnel de `info`, mais après avoir changé d'utilisateur on utilise le chemin absolu `/home/info` car pour le nouvel utilisateur ce n'est plus le répertoire personnel (`~` ne correspond plus à `/home/info`).

Si on souhaite se retrouver dans l'environnement de l'utilisateur (répertoire personnel et variables), on ajoute l'option `-`:
```bash
info@debian:~$ su - sam
Mot de passe : 
sam@debian:~$ _
```
{{% notice style="warning" title="Attention"%}}
Dans plusieurs distributions linux, l'utilisateur `root` est créé sans mot de passe. Il est donc impossible de se connecter sur son compte en utilisant `su`
{{% /notice %}}

### sudo
Cette commande ("Substitute User Do") permet de lancer une autre commande avec les privilèges de root. Il s'agit d'invoquer sudo suivi de la commande complète qu'on veut exécuter, suivie de son propre mot de passe:
```bash
info@debian:~$ cat /etc/shadow
cat: /etc/shadow: Permission non accordée
info@debian:~$ sudo cat /etc/shadow
[sudo] Mot de passe de info :
...
```
{{% notice style="warning" title="Attention"%}}
Pour pouvoir utiliser `sudo`, un utilisateur doit être membre du groupe `sudo` ou encore être spécifié dans le fichier `/etc/sudoers`.
{{% /notice %}}

Il est préférable, du point de vue de la sécurité, d'utiliser `sudo` plustôt que `su`. Les raisons sont les suivantes:

+ `sudo` utilise le mot de passe de l'utilisateur qui appelle `sudo`, donc le mot de passe de `root` n'a pas besoin d'être partagé
+ C'est `root` qui décide qui peut exécuter la commande `sudo`, donc il y a un meilleur contrôle
+ Le risque d'erreur est moins grand car on ne peut lancer qu'une commande à la fois
+ Le fait d'utiliser `sudo` a pour effet que les utilisateurs sont conscients d'utiliser une commande privilégiée et possiblement "dangereuse"

[Faire les exercices](https://github.com/cegepmv/420-113-MV/tree/main/exercices/UtilisateursPermissions/)