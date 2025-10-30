+++
title = "Code source"
weight = "830"
+++
---------------------

Il est possible d'installer des programmes à partir du code source. Puisque les programmes peuvent être codés dans une foule de langages (python, c, java, perl, rust, lua, bash...), la démarche n'est pas exactement la même dans tous les cas. Ici nous verrons la procédure générale pour télécharger, compiler et installer un programme en langage C sur linux.

Installer un programme en C se fait en 4 étapes :

+ Télécharger le fichier qui contient le code source puis le décompresser avec la commande `tar`, ou télécharger le code source avec `git`
+ Configurer les paramètres de compilation avec la commande `configure`;
+ Compiler le code source pour obtenir l'exécutable avec la commande `make`;
+ Installer sur le système les librairies et exécutables compilés avec la commande `make install`.
Dans ce qui suit nous allons voir en quoi consiste chacune de ces étapes en installant la programme `nmap`.

{{%notice title="Attention" style="warning"%}}
Le paquet `build-essential` doit avoir été installé au préalable.
{{%/notice%}}

### 1. Obtenir le code source via une archive tar
En général, le code source du programme est distribué sous la forme d'une archive de format `.tar` compressée. Téléchargez [celle du programme nmap](https://nmap.org/dist/nmap-7.93.tar.bz2) puis copiez le fichier dans votre répertoire personnel.

Ensuite lancez la commande suivante pour extraire les fichiers de l'archive:
```bash
info@debian:~$ tar xvjf nmap-7.93.tgz
```

{{% notice style="tip" title="Astuce"%}}
+ Pour télécharger un fichier à partir du terminal, vous pouvez utiliser la commande `curl` :
```bash
info@debian:~$ curl -o <chemin et nom du fichier> <lien de téléchargement>
```
Exemple avec le lien de `nmap` : 
```bash
info@debian:~$ curl -o ~/nmap-7.93.tar.bz2 https://nmap.org/dist/nmap-7.93.tar.bz2
```
+ Le format de l'archive de nmap est `tar.bz2`. Si vous voulez extraire une archive `.tar.gz` (ou `tgz`), les options à donner à la commande `tar` sont `xzf`.
{{%/notice%}}
Cette commande créer le répertoire nmap-7.93/ qui contient les sources du programme. Allez dans ce répertoire.

### 2. Configurer la compilation du programme
Dans le répertoire vous verrez plusieurs fichiers source (`.cc` et `.h`) et d'autres programmes. Un de ceux-ci est un programme exécutable nommé `configure`. Lancez-le avec la commande suivante:

```bash
info@debian:~/nmap-7.93$ ./configure
```
Vous verrez de nombreux messages défiler à l'écran. Lorsque c'est terminé, vérifiez si les dernières lignes contiennent un message du type "Configuration complete": si c'est la cas, passez à l'étape suivante; sinon, identifiez les erreurs et corrigez-les avant de recommencer la configuration.

### 3. Compiler le programme
Le résultat de l'étape précédente est le `Makefile`, un fichier qui contient toutes les options et instructions à donner au compilateur afin que celui-ci crée les exécutables à partir du code. Pour lancer la compilation, on lance l'utilitaire `make` (qui appelle à son tour le compilateur `gcc` avec les options définies dans le `Makefile`). La commande est la suivante:
```bash
info@debian:~/nmap-7.93$ make
```
Encore une fois vous verrez défiler des informations qui correspondent cette fois-ci aux commandes de compilation. Tout dépendant de la taille et de la complexité du programme, la compilation peut être rapide ou durer longtemps.

Si vous ne voyez aucun message d'erreur particulier, alors passez à la prochaine étape.

### 4. Installer le programme
La dernière étape consiste à copier les programmes compilés vers les répertoires où ils pourront être utilisés dans l'ensemble du système linux: en effet, pour l'instant ils se trouvent toujours dans votre répertoire personnel. La commande est la suivante:
```bash
info@debian:~/nmap-7.93$ sudo make install
```
Le programme est ensuite installé: testez-le en le faisant afficher sa version, comme suit:
```bash
info@debian:~$ nmap -V
```

### Quelques mots sur git
De nombreux programmes peuvent être téléchargés grâce à `git`, un utilitaire qui permet de gérer les projets de développement logiciels de petite, moyenne et grande envergure.

Il ne s'agit pas ici de décrire toutes les fonctionnalités de `git`, qui sont nombreuses et relativement complexes; il faut seulement dire qu'il est assez fréquent que des programmes soient disponibles sur *GitHub*, *GitLab*, *Bitbucket*, etc. et qu'il est donc possible d'en obtenir les sources sur ces plateformes plutôt que via une archive `tar`. Lorsque c'est le cas, on n'aura qu'à télécharger localement les répertoires du code source à partir de la page du projet.

Par exemple, pour télécharger les sources du programme `neofetch`, allez dans la page *GitHub* du projet puis cliquez sur le bouton `Code`. Ceci vous permettra d'accéder au lien de téléchargement.

![gitneo](/images/gitneo.png)

Copiez ce lien puis utilisez la commande git clone pour copier les sources localement, comme suit:
```bash
info@debian:~$ git clone https://github.com/dylanaraps/neofetch.git
```
{{%notice style="info" title="Remarque"%}}
Ici, vous pouvez immédiatement lancer `make install` car `neofetch` n'est pas un programme en C, c'est un simple script qui peut être directement interprété par bash.
{{% /notice%}}

{{%notice style="note" title="Note"%}}
Les étapes d'installation à partir du code source ne sont pas toujours celles citées. Pour s'assurer de suivre les bonnes étapes d'installation d'un programme, il est nécessaire de **lire la documentation fournie**. En général, nous pouvons la trouver dans le fichier `README.md` du code source.
{{% /notice%}}