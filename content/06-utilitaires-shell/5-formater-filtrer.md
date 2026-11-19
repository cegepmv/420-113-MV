+++
title = "Formater et filtrer les informations"
weight = "650"
+++
---------------------

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
| -u | Tri avec les valeurs uniques |

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

### `tr`
La commande `tr` ("translate") remplace des caractères par d'autres. Elle ne prend pas de nom de fichier: elle lit son entrée standard, on l'utilise donc avec un pipe `|` ou une redirection `<`.

Par exemple, pour remplacer les espaces par des traits de soulignement:
```bash
info@debian:~$ echo "mon fichier de notes.txt" | tr ' ' '_'
mon_fichier_de_notes.txt
```

L'option `-s` ("squeeze") remplace plusieurs espaces consécutifs par un seul. C'est utile avant d'utiliser `cut`, car la sortie de commandes comme `ls -l` contient souvent plusieurs espaces de suite:
```bash
info@debian:~$ ls -l /etc/passwd
-rw-r--r--  1 root root 1580  3 sept. 10:12 /etc/passwd
info@debian:~$ ls -l /etc/passwd | tr -s ' ' | cut -d' ' -f1,9
-rw-r--r-- /etc/passwd
```

### `awk`
`awk` est un langage complet de traitement de texte, mais on l'utilise souvent pour une tâche simple: afficher certaines colonnes d'un texte. Par défaut, `awk` sépare les colonnes par les espaces (peu importe leur nombre) et chaque colonne est désignée par `$1`, `$2`, `$3`, etc.

Le même exemple qu'avec `tr` et `cut` s'écrit donc plus simplement:
```bash
info@debian:~$ ls -l /etc/passwd | awk '{print $1, $9}'
-rw-r--r-- /etc/passwd
```

L'option `-F` permet de spécifier un autre délimiteur. Pour afficher le nom et l'ID des utilisateurs de `/etc/passwd`, comme avec `cut`:
```bash
info@debian:~$ awk -F':' '{print $1, $3}' /etc/passwd
```

[Faire les exercices 1,2,3](https://github.com/cegepmv/420-113-MV/tree/main/exercices/UtilitairesLigneCommande/)
