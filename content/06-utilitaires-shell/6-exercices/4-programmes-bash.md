+++
pre = '<b>4. </b>'
title = "Programmation bash"
weight = "664"
+++
---------------------

Faire les programmes suivants (autant que possible, prévenez les erreurs dans votre code):


### `salutation.sh` 
Demander à l'utilisateur son nom et son prénom et lui afficher un message avec son nom.
```bash
info@debian:~$ ./salutation.sh 
SVP entrez votre prénom
Cave
SVP entrez votre nom
Johnson
Bonjour Cave Johnson
info@debian:~$
```

### `init.sh` 
Demander un nom et créer, dans le répertoire courant, un répertoire avec ce nom et 3 sous-répertoires nommés perso, documents et bin. Si le répertoire existe déjà il est supprimé avec tout son contenu.
```bash
info@debian:~/scripts$ ./init.sh 
Quel nom voulez-vous donner au répertoire?
boum
info@debian:~/scripts$ ls
boum  init.sh
info@debian:~/scripts$ ls boum
bin  documents  perso
```

### `parent.sh`
Demander à l'utilisateur d'entrer le chemin complet d'un répertoire puis déplacer ce répertoire dans le même répertoire que son parent.
```bash
info@debian:~/scripts$ ls
parent.sh  rep
info@debian:~/scripts$ ls rep
sous-rep
info@debian:~/scripts$ ./parent.sh 
Entrez le chemin complet du répertoire
/home/info/scripts/rep/sous-rep	
info@debian:~/scripts$ ls
parent.sh  rep  sous-rep
```

### `repdate.sh`
Créer dans le répertoire courant un répertoire dont le nom correspond à la date au format AAAAMMJJ (utilisez une combinaison des commandes date et cut).
```bash
info@debian:~/scripts$ ls
repdate.sh
info@debian:~/scripts$ ./repdate.sh 
info@debian:~/scripts$ ls
2022nov20  repdate.sh
info@debian:~/scripts$
```

### `chrono.sh`
Faire un programme qui demande à l'utilisateur quelle commande il veut lancer et affiche son résultat puis le nombre de secondes que la commande à pris pour s'exécuter (la commande date +%s vous sera utile).
```bash
info@debian:~$ ./chrono.sh 
Quelle commande voulez-vous exécuter?
grep -r "pa$$w0rd" /usr/share
Temps d'exécution: 7 secondes
info@debian:~$
```


