+++
pre = '<b>5. </b>'
title = 'Introduction à Linux'
weight = "500"
+++

------------------

Linux est une famille de systèmes d'exploitation qui se caractérisent par le fait qu'ils utilisent tous le même [noyau](https://fr.wikipedia.org/wiki/Noyau_de_syst%C3%A8me_d%27exploitation). 

## Historique

### Unix

Le système **Unix** ("ancêtre" de *Linux* et de *MacOS*) a été créé par *AT&T* au début des années 1970. 

Dès la fin de l'année 1977, des chercheurs de l'université de Californie apportent des améliorations à Unix et le distribuèrent sous le nom de Berkeley Software Distribution (*BSD*), qui donnera par la suite *OpenBSD*, *FreeBSD*, *NetBSD* et *MacOS*. 

### GNU (GNU’s Not Unix)

![Mascotte GNU](/images/gnu.png?width=280px)

Le 27 septembre 1983, Richard Stallman (auteur de la célèbre autorisation *Copyleft*) dévoile son projet de développer un système d’exploitation compatible Unix appelé GNU mais qui serait libre. Il y a une anecdote qui serait à l’origine de son intention. On peut la découvrir dans le paragraphe 4 de la section biographie de [sa page Wikipédia](https://fr.wikipedia.org/wiki/Richard_Stallman).

Ce projet a donné naissance à la licence **GNU GPL** (*GNU General Public Licence*) pour les logiciels, en énonçant 4 règles qui la régissent :

+ La liberté d’exécuter le logiciel, pour n’importe quel usage ;
+ La liberté d’étudier le fonctionnement d’un programme et de l’adapter à ses besoins, ce qui passe par l’accès aux codes sources ;
+ La liberté de redistribuer des copies ;
+ L’obligation de faire bénéficier à la communauté des versions modifiées.

### Linux
En 1991, Linus Torvalds annonce la création d’un nouveau noyau de système d’exploitation et en février 1992, la version 0.12 est diffusée sous la *Licence Publique Générale GNU (GNU/GPL)*. C’est la fusion des projets GNU et Linux (GNU/Linux) : Un système d’exploitation libre, apportant avec lui les quatres libertés déjà expliquées :

+ Exécuter le programme, pour tous les usages ;
+ Étudier le fonctionnement du programme et de l’adapter à ses besoins ;
+ Redistribuer des copies du programme ;
+ Améliorer le programme et de distribuer ces améliorations au public, pour en faire profiter toute la communauté.

## Distributions
Une *distribution* linux est un système d'exploitation basé sur le noyau linux. Chacun de ces SE peut contenir des programmes différents. Les distributions se différencient donc par leur apparence, la manière dont on peut y installer des logiciels, etc.

Étant donné que chacun est libre de créer des nouvelles distributions (et même faire ses propres modification du noyau!), celles-ci sont très nombreuses. Il n'existe pas de statistiques officielles sur le sujet mais on peut affirmer qu'il existe plusieurs milliers de distributions linux. 

Évidemment, certaines distributions sont plus populaires que d'autres; aussi, la plupart des distributions sont construites à partir d'une distribution existante. Ainsi, il existe des grandes *familles* (des groupes de distributions toutes basées sur un même parent). 

Les principales :
+ Debian
+ Red Hat
+ SUSE
+ Arch
+ Gentoo
+ Debian
+ Android
+ SteamOS
+ Raspberry Pi OS

{{% notice style="tip" title="À voir" %}}
[Généalogie des distributions linux](https://en.wikipedia.org/wiki/Linux_distribution#/media/File:Linux_Distribution_Timeline.svg)
{{% /notice %}}