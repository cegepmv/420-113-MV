+++
pre = '<b>3. </b>'
title = "Atelier d'intégration"
weight = "943"
+++
---------------------


<!-- 
À rajouter au chapitre Réseau !!!
## Installation su service *OpenSSH* et connexion à distance avec *putty*
+ Avec `apt`, installez le paquet `openssh-server`
+ Trouvez l’adresse IP de votre VM Debian avec la commande `ip address`. Elle est composée de 4 nombres entre 0 et 255. 
+ Sur Windows, lancez le programme putty
+ Dans la case « Host Name (or IP address) », entrez l’adresse de votre VM Debian
+ Faites « Accept » dans la boîte de dialogue qui apparaît lors de la première connexion.
+ Ouvrez une session normalement avec l’utilisateur info -->

## Différentes valeurs de PATH
1. Quelles commandes parmi les suivantes doivent être appelées avec sudo?
    + `cat`
    + `mv`
    + `adduser`
    + `nano`

2. Qu'est-ce qui s'affiche lorsque vous tapez la commande `which mv`?

3. Dans quels répertoires se trouvent les fichiers exécutables des commandes suivantes?
    + `cat`
    + `mv`
    + `adduser`
    + `nano`
    + `sudo`

4. Lancez la commande `env`. Dans la liste des variables d'environnement qui s'affiche, quelle est la valeur de `PATH`?

5. Lancez la commande sudo `env`. Dans la liste des variables d'environnement qui s'affiche, quelle est la valeur de `PATH`?

6. Quels répertoires contiennent les programmes qui ont besoin des permissions de `root` pour être exécutés?

## Modifier la valeur de PATH
7. Affichez la valeur de PATH avec la commande suivante:
```bash
echo $PATH
```
Tapez ensuite la commande suivante:
```bash
PATH=abcdef
```
Quelle est la nouvelle valeur de `PATH`?

8. Essayez d’afficher la liste des fichiers dans le répertoire courant. Quelle commande complète devez-vous utiliser?

9. Quelle est la commande complète qui vous permet d'afficher le contenu du fichier `/etc/shadow`?

10. Quelle commande vous permet de redonner à la variable PATH son ancienne valeur?

11. Créez une variable nommée `XYZ` dont la valeur est `abcdef`. Affichez son contenu avec echo. Ensuite, tapez la commande suivante:
```bash
PATH=$PATH$XYZ
```
Quelle est la nouvelle valeur de la variable PATH?

## Différentes façons d’utiliser les répertoires de PATH

12. Faites un fichier nommé `inverser.py` avec le code en python suivant :
```python
# Programme pour inverser un mot

# Demander à l'utilisateur de saisir un mot
mot = input("Entrez un mot : ")

# Inverser le mot en utilisant le slicing
mot_inverse = mot[::-1]

# Afficher le résultat
print(f"Le mot à l'envers : {mot_inverse}")
```
Ce script python demande à l'utilisateur de saisir un mot et l'affiche ensuite à l'envers. Faites en sorte que ce programme puisse être exécuté sans appeler l'interpréteur.

13. Modifiez la variable `PATH` pour pouvoir exécuter ce programme en tapant simplement `inverser.py`, à partir de n'importe quel répertoire. 

14. Fermez le terminal et démarrez-en un nouveau. Quelle est la valeur de `PATH` dans ce terminal?

15. Créez un lien symbolique dans le répertoire `/usr/local/bin` qui pointe vers le programme `inverser.py` avec la commande suivante :
```bash
sudo ln -s /home/info/inverser.py /usr/local/bin/ 
```
Quel est le résultat de la commande `which inverser.py`?

16. Déplacez le fichier `/home/info/inverser.py` dans le répertoire `/usr/local/bin`. Qu'est-il arrivé au lien symbolique?

17. Créez un lien symbolique qui a pour effet que le programme `/usr/local/bin/inverser.py` peut être appelé tapant simplement `invers`, à partir de n'importe quel répertoire.