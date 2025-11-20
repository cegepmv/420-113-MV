+++
title = 'Journaux'
date = 2025-11-13T09:56:29-05:00
weight = 1
+++
# Journaux système
Tous les systèmes d’exploitation sont dotés de services qui regroupent les informations sur ce qui se passe dans le système à des fins de diagnostic ou d’alerte. Ces informations portent sur les composantes matérielles du système et leurs pilotes, le système d’exploitation ou les autres programmes ou services installés par les utilisateurs. 

Sur linux on peut consulter différents journaux dans des fichiers qui se trouvent dans `/var/log`. Selon la distribution et les programmes installés, ils peuvent grandement varier mais la plupart des systèmes linux auront au minimum les journaux suivants :

### `/var/log/syslog`
Regroupe les messages de tous les services et applications du système, sauf ceux qui sont associés à un processus d'authentification. Le format est :

**DATE-HEURE HÔTE PROCESSUS: MESSAGE**

Par exemple:
```
Apr 27 20:21:53 ubusrv systemd-resolved[797]: Using degraded feature set (UDP) for DNS server 192.168.4.2
Apr 27 20:21:55 ubusrv systemd-timesyncd[726]: Synchronized to time server 91.2.89.1:123 (ntp.ubuntu.com).
Apr 27 20:21:57 ubusrv systemd[1]: Started Session 3 of user olivier.
Apr 27 20:22:28 ubusrv systemd[1]: Reloading.
```

### `/var/log/messages`
Regroupe des messages non-prioritaires provenant de diverses sources. Le format est semblable à celui de *syslog*.


### `/var/log/auth.log`
Contient tous les messages associés à un processus d'authentification: utilisation de *sudo*, ouvertures de session (réussies ou non), connexions par *ssh*, etc. Le format est semblable à celui de *syslog*.

Par exemple:
```
Apr 26 20:21:42 ubusrv login[898]: Session opened for user olivier by LOGIN(uid=0)
Apr 26 20:21:42 ubusrv systemd-logind[813]: New session 1 of user olivier.
Apr 26 20:21:42 ubusrv systemd: pam_unix(systemd-user:session): session opened for user olivier by (uid=0)
Apr 26 20:21:57 ubusrv sshd[1404]: Accepted password for olivier from 192.168.94.1 port 27822 ssh2
```

### `/var/log/kern.log`
Contient les messages relatifs au noyau linux et à ses modules (c'est-à-dire les pilotes de périphériques). Ses informations sont elles aussi contenues dans *syslog*. Le format est analogue aux autres journaux mais on y ajoute entre crochets le nombre de secondes après le démarrage où l'évènement a eu lieu.

Par exemple:
```
Apr 26 20:20:42 debian kernel: [    7.081587] audit: type=1400 audit(1588537281.751:11): apparmor="STATUS" 
Apr 26 20:20:42 debian kernel: [    7.315503] NET: Registered protocol family 40
Apr 26 20:20:44 debian kernel: [    8.571298] e1000: ens33 NIC Link is Up 1000 Mbps Full Duplex, Flow Control: None
Apr 26 20:20:44 debian kernel: [    8.574860] IPv6: ADDRCONF(NETDEV_CHANGE): ens33: link becomes ready 
```

> REMARQUE: La commande `dmesg` affiche le même type de messages que *kern.log* mais contient seulement les messages ayant été émis depuis le dernier démarrage. 

### Autres services
Les autres programmes et services qui sont ajoutés au système, par exemple un serveur web, un pare-feu, un serveur de fichiers, etc. auront certainement eux aussi des journaux dont les entrées peuvent être d'un format différent de ceux qui précèdent; mais ils se trouveront quand même généralement dans le répertoire `/var/log`.  



