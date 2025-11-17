+++
title = "Adaptateurs réseau (VMWare)"
weight = "900"
+++
---------------------
## Adaptateurs réseau (VMWare Workstation)
Lorsqu'on crée une machine virtuelle dans VMware, une des composantes du "PC" qu'on virtualise est la **carte réseau** (*Network Adapter*). VMware propose plusieurs modes pour connecter cette carte réseau au réseau de la machine hôte, chacun ayant un comportement différent. Les trois plus importants sont les suivants : 

+ **Mode NAT (Network Address Translation) :** Dans ce mode, la VM **passe par l’ordinateur hôte pour accéder à Internet**.
    + La VM reçoit une adresse IP interne.
    + L’hôte se charge de “traduire” les connexions pour elle.
    + La VM peut aller sur Internet.
    + Une autre machine du réseau local **ne peut pas communiquer directement avec la VM**.

👉 À imaginer comme :
"La VM est cachée derrière l’ordinateur hôte."

+ **Mode Bridged :** La VM est **directement connectée au réseau local**, comme si c'était un ordinateur physique à part entière dans le réseau
    + La VM obtient une **adresse IP du même réseau que l’hôte**.
    + Les autres machines du réseau peuvent la voir et communiquer avec elle.
    + Internet fonctionne aussi (si le réseau le permet).

👉 À imaginer comme :
"La VM est un vrai PC branché sur le même réseau que vous."

+ **Mode Host-Only :** La VM est dans un **réseau privé**, accessible uniquement depuis l’ordinateur hôte.
    + La VM n’a **pas accès à Internet**.
    + Elle peut **uniquement communiquer avec l’hôte**.
    + Pratique pour des environnements de test isolés.

👉 À imaginer comme :
“La VM et l’hôte sont dans une petite pièce fermée : ils peuvent se parler, mais personne d’autre ne peut entrer.”

### Récapitulatif 
|Mode|Accès Internet|Communication PC ↔ VM|VM visible sur réseau ?|
|----|------|------|-------|
|**NAT**|Oui|Oui|Non|
|**Bridged**|Oui|Oui|Oui|
|**Host-Only**|Non|Oui|Non|