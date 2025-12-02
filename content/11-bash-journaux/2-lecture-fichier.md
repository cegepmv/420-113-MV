+++
pre = '<b>2. </b>'
title = 'Lecture de Fichier'
date = 2025-11-20T08:38:38-05:00
weight=1102
+++

Les boucles *while* sont souvent utilisées pour lire une à une les lignes d'un fichier. Dans ce cas on doit utiliser une redirection *à partir* d'un fichier avec l'opérateur `<`, comme suit:
```sh
while read ligne; do
	echo $ligne | wc -m
done < fichier.txt
```
Dans cet exemple la commande `wc -m` permet de compter le nombre de caractères (incluant les sauts de ligne) de chaque ligne du fichier.

Voici des **notes de cours claires et complètes** basées sur l’exemple fourni.
Elles expliquent **comment lire efficacement un fichier ligne par ligne en Bash**, surtout lorsqu'on utilise un séparateur comme la virgule dans un fichier CSV.

---

# 📘 Notes de cours — Lecture de fichiers CSV en Bash

## 🎯 Objectif du cours

Apprendre à lire efficacement un fichier texte contenant plusieurs champs séparés par des virgules (format CSV), et à assigner chaque champ à une variable distincte grâce à la boucle `while read`.

---

# 1. 💡 Pourquoi utiliser `IFS=','` ?

`IFS` = *Internal Field Separator*
Il indique à `read` quel caractère utiliser pour séparer les champs.

Dans un fichier CSV, les colonnes sont souvent séparées par **`,`**, donc :

```bash
IFS=','
```

permet d’éclater chaque ligne en plusieurs variables.

---

# 2. 📥 Structure de base pour lire un fichier CSV

Voici la structure fournie :

```bash
while IFS=',' read -r DA NOM PRENOM NOTE || [ -n "$DA" ]; do

done < fichier.txt
```

### 🔍 Explication ligne par ligne

| Élément                  | Rôle                                                  |               |                                                                                  |
| ------------------------ | ----------------------------------------------------- | ------------- | -------------------------------------------------------------------------------- |
| `while ...; do ... done` | Boucle qui lit le fichier ligne par ligne             |               |                                                                                  |
| `IFS=','`                | Spécifie que les champs sont séparés par des virgules |               |                                                                                  |
| `read -r`                | Lit une ligne sans interpréter les backslashes        |               |                                                                                  |
| `DA NOM PRENOM NOTE`     | Variables où sont stockés les champs de la ligne      |               |                                                                                  |
| `< fichier.txt`          | Indique le fichier à lire                             |               |                                                                                  |
| `                        |                                                       | [ -n "$DA" ]` | Permet de traiter la dernière ligne même si elle n’a pas de fin de ligne (EOF)** |

---

# 3. 🧠 Pourquoi ajouter `|| [ -n "$DA" ]` ?

Normalement, si la dernière ligne du fichier ne finit pas par un retour à la ligne (`\n`), elle **n’est pas lue**.

Ce correctif garantit que :

* si `read` échoue à cause de EOF,
* mais que la variable `DA` contient encore quelque chose,
  ➡️ alors la ligne est quand même traitée.

Très utile pour les fichiers CSV « mal formés ».

---

# 4. 📄 Exemple du fichier (CSV)

Le fichier contient les infos suivantes :

```
482913,dupont,marie,73
915374,lefebvre,pierre,61
703822,moreau,luc,84
128445,lambert,emma,47
559201,robert,noah,90
334892,petit,lea,52
791205,bernard,louis,6
```

Chaque ligne contient 4 colonnes :

1. **DA** → numéro d'étudiant
2. **NOM**
3. **PRÉNOM**
4. **NOTE**

---

# 5. 🔧 Exemple d'utilisation dans la boucle

Vous pouvez maintenant manipuler chaque variable dans la boucle :

```bash
while IFS=',' read -r DA NOM PRENOM NOTE || [ -n "$DA" ]; do
    echo "DA : $DA | Nom : $NOM | Prénom : $PRENOM | Note : $NOTE"
done < fichier.txt
```

Sortie :

```
DA : 482913 | Nom : dupont | Prénom : marie | Note : 73
DA : 915374 | Nom : lefebvre | Prénom : pierre | Note : 61
...
```

---

# 6. 🛠️ Points importants à retenir

✔ `read` découpe la ligne selon `IFS`
✔ Chaque colonne du CSV va dans une variable
✔ `-r` empêche `read` de modifier le texte
✔ `|| [ -n "$DA" ]` permet de lire la dernière ligne même sans `\n`
✔ `done < fichier.txt` est plus propre que `cat fichier.txt | while read`

---




## Arguments d'un programme
De la même façon que les commandes peuvent avoir des arguments, il est possible d'en passer à un script *bash* lorsqu'on le lance, comme suit:
```
info@debian:~$ ./prog.sh abc def
```
Dans cet exemple le programme est appelé avec deux arguments, "abc" et "def". Ceux-ci peuvent désigner des chaînes de caractères, des fichiers, des nombres et même être des variables. Les arguments peuvent être traités à l'intérieur du programme.

Des variables spéciales peuvent être utilisées dans le programme pour référer aux arguments passés. Le tableau suivant en fait la liste:

| Variable | Valeur |
| -------- | ------ |
| `$0` | Le nom du fichier du programme |
| `$1`, `$2`, etc. | Le 1er, 2e, etc. argument du programme |
| `$#` | Le nombre d'arguments passés au programme |
| `$@` | La liste des arguments du programme |

Le programme suivant illustre comment ces variables peuvent être utilisées:
```sh
#!/bin/bash
echo "Le programme se nomme $0"
echo "Il a été appelé avec $# arguments"
echo "Le premier argument est $1"
echo "Le deuxième argument est $2"
```
