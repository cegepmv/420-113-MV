+++
pre = '<b>2. </b>'
title = 'Permissions'
weight = "722"
+++
--------------------

1. Créez le fichier `/tmp/f1`. Quel groupe et quel utilisateur en sont les propriétaires? Quelles sont les permissions des autres utilisateurs sur ce fichier?

2. Ajoutez les permissions d’écriture pour les membres du groupe propriétaire afin d’obtenir `-rw-rw-r--`. Utilisez la notation symbolique et la notation octale.

3. Donnez les permissions de lecture, d’écriture et d’exécution à tous afin d’avoir `-rwxrwxrwx`. Utilisez la notation symbolique et la notation octale.

4. Créez 3 utilisateurs: `amine`, `bryan` et `clo`. 

5. Dans le répertoire personnel de `clo`, créez un fichier nommé `plan.txt`.

6. Ajoutez `amine` et `bryan` dans un groupe nommé `collab`.

7. Avec la commande `chmod`, donnez les droits `rw` aux membres du groupe `collab` sur le fichier `plan.txt`

8. Testez ce que vous avez fait en vous connectant comme `amine` puis `bryan` puis en essayant de modifer `/home/clo/plan.txt` avec le programme `nano`

9. Créez deux groupes nommés `rouge` et `bleu`, puis un utilisateur nommé `fred` membre du groupe `rouge`. Il doit avoir un répertoire personnel et un mot de passe.

10. Déconnectez-vous puis ouvrez une session avec le compte de `fred`.

11. Créez le fichier `/home/fred/doc25`.

12. Changez le groupe du fichier `doc25` pour `rouge` avec la commande `chown`.

13. Essayez de changer le groupe du fichier `doc25` pour bleu avec la commande `chown`. Pourquoi selon vous l’opération n’est-elle pas permise?