+++
title = "Variable PATH"
weight = "920"
+++
---------------------

### Répertoires des fichiers exécutables

On peut lancer des fichiers exécutables à partir de n'importe quel répertoire, mais en linux il est recommandé de les regrouper dans les répertoires `/bin`, `/usr/bin` et `/user/local/bin`. Par exemple les exécutables `chmod`, `mkdir` et `ls` sont tous dans le répertoire `/usr/bin`. Les exécutables réservés à l'utilisateur `root` (par exemple `groupadd`, `usermod`, `ifconfig`, etc.) sont quant à eux dans `/usr/sbin`.

Pour savoir dans quel répertoire se trouve un exécutable, on peut utiliser la commande `which`, comme suit:

```bash
info@debian:~$ which chown
/usr/bin/chown
```

### Variable $PATH
Dans les exemples précédents on a lancé des programmes en spécifiant leur chemin complet, comme suit:
```bash
info@debian:~$ /home/info/a.out
Bonjour
info@debian:~$ /home/info/hello.py
Bonjour
```

Si on les appelle uniquement par le nom du fichier, ils ne s'exécuteront pas:
```bash
info@debian:~$ a.out
bash: a.out: commande introuvable
info@debian:~$ hello.py
bash: hello.py: commande introuvable
```

Lorsqu'on lance une commande comme `date` (ou `ls` ou `mkdir`), le fichier exécutable correspondant se trouve dans le répertoire `/usr/bin`. Il est donc possible de lancer la commande en utilisant son chemin complet:

```bash
info@debian:~$ /usr/bin/date
sam 29 oct 2022 14:35:35 EDT
```

Mais on ne le fait généralement pas car ce n'est pas obligatoire:
```bash
info@debian:~$ date
sam 29 oct 2022 14:35:43 EDT
```

Pourquoi certains programmes ont-ils besoin qu'on spécifie leur chemin complet alors que d'autres non?

La réponse est dans la variable d'environnement `$PATH`.

Dans les systèmes d'exploitation MacOS, linux et Windows, la variable `$PATH` sert à définir une liste de répertoires dans lesquels le système d'exploitation doit chercher les programmes qu'on exécute sans nommer leur chemin complet. Pour afficher le contenu de la variable `$PATH`, on utilise la commande echo comme suit:

```bash
info@debian:~$ echo $PATH
/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games
```
Par exemple, si on lance la commande suivante:
```bash
info@debian:~$ mkdir monDossier
```

On ne nomme pas le chemin absolu de la commande mkdir, donc linux cherchera dans les répertoires contenus dans la variable `$PATH`. Il trouvera `/usr/bin/mkdir` et donc exécutera ce programme. 

{{%notice style="note" title="Attention"%}}
Le premier fichier trouvé sera exécuté, et l'ordre de recherche correspond à l'ordre dans lequel les répertoires sont nommés dans `$PATH`. Ainsi, s'il existe un fichier nommé `mkdir` dans `/usr/bin/` et un autre dans `/usr/local/bin/`, c'est celui de `/usr/local/bin/` qui sera exécuté.

La variable `$PATH` sert donc uniquement à éviter de donner le chemin complet de l'éxécutable lorsqu'on veut lancer une commande.
{{%/notice%}}


#### Autres variables d'environnement
Dans linux, plusieurs informations utiles au système d'exploitation sont stockées dans des variables d'environnement lors de l'ouverture de la session d'un utilisateur. Par exemple:

+ `$HOME` : Le répertoire personnel de l'utilisateur
+ `$PWD` : Le répertoire courant
+ `$USER` : Le nom de l'utilisateur courant
+ `$LANG` : La langue d'affichage du systèm


{{% notice style="tip" title="Astuce" %}}
Pour voir toutes les variables d'environnement d'une session et leurs valeurs, lancez la commande suivante:
```bash
info@debian:~$ env
```
{{% /notice %}}