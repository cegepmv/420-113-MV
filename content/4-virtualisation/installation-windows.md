+++
title = 'Installation Windows'
date = 2025-09-02T08:23:23-04:00
+++

---

## 📀 ISO

### Qu'est-ce qu'une ISO ?

Une **image ISO** est un fichier contenant une copie exacte (ou image) d'un système de fichiers entier, souvent utilisé pour distribuer des systèmes d'exploitation (OS) comme Windows, Linux, etc. Elle peut être gravée sur un DVD ou montée directement dans une machine virtuelle pour installer un OS.

En résumé, une ISO = un "disque virtuel" d'installation.

### Lien de téléchargement de l'ISO Windows

👉 [Télécharger l'ISO de Windows 10](https://www.microsoft.com/fr-ca/software-download/windows10ISO)

---

## 🪟 Installation de Windows dans une machine virtuelle (VM)

### Étapes à suivre :

1. **Télécharger l'ISO de Windows** (voir lien ci-dessus).
2. **Créer une machine virtuelle** dans un logiciel comme VirtualBox ou VMware.
3. Lors de la création de la VM :

   * Choisir **Windows** comme type de système.
   * Allouer **au moins 2 Go de RAM** (idéalement 4 Go ou plus).
   * Créer un **disque dur virtuel** d’au moins **20 Go**.
4. **Insérer l’ISO dans la VM** :

   * Dans les paramètres de la VM, ajouter l'ISO en tant que disque dans le lecteur optique.
   * Cela revient à "insérer un CD" d’installation dans une vraie machine.
5. **Démarrer la VM**, puis suivre les instructions à l'écran pour installer Windows.

### Clé de produit :

* Si vous installez Windows **pour tester** sur une courte période, choisissez l'option **"Je n’ai pas de clé de produit"**.
