
+++
title = "Guide SSH sur VSCode"
weight = "900"
+++
---------------------

Dans ce qui suit, nous allons configurer le logiciel VSCode pour qu’il se connecte directement sur une VM ou un serveur distant en utilisant SSH.

1. Pour vous connecter à la VM/Serveur à partir de VSCode pour la première fois, il faut installer l'extension **Remote - SSH**. Dans l’onglet des extensions, recherchez **Remote SSH** puis cliquez sur *Installer*:

![Installation de remote SSH](../images/vscode-install-remote-ssh.png)

2. Pour ouvrir une connexion, cliquez sur le coin en bas à gauche de la fenêtre:
![Connexion SSH](../images/vscode-ssh-connect01.png)
3. Ensuite, vous devez créer la connexion. Dans le menu qui apparaît, choisissez Se connecter à l'hôte puis entrez l’identifiant de connexion <utilisateur>@<adresse ip de la VM ou serveur> : 

![Connexion SSH](../images/vscode-ssh-connect02.png)

4. Si on vous demande de choisir une plateforme, sélectionnez Linux.

5. Si on vous demande si vous êtes sûr de continuer, sélectionnez **Continue**.

6. Entrez ensuite votre mot de passe.

7. Si tout se passe comme prévu, vous serez connecté via SSH à votre VM/Serveur.

8. Pour avoir accès à un répertoire particulier (par exemple votre répertoire personnel), appuyez sur *Ouvrir dossier* sur la barre de navigation à droite :

![Connexion SSH](../images/vscode-ssh-connect04.png)

9. Dans la barre qui s'ouvre, écrivez le chemin absolu du répertoire (par exemple `/home/info`) puis appuyez sur **OK** :

![Connexion SSH](../images/vscode-ssh-connect03.png)

11. Entrez de nouveau votre mot de passe. Vous êtes maintenant supposés voir le contenu du répertoire dans la barre de navigation à gauche.

Maintenant vous êtes en mesure : 
+ D'ouvrir un terminal **dans la VM** en tant que l'utilisateur avec lequel vous vous êtes connecté (Onglet Terminal -> Nouveau terminal)
+ Naviguer dans le système de fichiers de votre VM/Serveur ( ouvrir, modifier, copier des fichiers, etc.) directement dans le barre de navigation de gauche de **VSCode**.