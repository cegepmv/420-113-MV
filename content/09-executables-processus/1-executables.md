+++
title = "Exécutables"
weight = "910"
+++
---------------------

Un exécutable est un fichier qui contient des instructions. Ces instructions sont organisées dans un programme qui définit les étapes de la tâche qu'on veut faire exécuter par l'ordinateur.

Les exécutables peuvent être des fichiers *binaires* ou des *fichiers texte*.

Lorsque le programme est codé dans un langage comme C, C++, C#, Java, Go ou Rust, il ne peut pas être exécuté tel quel: on doit utiliser un programme qu'on appelle **compilateur** pour obtenir à partir du code le fichier binaire qui, lui, sera exécutable. Ce fichier binaire contient des instructions en "langage machine" qui sont directement lues par le CPU. On parle dans ce cas de **langage compilé**.

Lorsque le programme est codé dans un langage comme Javascript, Python, bash, Lua, Ruby ou Powershell, il faut lancer un autre programme qu'on appelle **interpréteur** qui lit le code ligne par ligne et le traduit en instructions qu'il envoit ensuite au CPU. On parle dans ce cas de **langage interprété**.

Dans ce qui suit nous allons voir à l'aide d'un exemple la différence entre langages compilés et interprétés.

## Hello World compilé
Attention, pour faire ce qui suit vous aurez besoin d'installer le paquet logiciel build-essential avec la commande suivante:

```bash
info@debian:~$ sudo apt install build-essential
```

Nous allons créer un programme qui affiche "Bonjour" dans la console. Dans votre répertoire personnel, crééz un fichier source en langage C nommé `hello.c` et ajoutez-y les lignes suivantes:

```c
#include <stdio.h>

int main() {
    printf("Bonjour\n");
    return 0;
}
```
La commande suivante compile le programme; par défaut, le fichier binaire exécutable qui est créé par la compilation se nomme `a.out`:

```bash
info@debian:~$ gcc hello.c 
```

Pour spécifier un nom à l'exécutable généré, il est possible d'utiliser l'option `-o`. L'exemple ci-dessous va générer un exécutable nommé `custom.out` : 
```bash
info@debian:~$ gcc hello.c -o custom.out
```

Pour exécuter le programme, il suffit de l'appeler par son nom:

```bash
info@debian:~$ /home/info/a.out
info@debian:~$ # ou
info@debian:~$ /home/info/custom.out
```

## Hello World interprété
Ici notre programme qui affiche "Bonjour" sera codé en langage *python*. Dans votre répertoire personnel, crééz un fichier source nommé `hello.py` et ajoutez-y la ligne suivante:

```bash
print("Bonjour\n")
```

Pour exécuter le programme, vous devez appeler l'interpréteur `python`. Lancez la commande suivante:
```bash
info@debian:~$ python /home/info/hello.py
```

Il existe une façon d'appeler l'interpréteur implicitement, *"de l'intérieur"* du programme. Il s'agit d'ajouter, comme première ligne du programme, le chemin complet de l'interpréteur, comme suit:
```python
#!/usr/bin/python3
print("Bonjour\n")
```
Ensuite il faut rendre exécutable le fichier avec la commande `chmod a+x hello.py`, puis vous pourrez le lancer directement comme suit:
```bash
info@debian:~$ /home/info/hello.py
```
L'avantage d'utiliser cette méthode est que les programmes, qu'ils soient interprétés ou compilés, peuvent être exécutés de la même manière, en les appelant simplement par leur nom.
