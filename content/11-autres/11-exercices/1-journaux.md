+++
pre = '<b>1. </b>'
title = 'Journaux'
date = 2025-11-18T13:41:22-05:00
weight=1
+++
---------------------
Sur une VM:

- Installez le programme nginx avec la commande :
```bash
sudo apt install nginx
````

* À partir de Windows, ouvrez une page web à la même adresse que vous avez utilisée pour vous connecter par PuTTY.

**Exercices :**

1. Combien y a-t-il de lignes dans le fichier `/var/log/nginx/access.log` ?

2. Faites la commande :

```bash
tail -f /var/log/nginx/access.log
```

puis rechargez la page dans Firefox. D’après ce que vous observez, quelles informations contient le fichier `/var/log/nginx/access.log` ?

3. Y a-t-il une différence dans ce fichier selon que vous ouvrez la page dans Firefox, dans Edge ou dans Chrome ?

4. Renommez avec le nom de votre choix le fichier `/etc/nginx/nginx.conf`, puis lancez la commande :

```bash
sudo systemctl restart nginx
```

Quel message apparaît dans `/var/log/nginx/error.log` ? Que pouvez-vous faire pour corriger cette erreur ?

5. Supprimez le fichier `/var/www/html/index.nginx-debian.html` puis rechargez la page dans Firefox. Quelle est la différence avec les messages précédents dans `access.log` ?

6. Dans Firefox, ouvrez la page :

```
http://1.2.3.4/accueil.html
```

(remplacez `1.2.3.4` par l’adresse de votre VM). Quelle est la différence avec les messages précédents dans `access.log` ?

7. Créez le fichier `/var/www/html/accueil.html` et écrivez-y ce que vous voulez, puis rechargez la page dans Firefox.

```

Si tu veux, je peux aussi te **attribuer des numéros de prérequis et exercices exactement comme dans ton premier exemple**, pour que ce soit prêt à copier-coller dans ton dépôt ou ton LMS. Veux‑tu que je fasse ça ?
```
