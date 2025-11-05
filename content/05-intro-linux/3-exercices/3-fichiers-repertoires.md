+++
pre = '<b>3. </b>'
title = "Fichiers et répertoires"
weight = "533"
+++
------------------

### Exercice 3

Écrivez les commandes complètes pour réaliser ce qui est demandé (sauf pour la Q7).

1. Créez le répertoire `dir1` dans votre répertoire personnel. 


2. À partir de votre répertoire personnel, en une seule commande, créez le répertoire `/tmp/dir/subdir/subsubdir`. 


3. Créez le fichier vide `fi1` dans le répertoire `dir1` créé plus haut. 


4. Faites une copie de `fi1` nommée `copie1` dans le même répertoire. 


5. Copiez le fichier `/etc/hosts` dans votre répertoire `dir1`. 


6. Supprimez le fichier `~/dir1/hosts`.


7. À partir de votre répertoire personnel, lancez la commande cp `/etc/h* dir1`. Que s'est-il passé?


8. Copiez `fi1` à la racine du système de fichier. Que se passe-t-il? 


9. Déplacez le fichier `fi1` dans votre répertoire personnel.


10. Déplacez `fi1` dans le répertoire `/home`. Que se passe-t-il?


11. Déplacez `/etc/hosts` dans votre répertoire `dir1`. Que se passe-t-il?


12. En une commande, supprimez `dir1` et tout son contenu.

### Exercice 4

*Pour les questions 1-4, donnez la commande complète.*
1. Créez un répertoire nommé `import` dans votre répertoire personnel et copiez y tous les fichiers qui commencent par la lettre *"a"* dans le répertoire `/etc/init.d`.


2. Copiez vers `import` tous les fichiers et répertoires dont le nom commence par *"ba"* dans `/usr/share`. 


3. Créez les répertoires `~/abc/def/ghi/jkl/mno/pqr` dans votre répertoire personnel et copiez-y le contenu de `import`.


4. Déplacez le répertoire `pqr` dans `~/Bureau` puis supprimez `~/abc/def/ghi/jkl/mno/`.


5. Créez un lien symbolique vers le répertoire `/var/mail` dans `~/Bureau/pqr`.

Répondez aux questions suivantes:

6. Quel est le fichier dans `~/import/base-files` qui a la plus grande taille?


7. Quelle est la première ligne du fichier `~/import/base-files/dot.profile.md5sums` ?


8. Il est possible de spécifier plus d'une source à la commande `cp`, par exemple `cp source1 source2 source3 ... cible`. Quel effet a cette commande? Cherchez dans le manuel pour vous aider.


9. Créez 3 fichiers nommés `f1`, `f2` et `f3` et trois répertoires nommés `dir1`, `dir2` et `dir3`. Lancez ensuite la commande suivante : 
```bash
cp f* dir*.
``` 

Quel est l'effet de cette commande, et comment expliquez-vous ce qui s'est passé?


10. Créez un répertoire nommé `defaut`, puis lancez la commande suivante : 
```bash
cp -s /etc/defaut/* defaut/
```
Quel est l’effet de cette commande?

11. Avec la commande `ls`, affichez le contenu du répertoire defaut qui vous avez créé au numéro précédent. Quel est l’effet de l’option « -L » sur l’affichage?

