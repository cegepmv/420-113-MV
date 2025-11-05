+++
pre = '<b>3. </b>'
title = 'Permissions'
weight = "723"
+++
--------------------

1. Ouvrez une session avec l'utilisateur `root` puis créez un utilisateur nommé `alex`.

2. Fermez votre session `root` puis ouvrez une session en tant que `alex`. Êtes-vous capable de lister le contenu du répertoire `/root`? Pourquoi? Quelle commande permet de savoir quelles sont les permissions sur ce répertoire?

3. Ouvrez une session en tant que `info`. Êtes-vous capable de lister le contenu du répertoire `/root`? Pourquoi? Quelle commande permet de savoir quelles sont les permissions sur ce répertoire?

4. La commande `sudo` permet à un utilisateur ordinaire de prendre temporairement les permissions de `root`. Quelle commande permettrait à l’utilisateur `info` de créer le fichier `/root/test.txt`?

5. Quelle commande permettrait à l’utilisateur `info` de lire le fichier `/var/log/syslog`?

6. Fermez votre session puis ouvrez de nouveau une session en tant que `alex`. Pouvez-vous utiliser `sudo` pour lire le fichier `/var/log/syslog`?  

7. Que devez-vous faire pour que l’utilisateur `alex` puisse utiliser la commande `sudo`?