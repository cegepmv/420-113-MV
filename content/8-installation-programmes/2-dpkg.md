+++
title = "dpkg"
weight = "820"
+++
---------------------

Certains développeurs logiciels préfèrent ne pas inclure leurs applications aux dépôts officiels et distribuer directement les paquets. Dans les distributions Debian et les dérivées, ces paquets sont des fichiers ayant l'extension `.deb`. Pour les installer, il ne faut pas utiliser `apt`, mais plutôt le programme `dpkg`. Comme `apt`, `dpkg` télécharge et installe les dépendances du programme si elles sont absentes du système. Ce programme dispose de quelques options:

|Option|	Utilité|	Exemple|
|------|-----------|-----------|
|-i|Installe la paquet spécifié.|`dpkg -i app1.deb`|
|-r|Supprime le paquet spécifié mais conserve ses dépendances.|	`dpkg -r app1.deb`|
|-P|Supprime les dépendances du paquet spécifié, y compris le paquet lui-même s'il n'est pas supprimé.|	`dpkg -P app1.deb`|
|-l|Affiche la liste des paquets installés|	`dpkg -l`|
