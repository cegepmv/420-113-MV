+++
pre = '<b>7. </b>'
title = 'Utilisateurs et permissions'
draft = false
weight = "700"
+++


*Pour pouvoir faire les commandes décrites dans cette section, vous devez avoir les permissions de l'utilisateur root. À cette fin, Sur la VM 'BaseDebian.ova', lancez la commande suivante à partir d'un terminal:*
```bash
info@debian:~$ sudo su -
```

# Accès SSH à un serveur distant

SSH (Secure Shell) est un protocole permettant de se connecter de façon sécurisée à un serveur distant via une connexion chiffrée. Il est couramment utilisé pour l'administration de systèmes Linux, le transfert de fichiers et l'exécution de commandes à distance.

## Connexion à un serveur

La commande suivante permet d'établir une connexion SSH :

```bash
ssh utilisateur@adresse_ip