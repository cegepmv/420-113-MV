+++
title = "apt"
weight = "810"
+++
---------------------

Le gestionnaire de paquets est une application qui permet de chercher les logiciels disponibles sur les dépôts, les installer, les mettre à jour et les désinstaller. Dans la distribution Debian ce programme est `apt`.

### apt
Utilitaire qui permet d'effectuer différentes opérations reliées à l'installation de programmes sur les distributions à base de *Debian*. Les opérations correspondent à la commande qu'on donne à `apt`; les plus communes sont décrites dans le tableau suivant :

|Commande| Utilité |  Exemple  |
|--------|---------|-----------|
|`install`|	Installe le paquet spécifié|	`apt install emacs`|
|`remove`|	Désinstalle le paquet spécifié|	`apt remove emacs`|
|`search`|	Recherche les paquets dont le nom ou la description contient le terme spécifié|	`apt search hex`|
|`show`  |	Affiche les informations sur un paquet|	`apt show cowsay`|
|`update`|	Met à jour la base de données locale des paquets disponibles sur les dépôts. Il est utile de lancer ce programme régulièrement.|`apt update`|

{{% notice style="info" title="Remarque" %}}
L'avantage d'utiliser `apt` pour installer des programmes est qu'il tient compte des dépendances: par exemple, si le logiciel `bmon` dépend de la librairie `libconfuse2` pour fonctionner correctement, `apt` se charge d'installer `libconfuse2` avant d'installer `bmon`.
{{% /notice %}}
Il est possible d'installer plusieurs paquets en même temps en énumérant chacun d'eux à la suite de la commande, comme suit:

```bash
info@debian:~$ sudo apt install app1 app2 app3
```
Pour plus de détails, faites `man apt`.

### /etc/apt/sources.list
Les serveurs qui contiennent les dépôts logiciels sont synchronisés: ils ont tous le même contenu et sont régulièrement mis à jour afin qu'ils soient tous des copies identiques les uns des autres. Afin d'avoir une bonne performance lors du téléchargement et de l'installation, il est recommandé de choisir un dépôt assez proche géographiquement d'où on se trouve.

Au moment de l'installation de Debian, il nous est demandé de choisir le dépôt qu'on souhaite utiliser. Si cependant on désire le changer, il faut modifier le fichier `/etc/apt/sources.list`.

Dans ce fichier chaque ligne définit l'url vers un des dépôts utilisés par `apt`. Le format est le suivant:

![source](/images/sources.list.svg)

Il est possible de spécifier plusieurs catégories sur la même ligne, par exemple `deb http://deb.debian.org/debian bullseye main contrib non-free`.

Lorsqu'on fait des modifications à ce fichier, il faut mettre à jour les informations locales sur les logiciels avec la commande `apt update`.
