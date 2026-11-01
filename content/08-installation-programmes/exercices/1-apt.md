+++
pre = '<b>1. </b>'
title = 'apt'
weight = '841'
+++


1. Avec la commande `apt search`, trouvez les noms de quelques applications permettant d’éditer des images et des photos.

2. Utilisez `apt show` pour trouver la version du logiciel photoflare qui est disponible dans les dépôts Debian.

3. Combien d’espace disque occupe `photoflare` une fois installé?

4. Quel est le nom du développeur du logiciel `cmatrix`?

5. Installez `cmatrix` avec apt.

6. En une seule commande, installez les programmes suivants `3dchess`, `dreamchess` et `gnome-chess`

7. Essayez d’installer le paquet `cytadela`. L’installation réussit-elle ou une erreur apparaît-elle?

8. Consultez la configuration des dépôts Debian : généralement `/etc/apt/sources.list.d/debian.sources` sur Debian 13 ou `/etc/apt/sources.list` pour le format traditionnel. Quelles catégories (`main`, `contrib`, `non-free`, `non-free-firmware`) sont activées?

9. Le programme `cytadela` fait partie des paquets de la catégorie `contrib`. Si nécessaire, modifiez la configuration des dépôts pour activer cette catégorie. Dans le format deb822, ajoutez `contrib` aux champs `Components` des sources concernées. Actualisez ensuite la liste des paquets avec `sudo apt update`.

10. Installez le programme `cytadela`.