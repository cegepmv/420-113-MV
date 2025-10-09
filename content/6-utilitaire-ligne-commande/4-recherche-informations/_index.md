+++
title = "Recherche d'informations"
weight = "640"
+++
---------------------

Deux commandes sont utiles pour chercher des fichiers ou encore des informations à l'intérieur de fichiers : `grep` et `find`.

### `grep`
À la base, `grep` recherche une *expression régulière* (ou plus simplement une chaîne de caractères) dans un fichier et retourne toutes les lignes de ce fichier qui contiennent cette chaîne. Dans l'exemple suivant, on cherche la chaîne des caractères "src" dans le fichier `/etc/apt/sources.list`:
```bash
info@debian:~$ grep "src" /etc/apt/sources.list
deb-src http://debian.mirror.iweb.ca/debian/ bullseye main
deb-src http://security.debian.org/debian-security bullseye-security main
deb-src http://debian.mirror.iweb.ca/debian/ bullseye-updates main
```
Il est possible de lancer la recherche sur tous les fichiers d'un répertoire donné. Dans ce cas **grep** affichera devant chaque ligne le fichier d'où elle provient:

```bash
info@debian:~$ grep "src" /etc/apt/*
grep: /etc/apt/apt.conf.d: est un dossier
grep: /etc/apt/auth.conf.d: est un dossier
grep: /etc/apt/listchanges.conf.d: est un dossier
grep: /etc/apt/preferences.d: est un dossier
/etc/apt/sources.list:deb-src http://debian.mirror.iweb.ca/debian/ bullseye main
/etc/apt/sources.list:deb-src http://security.debian.org/debian-security bullseye-security main
/etc/apt/sources.list:deb-src http://debian.mirror.iweb.ca/debian/ bullseye-updates main
grep: /etc/apt/sources.list.d: est un dossier
grep: /etc/apt/trusted.gpg.d: est un dossier
```
Les options de **grep** sont très nombreuses. Le tableau suivant décrit les plus communes:
| Option | Utilité | Exemple |
| ------ | ------- | ------- |
| -i | Ignorer la casse (maj/min)  | <nobr>`grep -i "txt" fichier`</nobr> |
| -v | Inverser la recherche: retourne les lignes qui ne contiennent pas l'expression |  |
| -c | Affiche le nombre de lignes du fichier où une correspondance a été trouvée |  |
| -l | Affiche seulement le nom des fichiers où une correspondance a été trouvée  |  |
| -n | Affiche devant chaque résultat le numéro de ligne du fichier |  |
| -C | Affiche le contexte (nombre de lignes avant et après la correpsondance). L'option doit être suivi d'un nombre. | <nobr>`grep -C 2 "txt" fichier`</nobr>  |
| -r | Fait une recherche récursive  | <nobr>`grep -r "txt" /etc/init.d/`</nobr> |

### `find`: rechercher des fichiers
Cette commande est assez complexe mais surtout très versatile: elle permet de chercher des fichiers par leur nom ou n'importe quelle autre attribut (permissions, propriétaire, date de modification, etc.). La recherche est toujours récursive. Attention par contre: elle ne cherche pas dans le contenu des fichiers.

Dans un exemple simple, la commande suivante recherche dans le répertoire `/usr/share` et tous ses sous-répertoires les fichiers dont le nom commence par "app":
```bash
info@debian:~$ find /usr/share -name "app*"
```
Les options de la commande permettent de spécifier le critère de recherche. Le tableau suivant décrit les plus courants:
| Option | Critère | Exemple |
| ------ | ------- | ------- |
| -name | Le nom du fichier contient les caractères spécifiés | <nobr>`find /usr/share -name "app*"`</nobr> |
| -iname | Le nom du fichier contient les caractères spécifiés, sans tenir compte de la casse | <nobr>`find /usr/share -iname "app*"`</nobr> |
| -perm | Le fichier a les permissions spécifiées (mode octal) | <nobr>`find /home/info -perm 644`</nobr> |
| -size | Recherche les fichiers correspondant à une taille donnée. "+" et "-" permettent de rechercher des fichiers dont la taille est supérieure ou inférieure à celle donnée. On peut utiliser `k`, `M` ou `G`. | <nobr>`find /home/info -size +1k`</nobr> |
| -user | Recherche des fichiers appartenant à l'utilisateur spécifié | <nobr>`find /home/info -user bob`</nobr> |
| -group | Recherche des fichiers appartenant au groupe spécifié | <nobr>`find /home/info -group webmin`</nobr> |
| -maxdepth | Limite la profondeur de la recherche dans les sous-répertoires | <nobr>`find / -name etc -maxdepth 1`</nobr> |


## Formater et filtrer les informations
Il existe plusieurs commandes en *bash* dont l'utilité est de transformer les informations provenant de fichiers textes ou d'autres commandes (en utilisant la redirection). Dans cette section nous en verrons quelques unes.

### `sort`
Trier les lignes d'un fichier texte et afficher le résultat. Par exemple, si on crée un fichier nommé `test.txt` comprenant plusieurs lignes comme suit:
```bash
info@debian:~$ echo bonjour > test.txt
info@debian:~$ echo allo >> test.txt
info@debian:~$ echo 2008 >> test.txt
info@debian:~$ cat test.txt
bonjour
allo
2008
```
On trie le fichier avec la commande suivante:
```bash
info@debian:~$ sort test.txt
2008
allo
bonjour
```
Les options principales sont les suivantes:
| Option | Utilité | 
| ------ | ------- | 
| -r | Inverser l'ordre du tri |
| -f | Ignorer la casse |
| -n | Tri numérique |

### `uniq`
Éliminer les lignes en double dans un fichier. Les options principales sont les suivantes:
| Option | Utilité | 
| ------ | ------- | 
| -c | Afficher le nombre d'occurrences de chaque ligne |
| -d | Afficher uniquement les lignes qui apparaissent plus d'une fois |
| -u | Afficher seulement les lignes uniques |
| -i | Ignorer la casse |

Par exemple pour un fichier qui contient les lignes suivantes:
```bash
info@debian:~$ cat test.txt
a
a
b
b
c
c
c
d
```
La commande `uniq` donne le résultat suivant:
```bash
info@debian:~$ uniq test.txt
a
b
c
d
```

### `wc` 
La commande `wc` ("word count") affiche le nombre de lignes, de mots et de caractères dans un fichier. Par exemple, pour un fichier nommé `fichier.txt` qui contient quelques lignes:
```bash
info@debian:~$ cat fichier.txt
le nombre
de mots
est plus grand
qu 2
info@debian:~$ wc fichier.txt
 4  9 38 fichier.txt
```

### `cut`
Cette commande divise les lignes d'un fichier en fonction d'un délimiteur et affiche une ou plusieurs parties de ces lignes. Par défaut, le délimiteur est la tabulation mais on peut en spécifier un autre avec l'option `-d`. L'option `-f` permet ensuite de sélectionner les parties entre les délimiteurs: "f" doit être suivi du numéro d'une ou plusieurs parties séparées par des virgules.

Par exemple, pour extraire les noms des utilisateurs du fichier `/etc/passwd`, où chaque information est séparée par ":" et les noms d'utilisateurs sont le premier élément de chaque ligne: 
```bash
info@debian:~$ cut -d':' -f1 /etc/passwd
```
Pour afficher le nom (1er élément) de l'utilisateur suivi de son ID (3e élément):
```bash
info@debian:~$ cut -d':' -f1,3 /etc/passwd
```

[Faire les exercices 1,2,3](https://github.com/cegepmv/420-113-MV/tree/main/exercices/UtilitairesLigneCommande/)
