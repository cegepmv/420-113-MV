+++
title = 'Utilisateurs et groupes'
weight = "710"
+++

---------------

En linux comme dans la plupart des systèmes d'exploitation il peut y avoir plusieurs utilisateurs sur un même système. Les utilisateurs peuvent ouvrir des sessions sur linux, lancer des programmes et manipuler des fichiers. Ils peuvent avoir des permissions différentes sur les fichiers et les programmes, ce qui explique qu'on protège les comptes utilisateurs par des mots de passe.

Dans Debian, le premier compte utilisateur est créé au moment de l'installation; il est par la suite possible d'en créer d'autres.

Il existe deux commandes pour créer des utilisateurs: 

### adduser 
Permet de créer des utilisateurs en mode "interactif" (des questions vous sont posées pour entrer chacune des informations sur l'utilisateur). C'est la commande la plus simple à utiliser dans le terminal lorsqu'on veut créer un utilisateur à la fois.

*Exemple :*
```bash
root@debian:~$ adduser maria
```

### useradd
Permet de créer des utilisateurs en une seule commande; les informations autres que le nom de l'utilisateur doivent être spécifiées par des options de la commande.

| Option | Utilité | Exemple |
| ------ | ------- | ------- |
| `-m` | Crée le répertoire personnel au même nom que l'utilisateur | <nobr>`useradd -m bob`</nobr> |
| `-d` | Utilisé avec l'option `-m`, permet de spécifier un répertoire personnel différent | <nobr>`useradd -md /home/tmp bob`</nobr> |
| `-s` | Permet de spécifier un "shell" | <nobr>`useradd -s /bin/bash bob`</nobr> |
| `-G` | Associe des groupes supplémentaires à l'utilisateur | <nobr>`useradd -G groupe1,groupe2 bob`</nobr> |

*Exemples :*
```bash
root@debian:~$ useradd maria
root@debian:~$ useradd -m -s /bin/bash -G webmin maria
```

{{% notice style=info title="Remarque" %}}
La commande `useradd` n'a pas d'option qui permet de définir simplement le mot de passe d'un utilisateur. On doit donc utiliser une autre commande, `passwd`, pour donner un mot de passe à l'utilisateur nouvellement créé. Une autre possibilité est d'utiliser la "recette" suivante:
```bash
root@debian:~$ useradd -m bob && echo "bob:abc-123" | chpasswd
```
{{% /notice%}}

### deluser et userdel
+ Supprime un utilisateur et les entrées qui lui correspondent dans les fichiers `/etc/passwd`, `/etc/shadow` et `/etc/group`.
+ Ne supprime pas le répertoire personnel : pour ce faire il faut utiliser `deluser --remove-home` ou `userdel -r`.

*Exemples :*
```bash
root@debian:~$ deluser --remove-home maria
root@debian:~$ userdel -r maria
```


### Informations sur les utilisateurs
Les fichiers qui contiennent les informations sur les utilisateurs sont les suivants:

#### /etc/passwd
Contient les noms et les paramètres généraux de fonctionnement de chaque compte utilisateur.

Chaque ligne de ce fichier correspond à un utilisateur; les informations sont séparées par des `:` et sont structurées comme suit:

![passwd](/420-113-MV/images/passwd.svg)

#### /etc/shadow
Contient les informations relatives aux mots de passe des utilisateurs. Le mot de passe n'est pas stocké "en clair": c'est plutôt leur *valeur de hachage* (une représentation cryptographique) qui est écrite dans le fichier.

#### /etc/login.defs
Contient des informations (sous formes de variables) utilisées lors de la création des utilisateurs.

<!--
Quiz semaine 6 next
Attention: travaux à remettre en classe = pas notés
Faire adduser, regarder /etc/passwd, /etc/shadow, /etc/home, login/logout
Faire useradd: entrée dans /etc/passwd et les liens sont là mais pas de /home/, shell différent, ni de login possible (mdp absent)
+ Manque le mdp, le répertoire perso, le shell

`useradd -m bob` crée le répertoire perso

Mot de passe? Utiliser passwd ensuite. Sinon recette: useradd -m bob && echo "bob:abc-123" | chpasswd

Manque toujours le shell

=> useradd -m -s /bin/bash
-->

## Groupes
Les utilisateurs peuvent faire partie de *groupes*. 

Les groupes sont une manière de donner à plusieurs utilisateurs des permissions semblables sur des fichiers ou des programmes. Par exemple, si on veut permettre à 5 utilisateurs de lire un fichier, on crée un groupe, on donne les permissions de lecture sur le fichier à ce groupe, puis ensuite on ajoute les 5 utilisateurs au groupe. Cette manière de procéder est parfois plus simple que de donner des permissions à chaque utilisateur séparément.

Les informations sur les groupes d'utilisateurs sont stockées dans le fichier `/etc/group`.

Les commandes pour modifier les groupes sont les suivantes:

### addgroup
### #groupadd
### #delgroup
### #groupdel

Permettent de créer ou supprimer des groupes. Il existe des options mais la plupart correspondent à des utilisations très spécifiques et sont généralement inutiles, à l'exception d'une: lors de la suppression d'un groupe, `--only-if-empty` (utilisé avec `deluser`) ne supprimera pas un groupe s'il existe des utilisateurs qui en font partie.

*Exemples:*
```bash
root@debian:~$ addgroup groupe1
root@debian:~$ groupadd groupe2
root@debian:~$ delgroup groupe2
root@debian:~$ groupdel groupe1
```

## Modification d'utilisateurs ou de groupes
Après sa création, il est possible de modifier les propriétés d'un utilisateur ou un groupe. Les commandes correspondantes sont les suivantes:

### `groupmod`
Permet de changer les informations d'un groupe. Généralement on change son nom ou son identifiant.

| Option | Utilité | Exemple |
| ------ | ------- | ------- |
| `-g` | Changer l'ID du groupe. L'option est suivie du nouvel ID. | `groupmod -g 999 groupe1`</nobr> |
| `-n` | Changer le nom du groupe. L'option est suivie du nouveau nom. | `groupmod -n gr1 groupe1`</nobr> |


### `usermod`
Permet d'effectuer la gestion d'un compte utilisateur. 

| Option | Utilité | Exemple |
| ------ | ------- | ------- |
| `-u` | Changer l'ID de l'utilisateur. L'option est suivie du nouvel ID. | <nobr>`usermod -u 1100 alice`</nobr> |
| `-l` | Changer le nom de l'utilisateur. L'option est suivie du nouveau nom. | <nobr>`usermod -l mvasquez maria`</nobr> |
| `-aG` | Ajouter l'utilisateur à un ou plusieurs groupes. | <nobr>`usermod -aG groupe1 alice`</nobr> |
| `-md` | Créer un nouveau répertoire personnel et y déplacer le contenu de l'ancien | <nobr>`usermod -md /home/temp kratos`</nobr> |
| `-s` | Créer le *shell* de l'utilisateur. | <nobr>`usermod -s /bin/bash sami`</nobr> |
| `-L` | Verrouiller le compte. | <nobr>`usermod -L bob`</nobr> |
| `-U` | Déverrouiller le compte. | <nobr>`usermod -U bob`</nobr> |

## Autres commandes utiles
### `whoami`
Affiche le nom de l'utilisateur courant.

### `id`
Affiche les identifiants d'un utilisateur et ceux des groupes dont il fait partie. Sans argument, affiche les informations de l'utilisateur courant.

*Exemples:*
```bash
root@debian:~$ whoami
root@debian:~$ id
root@debian:~$ id bob
```

[Faire les exercices](https://github.com/cegepmv/420-113-MV/tree/main/exercices/UtilisateursPermissions/)