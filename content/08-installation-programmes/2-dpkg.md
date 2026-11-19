+++
title = "dpkg"
weight = "820"
+++
---------------------

Certains développeurs logiciels préfèrent ne pas inclure leurs applications aux dépôts officiels et distribuer directement les paquets. Dans les distributions Debian et les dérivées, ces paquets sont des fichiers ayant l'extension `.deb`. Pour les installer, on peut utiliser le programme `dpkg`.

{{% notice style="warning" title="Attention" %}}
Contrairement à `apt`, `dpkg` **ne télécharge pas et n'installe pas les dépendances**. Si une dépendance est absente du système, l'installation échoue et le paquet reste « non configuré ». On peut alors corriger la situation avec `sudo apt --fix-broken install` (voir la section sur `apt`).
{{% /notice %}}

Ce programme dispose de quelques options:

|Option|	Utilité|	Exemple|
|------|-----------|-----------|
|-i|Installe le paquet contenu dans le fichier `.deb` spécifié.|`dpkg -i app1.deb`|
|-r|Supprime le paquet spécifié (par son **nom**), mais conserve ses fichiers de configuration.|	`dpkg -r app1`|
|-P|Purge le paquet spécifié (par son **nom**) : supprime le paquet **et** ses fichiers de configuration. Les dépendances ne sont pas supprimées.|	`dpkg -P app1`|
|-l|Affiche la liste des paquets installés|	`dpkg -l`|
|-I|Affiche les informations d'un fichier `.deb` (version, dépendances, description, etc.) sans l'installer.|	`dpkg -I app1.deb`|
|-L|Affiche la liste des fichiers installés sur le système par un paquet.|	`dpkg -L app1`|
|-S|Affiche le nom du paquet qui a installé le fichier spécifié.|	`dpkg -S /usr/bin/ls`|

{{% notice style="info" title="Remarque" %}}
Seules les options `-i` et `-I` prennent un fichier `.deb` en argument. Les options `-r`, `-P` et `-L` prennent le **nom du paquet** installé (par exemple `app1`), tel qu'il apparaît dans `dpkg -l`.

Exemple avec `-S`:
```bash
info@debian:~$ dpkg -S /usr/bin/ls
coreutils: /usr/bin/ls
```
{{% /notice %}}
