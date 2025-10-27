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