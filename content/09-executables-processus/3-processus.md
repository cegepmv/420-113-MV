+++
title = "Processus"
weight = "930"
+++
---------------------

Lorsqu'on lance un programme, son exécution correspond à un processus. Dans un système d'exploitation, de nombreux processus s'exécutent simultanément. Chacun est identifié par un nombre (le *"Process ID"*, ou *PID*) et est associé à un utilisateur.

Afin de voir comment gérer les processus qui s'exécutent sur un système, nous allons créer un programme simple en C (nommé `loop.c`) qui contient une boucle infinie:

```c
#include <stdio.h>

int main() {
    while (1) {
        printf("Bonjour\n");
    }
}
```

Compilez-le puis exécutez-le. Ensuite, ouvrez un autre terminal: nous allons voir quelques commandes permettant de gérer des processus et de visualiser des informations qui les concernent.

## ps
La commande `ps` (*"Process Status"*) affiche la liste des processus en cours d'exécution. C'est une commande qui peut prendre de très nombreuses options; sans argument cependant, elle affiche les processus lancés à partir du terminal courant par l'utilisateur courant:

```bash
info@debian:~$ ps
    PID TTY          TIME CMD
   2237 pts/0    00:00:00 bash
   2249 pts/0    00:00:00 ps
```

Les colonnes contiennent les informations suivantes:

+ `PID` : L'identifiant du processus
+ `TTY` : Le terminal d'où le processus a été lancé
+ `TIME` : Le temps de CPU consacré à l'exécution du programme
+ `CMD` : La commande ayant lancé le programme

Les options les plus courantes sont celles-ci (attention, pour la commande ps certaines options sont précédées d'un tiret, d'autres non):

|Option	|Utilité|Exemple|
|-------|-------|-------|
|-a	| Affiche les processus lancés à partir de tous les terminaux	|ps -a|
|u	| Affiche des colonnes supplémentaires, y compris le nom de l'utilisateur associé	|ps u|
|x	| Affiche les processus lancés même ceux qui ne sont pas associés à un terminal	|ps x|
|-e	| Affiche tous les processus sans restriction	|ps -e|
|-f	| Affiche un format de colonne complet avec plus d'informations |ps -f|

Il est possible de combiner des options, par exemple `ps -e u`.

## top
La commande `top` (*"Table of Processes"*) affiche une table qui présente en temps réel l'utilisation des ressources par l'ensemble des processus. On peut y voir les taux d'utilisation de la mémoire et du CPU entre autres. Cette commande est souvent utilisée lorsqu'on constate que le système ralentit et qu'on souhaite trouver le processus qui en est responsable.

Pour quitter le programme, appuyez la touche `q`.

## kill
Comme son nom le laisse supposer, cette commande supprime un processus en cours d'exécution. Elle doit être suivie du PID du processus à arrêter.

```bash
info@debian:~$ kill 9984
```

Pour arrêter tous les processus correspondant au nom d'une commande donnée, la commande est `killall`:

```bash
info@debian:~$ killall a.out
```

Il peut arriver que la commande `kill` ne parvienne pas à arrêter "proprement" un processus. Lorsque c'est le cas, on peut utiliser l'option `-9`; mais attention, l'arrêt est brutal et peut parfois entraîner des pertes de données (par exemple lorsque le processus est en train d'écrire dans un fichier au moment de son interruption):

```bash
info@debian:~$ kill -9 9984
```

## Gestion des processus

Il est aussi possible de stopper ou suspendre des processus en cours avec les touches de contrôle:

+ `CTRL-C` : Arrête le processus (comme `kill`)
+ `CTRL-Z` : Suspend le processus

Lorsqu'on suspend le processus, on reprend le contrôle de la ligne de commande, mais le processus n'est pas vraiment terminé: il est mis sur pause. Pour le redémarrer il existe deux commandes:

+ `fg` : Continue le processus sur la ligne de commande, en avant-plan ("foreground")
+ `bg` : Continue le processus en arrière-plan ("background"). Dans certains cas cela permet d'utiliser la ligne de commande durant l'exécution du programme.