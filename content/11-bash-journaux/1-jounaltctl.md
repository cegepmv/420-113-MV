+++
pre = '<b>1. </b>'
title = 'Jounaltctl'
date = 2025-11-20T08:37:35-05:00
weight=1101
+++
## Consulter les journaux avec `journalctl`

Les fichiers texte ne sont cependant plus la manière recommandée de consulter les journaux sur les systèmes linux actuels : on recommande d'utiliser la commande `journalctl`. Celle-ci comporte de nombreuses options; les plus utiles sont les suivantes:

### `-n`
(*new*) Suivie n'un nombre, affiche les *n* messages les plus récents. 
```
journalctl -n 20
```

### `-f`
(*follow*) Affiche les évènements du journal à mesure qu’ils surviennent. 
```
journalctl -f
```

### `-k` 
(*kernel*) Affiche les messages provenant du noyau.
```
journalctl -k
```

### `-u`
(*unit*) Affiche les messages provenant du service spécifié.
```
journalctl -u network
journalctl -u nginx
```

### `-g`
(*grep*) Affiche les messages qui contiennent la chaîne de caractères spécifiée.
```
journalctl -g "sudo"
```

### `-b`
(*boot*) Affiche les messages du journal depuis le démarrage le plus récent enregistré dans les journaux. L'option **-b** peut être suivie d'un nombre séquentiel: par exemple `-b 1` donnera tous les messages depuis le premier démarrage enregistré. Si le nombre est négatif, l'ordre est inversé: par exemple `-b -1` donne tous les messages depuis l'avant-dernier démarrage.
```
journalctl -b
journalctl -b -3
```
  
### `--since` / `--until`
Affiche les messages depuis / jusqu'à l'instant spécifié. Celui-ci doit être au format `AAAA-MM-JJ HH:MM:SS` ou de type "2 hours ago"
```
journalctl --since 2022-08-23 10:30:00
journalctl --until 17:23:20
journalctl --since 30 min ago
```

### `_UID`
Voir les entrées reliées à un utilisateur spécifié par son identifiant.
```
journalctl _UID=1002
```

### Remarques importantes
+ Il est possible d'appeler la commande *journalctl* avec ou sans `sudo`. Si on l'appelle sans, on ne verra que les entrées de journal qu'un utilisateur ordinaire peut lire. Avec `sudo`, on verra toutes les entrées possibles.
+ Si on veut voir tous les messages générés par un exécutable donné, on peut spécifier le chemin complet de celui-ci après la commande, par exemple: `journalctl /usr/bin/apt`
+ Les options peuvent se répéter et être combinées sans restriction, par exemple: `journalctl -u ssh -u network --since 2022-11-10 --until "1 hour ago"`
  


