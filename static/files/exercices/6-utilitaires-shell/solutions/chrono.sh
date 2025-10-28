#!/bin/bash

echo "Quelle commande voulez-vous exécuter?"
read com

t1=$(date +%s)
$com 2> /dev/null
t2=$(date +%s)
dif=$(($t2-$t1))
echo "Temps d'exécution: $dif secondes"
