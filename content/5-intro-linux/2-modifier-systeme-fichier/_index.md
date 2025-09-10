+++
title = 'Fichiers et répertoires'
weight = "520"
+++

------------------

Il est possible de créer, supprimer, copier ou déplacer des fichiers et des répertoires. 

## Commandes utiles
| But | Commande | Signification |
| --- | --- | --- |
| Créer un répertoire | `mkdir` | *MaKe DIRectory* |
| Supprimer un répertoire | `rmdir` | *ReMove DIRectory* |
| Créer un fichier | `touch` |  |
| Supprimer un fichier | `rm` | *ReMove* |
| Copier un fichier | `cp` | *CoPy* |
| Déplacer un fichier | `mv` | *MoVe* |
| Créer un raccourci | `ln` | *LiNk* |

### `touch`
Crée un fichier vide. L'argument de la commande est le chemin du fichier.

*Exemple*:
```bash
leon@debian:~$ touch unfichier.txt
```

### `mkdir`
Crée un répertoire. L'argument de la commande est le chemin du répertoire cible.

Lorsque la cible contient plus d'un répertoire, tous les répertoires dans le chemin sauf le dernier doivent déjà exister (un seul répertoire est créé à la fois). Si on veut créer toute une série de répertoires et de sous-répertoires il faut utiliser l'option `-p`.

*Exemples:*
```bash
leon@debian:~$ mkdir unrep
leon@debian:~$ mkdir /home/leon/unrep/sousrep
leon@debian:~$ mkdir -p /home/leon/rep2/rep3/rep4
```

### `rmdir`
Supprime un répertoire. L'argument est le chemin du répertoire à supprimer. 

Si le répertoire à supprimer n'est pas vide, il ne sera pas supprimé.

*Exemple*:
```bash
leon@debian:~$ rmdir unrep
```

### `rm`
Supprime des fichiers ou des répertoires. L'argument peut être le fichier ou (dans certains cas) le répertoire à supprimer.  

La commande `rm` a plusieurs options; les principales sont:
+ `-f` force la suppression sans demander de confirmation
+ `-r` supprime récursivement les fichiers et sous-répertoires. Lorsqu'on utilise cette option l'argument de `rm` doit être un réperoire.

*Exemples*:
```bash
leon@debian:~$ rm /home/leon/unfichier.txt
leon@debian:~$ rm -r rep2
```

### `cp`
Copie un ou plusieurs fichiers. Le premier argument est la **source** et le deuxième est la **cible**.

La commande `cp` a plusieurs options; les principales sont:
+ `-f` force la copie sans demander de confirmation
+ `-r` copie récursivement les fichiers et sous-répertoires
   
La copie est une action qui concerne les fichiers, mais la source et la cible passés en arguments à la commande peuvent être des fichiers ou des répertoires. La commande `cp` se comporte différemment selon les cas:
+ Si la source est un fichier et la cible est un répertoire, le fichier sera créé dans le répertoire cible
+ Si la source est un répertoire, on doit utiliser l'option `-r` pour copier son contenu
+ Si la cible existe, son contenu sera écrasé

*Exemples*:
```bash
leon@debian:~$ cp abc def
leon@debian:~$ cp /usr/share/dict/french .
leon@debian:~$ cp abc rep1/
leon@debian:~$ cp -r rep1/ rep2/
```

### `mv`
Déplace un ou plusieurs fichiers. Le premier argument est la **source** et le deuxième est la **cible**.

La commande `mv` fonctionne comme `cp`, à quelques exceptions près: 
+ `mv` supprime l'original après que la copie ait été faite. Pour cette raison, on utilise souvent la commande `mv` pour renommer un fichier: il s'agit de le déplacer dans le même répertoire que la source en lui donnant un autre nom.
+ L'option `-r` n'est pas utilisée
  q
*Exemples*:
```bash
leon@debian:~$ mv abc /tmp/abc
leon@debian:~$ mv abc def
leon@debian:~$ mv -r rep1/ rep2/
```

### `ln`
Crée un raccourci (un *lien*) vers une **cible**, qui peut être fichier ou un répertoire. Avec un seul argument (`ln CIBLE`), le lien est créé dans le répertoire courant; pour créer le lien ailleurs, on doit donner son nom comme deuxième argument (`ln CIBLE LIEN`).

Il existe deux types de liens: **physique** et **symbolique**:
+ Les liens *physiques* sont des noms de fichiers qui pointent sur l'espace disque où l'original est stocké. Tous les liens physiques vers un fichier doivent être supprimés pour qu'un fichier soit supprimé.
+ Les liens *symboliques* sont des noms de fichiers qui pointent sur d'autres noms de fichiers. Si la cible est supprimée, le lien existera toujours mais ne fonctionnera plus.

Il est préférable d'utiliser des liens symboliques. Pour cela la commande `ln` doit être lancée avec l'option `-s`.

*Exemples*:
```bash
leon@debian:~$ ln -s /etc/
leon@debian:~$ ln -s /etc/hostname
leon@debian:~$ ln -s /etc/hostname nomHote
```

## Caractères génériques
Dexu caractères spéciaux peuvent être utilisés lorsqu'on désigne un fichier: `*` et `?`. Il permettent de remplacer des caractères dans les noms de fichiers ou de répertoires.
+ `?` remplace n'importe quel caractère unique;
+ `*` remplace n'importe quel groupe de caractères.

*Exemples*:
```bash
leon@debian:~$ cp dir1/* .
leon@debian:~$ mv f* dir2/
leon@debian:~$ cp f4 dir?
```
