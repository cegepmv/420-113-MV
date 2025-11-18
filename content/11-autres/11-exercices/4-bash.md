+++
pre = '<b>4. </b>'
title = 'Bash'
date = 2025-11-18T13:45:06-05:00
weight=4
+++


**Exercices :**

1. **jour.sh**  
Écrire un script qui demande un nombre à l'utilisateur et affiche le nom du jour correspondant (0=dimanche, 1=lundi, etc.).  
Afficher « Valeur non reconnue » si l'utilisateur entre autre chose qu'un nombre de 0 à 6.  

Exemple d’exécution :
```bash
info@debian:~$ ./jour.sh 
SVP entrez un nombre
4
jeudi
````

2. **info.sh**
   Écrire un script qui affiche le message :

```
Souhaitez-vous voir:
  (1) L'espace libre sur le disque
  (2) L'espace occupé sur le disque
  (3) L'espace occupé par le répertoire courant
```

et affiche ensuite le résultat de la commande appropriée (`df` pour disque, `du` pour répertoire) selon l’option choisie.

Exemple d’exécution :

```bash
info@debian:~$ ./info.sh 
Souhaitez-vous voir:
  (1) L'espace libre sur le disque
  (2) L'espace occupé sur le disque
  (3) L'espace occupé par le répertoire courant
1
/dev/sda1          13G
```

3. **creerRep.sh**
   Écrire un script qui demande un nombre à l’utilisateur, puis crée autant de fichiers nommés `f1`, `f2`, `f3`, … dans le répertoire `~/test`.

Exemple d’exécution :

```bash
info@debian:~$ ./creerRep.sh 
Entrez le nombre de fichiers à créer
9
info@debian:~$ ls test/
f1  f2  f3  f4  f5  f6  f7  f8  f9
```

4. **menu.sh**
   Écrire un script qui affiche le menu suivant et effectue les opérations selon l’option choisie.
   Le menu se réaffiche après chaque choix. Afficher « Votre choix est invalide » si l’utilisateur entre une option non prévue.

Menu :

```
Souhaitez vous :
  (1) Vous déplacer à la racine
  (2) Vous déplacer dans votre répertoire personnel
  (3) Vous déplacer dans le dossier parent du répertoire actuel
  (4) Effectuer une commande
  (q) Quitter
```

5. **sauvegarde.sh**
   Écrire un script qui utilise le fichier `listerep.txt` contenant des noms complets de répertoires et crée une archive `sauvegarde.tar.gz` de tous ces répertoires.

Exemple : si `listerep.txt` contient :

```
/home/info/test
/etc/network
/etc/ssl/certs
```

la commande exécutée sera :

```bash
tar czf sauvegarde.tar.gz /home/info/test /etc/network /etc/ssl/certs
```

