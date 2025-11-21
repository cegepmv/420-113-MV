+++
pre = '<b>5. </b>'
title = 'System Fichier'
date = 2025-11-18T13:45:16-05:00
weigth=5
+++

---------------------

**Exercice 1 – Montage ISO et exploration**

1. Lancez la commande :
```bash
mount
````

Quel est le type du périphérique `/dev/sda` ?

2. Créez le répertoire `/media/iso` et créez ensuite dans ce répertoire un fichier nommé `/media/iso/fichier.txt`.

3. Quel est le résultat de la commande :

```bash
ls -l /media/iso/fichier.txt
```

4. Téléchargez l’ISO Alpine Linux :

```
https://dl-cdn.alpinelinux.org/alpine/v3.16/releases/x86_64/alpine-standard-3.16.3-x86_64.iso
```

et montez ce fichier en lecture seule sur le point de montage `/media/iso`.

5. Lancez la commande :

```bash
mount
```

Quel est le type du périphérique monté dans `/media/iso` ?

6. Quel est maintenant le résultat de la commande :

```bash
ls -l /media/iso/fichier.txt
```

Pouvez-vous accéder au fichier `fichier.txt` ?

7. Comment pouvez-vous utiliser la commande `du` pour voir quel espace est occupé par le répertoire `/media/iso` ?

8. Quel espace (en M) est occupé par `/media/iso/apks/x86_64` ?

9. Utilisez la commande `df` pour voir l'espace libre des systèmes de fichiers montés.

---

**Exercice 2 – Partitionnement**

1. Installez une nouvelle VM Debian à partir du fichier ISO habituel.

2. Au moment de partitionner le disque, choisissez l’option **« Manuel »**.
![alt text](/420-113-MV/images/partitionnement1.png)
3. Créez 4 partitions primaires ayant respectivement 5GB, 7GB, 7GB et 2GB.

   * La première partition doit être amorçable, de type XFS et contenir le système d’exploitation.
   * La dernière partition doit contenir le fichier **swap**.
4. Vérifiez que les valeurs de tailles et de types sont correctes au moment de confirmer.
![alt text](/420-113-MV/images/partitionnement2.png)

5. Terminez ensuite l’installation de la manière habituelle.

```
