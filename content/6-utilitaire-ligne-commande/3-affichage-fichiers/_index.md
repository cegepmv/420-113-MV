+++
title = 'Affichage de fichiers'
weight = "630"
+++

La commande `cat` est bien utile pour afficher le contenu d'un fichier mais elle ne permet pas de bien contrôler cet affichage. Ceci peut être ennuyeux lorsque les fichiers à afficher sont très grands ou lorsqu'on n'a besoin que d'afficher un certain nombre de lignes de ceux-ci.

Il existe d'autres commandes pour afficher les fichiers texte qui se révèlent très utiles dans ces contextes.

### `head`
Affiche les *n* premières lignes d'un fichier. Le nombre de lignes est passé comme une option à la commande; par exemple pour afficher les 5 premières lignes d'un fichier on fera la commande suivante:
```bash
info@debian:~$ head -5 /etc/passwd
```
Si on ne spécifie pas un nombre de lignes en particulier, `head` affiche les 10 premières lignes.

### `tail`
Semblable à `head`, mais pour les *n* **dernières** lignes d'un fichier:
```bash
info@debian:~$ tail -5 /etc/passwd
```
Si on ne spécifie pas un nombre de lignes en particulier, `tail` affiche les 10 dernières lignes.

### `more`
Lorsqu'un fichier contient trop de lignes pour s'afficher en entier dans le terminal, `more` permet de l'afficher page par page. 
+ La barre d'espacement permet d'aller à la page suivante;
+ a flèche du haut de revenir au début de l'affichage.
```
info@debian:~$ more /etc/passwd
```

### `less`
La commande `less` est semblable à `more` mais dispose de fonctionnalités plus évoluées. Elle permet notamment de parcourir un fichier ligne par ligne avec les flèches, ou encore de faire une recherche de chaînes de caractères avec `/`.

```bash
info@debian:~$ less /etc/passwd
```