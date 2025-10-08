+++
pre = '<b>4. </b>'
title = "Programmation bash"
weight = "654"
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