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
|`remove`|	Désinstalle le paquet spécifié, mais conserve ses fichiers de configuration|	`apt remove emacs`|
|`purge`|	Désinstalle le paquet spécifié **et** ses fichiers de configuration|	`apt purge screen`|
|`autoremove`|	Désinstalle les dépendances qui avaient été installées automatiquement et qui ne sont plus utilisées par aucun paquet|	`apt autoremove`|
|`search`|	Recherche les paquets dont le nom ou la description contient le terme spécifié|	`apt search hex`|
|`show`  |	Affiche les informations sur un paquet|	`apt show cowsay`|
|`update`|	Met à jour la base de données locale des paquets disponibles sur les dépôts. Il est utile de lancer ce programme régulièrement.|`apt update`|
|`list --upgradable`|	Affiche la liste des paquets installés pour lesquels une version plus récente est disponible (à lancer après `apt update`)|`apt list --upgradable`|
|`upgrade`|	Met à jour tous les paquets installés vers leur version la plus récente disponible sur les dépôts|`apt upgrade`|

{{% notice style="info" title="update ou upgrade?" %}}
`apt update` ne met à jour **aucun programme** : il télécharge seulement la liste des paquets disponibles. C'est `apt upgrade` qui installe les nouvelles versions. On les utilise donc habituellement l'une après l'autre:

```bash
info@debian:~$ sudo apt update
info@debian:~$ apt list --upgradable
info@debian:~$ sudo apt upgrade
```
{{% /notice %}}

{{% notice style="info" title="remove, purge et autoremove" %}}
`apt remove screen` désinstalle le programme, mais laisse ses fichiers de configuration sur le système (utile si on prévoit le réinstaller). `apt purge screen` supprime en plus ses fichiers de configuration.

Dans les deux cas, les dépendances installées automatiquement avec le paquet restent sur le système. Pour les supprimer lorsqu'elles ne sont plus utilisées par aucun autre paquet, on utilise `sudo apt autoremove`.
{{% /notice %}}

{{% notice style="info" title="Remarque" %}}
L'avantage d'utiliser `apt` pour installer des programmes est qu'il tient compte des dépendances: par exemple, si le logiciel `bmon` dépend de la librairie `libconfuse2` pour fonctionner correctement, `apt` se charge d'installer `libconfuse2` avant d'installer `bmon`.
{{% /notice %}}
Il est possible d'installer plusieurs paquets en même temps en énumérant chacun d'eux à la suite de la commande, comme suit:

```bash
info@debian:~$ sudo apt install app1 app2 app3
```
Pour plus de détails, faites `man apt`.

### Réparer des dépendances manquantes : apt --fix-broken install

Lorsqu'un paquet est installé avec `dpkg` (voir la section suivante), ses dépendances ne sont **pas** installées automatiquement. Si une dépendance est absente, l'installation échoue et le paquet reste dans un état « non configuré »:

```bash
info@debian:~$ sudo dpkg -i app1.deb
Sélection du paquet app1 précédemment désélectionné.
Préparation du dépaquetage de app1.deb ...
Dépaquetage de app1 (1.0) ...
dpkg: des problèmes de dépendances empêchent la configuration de app1 :
 app1 dépend de libconfuse2 ; cependant :
  Le paquet libconfuse2 n'est pas installé.

dpkg: erreur de traitement du paquet app1 (--install) :
 problèmes de dépendances - laissé non configuré
```

La commande `apt --fix-broken install` (ou sa forme courte `apt -f install`) demande à `apt` de télécharger depuis les dépôts les dépendances manquantes, puis de terminer la configuration des paquets laissés incomplets:

```bash
info@debian:~$ sudo apt --fix-broken install
Les NOUVEAUX paquets suivants seront installés :
  libconfuse2
...
Paramétrage de libconfuse2 ...
Paramétrage de app1 (1.0) ...
```

### /etc/apt/sources.list
Les serveurs qui contiennent les dépôts logiciels sont synchronisés: ils ont tous le même contenu et sont régulièrement mis à jour afin qu'ils soient tous des copies identiques les uns des autres. Afin d'avoir une bonne performance lors du téléchargement et de l'installation, il est recommandé de choisir un dépôt assez proche géographiquement d'où on se trouve.

Au moment de l'installation de Debian, il nous est demandé de choisir le dépôt qu'on souhaite utiliser. Sur une installation qui utilise le format traditionnel, ce choix peut être modifié dans le fichier `/etc/apt/sources.list`. Ce fichier peut aussi être conservé après une mise à niveau vers Debian 13.

Dans ce fichier chaque ligne définit l'url vers un des dépôts utilisés par `apt`. Le format est le suivant:

![source](/images/sources.list.svg)

Il est possible de spécifier plusieurs catégories sur la même ligne, par exemple `deb http://deb.debian.org/debian bullseye main contrib non-free`.

### Debian 13 : /etc/apt/sources.list.d/debian.sources

Sur une installation récente de Debian 13 (Trixie), les dépôts officiels sont généralement configurés dans le fichier `/etc/apt/sources.list.d/debian.sources`. Ce fichier utilise le format **deb822** : chaque source est décrite par plusieurs champs et les sources sont séparées par une ligne vide.

Voici un exemple; le contenu exact peut varier selon l'installation :

```text
Types: deb deb-src
URIs: http://deb.debian.org/debian
Suites: trixie trixie-updates
Components: main non-free-firmware
Signed-By: /usr/share/keyrings/debian-archive-keyring.gpg

Types: deb deb-src
URIs: http://security.debian.org/debian-security
Suites: trixie-security
Components: main non-free-firmware
Signed-By: /usr/share/keyrings/debian-archive-keyring.gpg
```

Les champs indiquent :

- `Types` : les types de paquets, soit `deb` pour les paquets binaires et `deb-src` pour les paquets source.
- `URIs` : l'adresse du dépôt.
- `Suites` : la version de Debian et les suites de mises à jour utilisées.
- `Components` : les catégories de paquets activées, comme `main`, `contrib`, `non-free` et `non-free-firmware`.
- `Signed-By` : le fichier de clés utilisé pour vérifier la signature du dépôt.

Pour activer une catégorie supplémentaire, on l'ajoute au champ `Components` des sources concernées. Par exemple, `Components: main contrib non-free-firmware` permet aussi d'accéder aux paquets `contrib`.

Une installation peut également utiliser d'autres fichiers de sources `.sources` ou `.list` dans `/etc/apt/sources.list.d/`. Le format traditionnel reste pris en charge par Debian 13.

La modification de ces fichiers nécessite les droits d'administration. Après une modification, il faut mettre à jour les informations locales sur les logiciels avec `sudo apt update`.
