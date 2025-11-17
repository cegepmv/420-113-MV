+++
title = "Exercices"
weight = "900"
+++
---------------------

## 1- Différence entre NAT, Bridge et Host-Only
1. Sur votre poste de travail (le PC physique, pas la machine virtuelle), ouvrez un terminal Windows (tapez “cmd” dans le menu Windows)
2. Lancez la commande `ipconfig`. Dans chacune des sections quelles sont les valeurs des éléments suivants?
<table>
  <tr>
    <th>Carte Ethernet Ethernet</th>
  </tr>
  <tr>
    <td>Adresse IPv4 : </td>
    </tr>
  <tr>
    <td>Passerelle par défaut :</td>
  </tr>
  <tr>
    <td>Adresse physique :</td>
  </tr>
</table>

<table>
  <tr>
    <th>Carte Ethernet Vmnet1</th>
  </tr>
  <tr>
    <td>Adresse IPv4 : </td>
    </tr>
  <tr>
    <td>Passerelle par défaut :</td>
  </tr>
  <tr>
    <td>Adresse physique :</td>
  </tr>
</table>

<table>
  <tr>
    <th>Carte Ethernet Vmnet8</th>
  </tr>
  <tr>
    <td>Adresse IPv4 :</td>
    </tr>
  <tr>
    <td>Passerelle par défaut :</td>
  </tr>
  <tr>
    <td>Adresse physique :</td>
  </tr>
</table>

{{%notice title="Rappel" style="tip"%}}
+ L’adresse IP se compose de 4 nombres pouvant aller de 0 à 255.
+ La passerelle est la "*porte de sortie*" de votre réseau: lorsque vous ouvrez une connexion sur un serveur qui se trouve sur internet (par exemple www.google.com), la communication entre votre PC et ce serveur passe par cette passerelle.
{{%/notice%}}

*Alors que votre VM Debian est éteinte, mettez le type de son adapteur réseau à NAT. Ensuite démarrez-la.*

1. Ouvrez un terminal dans Debian et lancez la commande `ip address`. Quelle sont les adresses IP et MAC de l'interface `ens33`?

2. Lancez ensuite la commande `ip route`. Quelle est l’adresse IP de la passerelle par défaut (“default”) ?

3. Arrivez-vous, avec Firefox, à ouvrir la page www.google.com?

4. Sur votre poste de travail, ouvrez un terminal Windows et essayer d'envoyer un ping à la VM Debian. Y arrivez-vous ?

5. Récupérez l'adresse IP de la VM Debian d'un.e de vos collègue. À partir de votre VM, essayez d'envoyer un ping à la sienne. Y arrivez-vous ?

*Alors que votre VM Debian est éteinte, mettez le type de son adapteur réseau à Host-Only. Ensuite démarrez-la.*

1. Ouvrez un terminal dans Debian et lancez la commande `ip address`. Quelle sont les adresses IP et MAC de l'interface `ens33`?

2. Lancez ensuite la commande `ip route`. Quelle est l’adresse IP de la passerelle par défaut (“default”) ?

3. Arrivez-vous, avec Firefox, à ouvrir la page www.google.com?

4. Sur votre poste de travail, ouvrez un terminal Windows et essayer d'envoyer un ping à la VM Debian. Y arrivez-vous ?

5. Récupérez l'adresse IP de la VM Debian d'un.e de vos collègue. À partir de votre VM, essayez d'envoyer un ping à la sienne. Y arrivez-vous ?

*Alors que votre VM Debian est éteinte, mettez le type de son adapteur réseau à Bridged. Ensuite démarrez-la.*

1. Ouvrez un terminal dans Debian et lancez la commande `ip address`. Quelle sont les adresses IP et MAC de l'interface `ens33`?

2. Lancez ensuite la commande `ip route`. Quelle est l’adresse IP de la passerelle par défaut (“default”) ?

3. Arrivez-vous, avec Firefox, à ouvrir la page www.google.com?

4. Sur votre poste de travail, ouvrez un terminal Windows et essayer d'envoyer un ping à la VM Debian. Y arrivez-vous ?

5. Récupérez l'adresse IP de la VM Debian d'un.e de vos collègue. À partir de votre VM, essayez d'envoyer un ping à la sienne. Y arrivez-vous ?


## 2- Connexion SSH à une VM
*Alors que votre VM Debian est éteinte, mettez le type de son adapteur réseau à Bridged. Ensuite démarrez-la.*

1. Avec `apt`, installez le paquet `openssh-server`.
2. Trouvez l’adresse IP de votre VM Debian avec la commande `ip address`.

3. Avec la commande `lsof`, listez les ports actifs sur votre VM.

    + Quel processus utilise le port 22 ?
    + Quel est son PID ?
    + À quoi sert ce service ?

4. Connectez-vous par SSH à votre VM avec les 2 méthodes suivantes : 

    + En utilisant le terminal *Git Bash* (PC Windows) 
    + En utilisant VSCode (voir le *Guide SSH sur VSCode*)

6. En utilisant la connexion SSH crée en **3.** créez un fichier `~/secret.txt` contenant un message dans le répertoire personnel de l'utilisateur info.

5. Récupérez l'adresse IP de la VM d'un.e de vos collègues puis essayez de : 
    + ping sa VM à partir de la votre.
    + copier le fichier `~/secret.txt` dans son répertoire personnel en utilisant `scp`.
    + se connecter à sa VM avec SSH et afficher le contenu du fichier `~/secret.txt`.