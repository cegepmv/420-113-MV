
sudo apt install nginx
# Quelle commande vous permet de voir les messages d’erreur émis par nginx ?
sudo cat /var/log/nginx/error.log 
# Quelle commande vous permet de voir les 5 messages les plus récents ?
sudo journalctl -n 5
# Quelle commande vous permet de voir les messages émis durant la dernière heure ?
sudo journalctl --since "1 hour ago"
# Quelle commande vous permet de voir les messages émis durant la dernière heure par le noyau du système d’exploitation ?
sudo journalctl -k --since "1 hour ago"
# Quelle commande vous permet de voir les messages associés à l’utilisateur info ?
sudo journalctl _UID=1000
