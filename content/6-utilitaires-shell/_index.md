+++
pre = '<b>6. </b>'
title = 'Utilitaires du shell'
weight = "600"
+++
------------------

<!-- Jusqu'ici nous avons vu les commandes de base pour s'orienter, créer, modifier et supprimer des répertoires et fichiers dans le système de fichiers. Mais très souvent on a besoin de chercher des informations précises dans des fichiers et de les afficher ou les sauvegarder dans des formats particuliers. Dans ce chapitre nous allons voir quelles sont les commandes qui permettent d'effectuer ces tâches;

Mais tout d'abord, commençons par voir quelques fonctionnalités qui facilitent l'utilisation de la ligne de commande permettent de modifier le contenu d'un fichier.

Nous allons ensuite voir introduire à la programmation "shell" avec l'interpréteur de commandes *bash*. -->

### Historique
À chaque fois qu'on tape une instruction sur la ligne de commande, celle-ci est mémorisée. Ceci permet de voir l'historique des commandes lancées et aussi d'y revenir aisément. 

Pour voir cet historique, il suffit de lancer la commande `history`
```bash
info@debian:~$ history
    1  which mv
    2  which cat
    3  clear
    4  echo $PATH
    5  PATH=abcdef
    6  /usr/bin/clear
    7  history
```
On peut relancer une commande de l'historique en utilisant `!` suivi du numéro de la commande dans la liste. Par exemple:
```bash
info@debian:~$ history
    1  which mv
    2  which cat
    3  clear
    4  echo $PATH
    5  PATH=abcdef
    6  /usr/bin/clear
    7  history
info@debian:~$ !2
which cat
/usr/bin/cat
info@debian:~$
```
Il est aussi possible d'utiliser les flèches du haut et du bas sur le clavier pour naviguer dans l'historique afin de relancer une commande.

L'historique des commandes est sauvegardé dans le fichier `.bash_history` dans le répertoire personnel de l'utilisateur.

### Saisie automatique (*auto-complete*)
La fonction de saisie automatique permet de compléter automatiquement n'importe quel nom de commande qui fait partie du PATH ou n'importe quel nom de fichier ou répertoire. Par exemple, à l'invite, tapez la commande `ls -l M` puis faites la touche `TAB`:
```bash
info@debian:~$ ls -l M
Modèles/ Musique/
```
En appuyant sur la touche `TAB`, *bash* nous montre qu'il existe deux répertoires qui commencent par "M" et peuvent compléter la commande. Si on ajoute "o" et qu'on fait `TAB` de nouveau, *bash* complètera la commande automatiquement puisqu'il n'y a qu'un répertoire qui commence par "Mo":
```bash
info@debian:~$ ls -l Mo
```

### Éditeurs de textes en terminal (`nano`)

Savoir utiliser un éditeur de texte en terminal permet de manipuler des fichiers texte (de configuration, de scriptage etc...) sans interface graphique (contrairement à des outils comme `Word`, `VSCode`, ou `TextEdit`). 

Plusieurs éditeurs de texte en ligne de commande existent. Dans ce cours, nous allons voir `nano`, mais libre à vous d'aller explorer d'autres alternatives (notamment `vim` ou `emacs`) et choisir celui qui vous plaît le plus ! 

L'avantage de `nano` : sa simplicité. Facile à prendre en main, il constitue une excellente porte d’entrée pour comprendre le fonctionnement des éditeurs en terminal et pour développer de bonnes pratiques dans la gestion et l’édition de fichiers sous Linux.

Pour ouvrir `nano` pour éditer un fichier :

```bash
nano <chemin_du_fichier>
```

+ Si le fichier existe, il sera ouvert pour modification
+ S’il n’existe pas, `nano` va en créer un nouveau


Une fois le fichier ouvert, votre terminal affichera l’interface `nano` et le contenu du fichier.

![Interface de nano](/420-113-MV/images/6-utilitaires-shell/060001-nano.webp)

En bas de l’écran, vous verrez une liste de raccourcis. Le caret (`^`) signifie qu’il faut maintenir la touche `CTRL` enfoncée tout en appuyant sur la lettre qui suit.

Les raccourcis les plus utilisés : 

|Raccourci|Action|
|---------|------|
|Ctrl + O|Enregistrer (*write Out*)|
|Entrée	|Confirmer le nom du fichier lors de l’enregistrement|
|Ctrl + X|	Quitter|
|Ctrl + K|	Couper une ligne|
|Ctrl + U|	Coller une ligne|
|Ctrl + F|	Rechercher|
|Ctrl + G|	Aide (liste des commandes)|
