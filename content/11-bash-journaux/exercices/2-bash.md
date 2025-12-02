+++
pre = '<b>2. </b>'
title = 'Lecture de fichier'
date = 2025-11-20T08:47:33-05:00
weight=1102
+++
## 1
Dans votre containeur, créer un fichier « /root/listeEtudiants.txt » qui contient les informations sur l’évaluation des élèves d’un groupe fictif. Le format est le suivant :
Numéro d’identification, Nom de famille, Prénom, Note

Indice : Voici la structure de base pour accélérer la lecture de ligne dans ce fichier.

```bash
while IFS=',' read -r DA NOM PRENOM NOTE || [ -n "$DA" ]; do

done < fichier.txt
```

```txt
482913,dupont,marie,73
915374,lefebvre,pierre,61
703822,moreau,luc,84
128445,lambert,emma,47
559201,robert,noah,90
334892,petit,lea,52
791205,bernard,louis,68
220954,richard,sara,79
684552,roy,julien,31
908123,gagnon,claire,87
517664,bouchard,eric,44
772901,fontaine,nina,70
446328,perreault,marc,26
311290,simard,zoe,95
854762,gauthier,yan,38
129774,caron,chloe,82
963511,belanger,max,57
240889,pelletier,lina,63
675420,girard,tom,22
890512,ouellet,jade,91
428703,hebert,louka,55
364192,paquette,simon,49
579904,legault,romy,88
715683,thibault,ana,33
901277,lapointe,alex,60
553844,morin,lucas,74
669310,bilodeau,mae,81
```

Section 1
Affiche « prénom nom note » pour tous les étudiants. Ainsi, les 2 premiers afficheront :
```
marie dupont 73
pierre lefebvre 61
```
Vous devez afficher tous les étudiants, ceci n’est qu’un exemple.

Section 2
Affiche la moyenne du groupe. Vous ne pouvez pas la « hard coder ».

```
La moyenne est de XX%
```

## 2

Créer un script qui lit le fichier suivant et qui crée les fichiers avec le contenu indiqué sur la même ligne.

Format : contenu;chemin
```
Hello world;hello.txt
#!/bin/bash\necho "Script exécuté";/root/script.sh
Ceci est une note importante.;/root/ecole/note.txt
Ligne 1 d’un fichier\nLigne 2 d’un fichier\nLigne 3 d’un fichier;/root/multilignes.txt
```
Pour que les \n soient bien compris, vous devez utiliser echo -e

## 3

Créer le programme `additionner.sh` qui prend 2 arguments. Les additionnes et affiche le résultat.

```bash
bash additionner.sh 4 55
```

donne

```
59
```
