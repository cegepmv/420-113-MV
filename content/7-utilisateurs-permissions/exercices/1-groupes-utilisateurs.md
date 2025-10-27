+++
pre = '<b>1. </b>'
title = 'Groupes et utilisateurs'
weight = "721"
+++
--------------------

1. Créez un utilisateur nommé `sam` avec la commande `adduser`. Testez votre commande en ouvrant une session pour cet utilisateur.

2. Créez un utilisateur nommé `tom` avec la commande `useradd` et les options requises, puis donnez-lui un mot de passe avec `passwd`. Testez votre commande en ouvrant une session pour cet utilisateur.

3. Créez le groupe `dev` avec la commande `groupadd`.

4. Ajoutez tom au groupe `dev` avec la commande `usermod`.

5. Créez le groupe `net` avec la commande `addgroup`. 

6. Créez un utilisateur nommé `gus` et ajoutez-le au groupe `net` **en une seule commande**. Donnez-lui ensuite un mot de passe avec `passwd`. Testez votre commande en ouvrant une session pour cet utilisateur.

7. Changez le nom de l’utilisateur `tom` pour `thomas` et ajoutez-le au groupe `net`.

8. Déplacez tous les fichiers de son répertoire personnel vers `/home/thomas`.