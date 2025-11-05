+++
pre = '<b>1. </b>'
title = "Fichiers exécutables"
weight = "941"
+++
---------------------

1. Créez un fichier source nommé `compteur.c` contenant le code suivant, compilez-le puis nommez l’exécutable `compt` :
```c
#include <stdio.h>

int main() {
        for (int i=0;i<10;i++) {
                printf("%d\n",i);
        }
        return 0;
}
```
Exécutez ensuite le programme avec la commande `./compt`. Quel est le résultat?


2. Copiez le fichier exécutable dans un des répertoires du `PATH` de votre choix. Quel est ensuite le résultat de la commande `which compt`?

3. Créez un programme python nommé `fibs.py` contenant le code suivant :
```python
limite = int(input("Spécifiez un nombre maximum: "))
n1,n2 = 0,1
while n1 < limite:
        print(n1)
        next = n1+n2
        n1 = n2
        n2 = next
```
Testez le programme avec la commande `python3 fibs.py`

4. Modifiez le fichier et ses permissions puis copiez-le dans un des répertoires du `PATH` pour pouvoir l’exécuter en tapant uniquement `fibs.py`.

5. Installez l’application cadaver en la clonant du dépôt github suivant :
```bash
git clone https://github.com/elerch/cadaver.git
```

puis lancez les commandes habituelles (configuration, compilation, installation). 

Pourquoi la commande `./configure` doit-elle être précédée de « `./` » ?

6. Dans quel répertoire le fichier exécutable a-t-il été installé? Utilisez la commande which.

