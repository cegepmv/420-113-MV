#!/bin/bash

# Chapitre 6 - Utilitaires du shell
# Exercice 3 - sort, uniq, wc et cut

REP_REPONSES="/home/info/Documents/chap6"

echo ""
echo "---------------------------------"
echo "Chapitre 6 - Utilitaires du shell"
echo "Exercice 3 - sort, uniq, wc et cut"
echo "---------------------------------"
echo ""

echo "Création du répertoire des fichiers de réponses:"
COMMAND="mkdir -p $REP_REPONSES"
echo $COMMAND
eval $COMMAND
echo ""

echo "Question 1"
COMMAND1="sort -r /etc/passwd"
echo ""
echo "Commande: $COMMAND1"
echo ""
echo "Résultat:"
eval $COMMAND1
echo ""
echo "---------------------------------"
echo ""

echo "Question 2"
COMMAND2='ls /etc | sort -r'
echo ""
echo "Commande: $COMMAND2"
echo ""
echo "Résultat:"
eval $COMMAND2
echo ""
echo "---------------------------------"
echo ""

echo "Question 3"
COMMAND3='wc -l /etc/group | cut -d" " -f1'
echo ""
echo "Commande: $COMMAND3"
echo ""
echo "Résultat:"
eval $COMMAND3
echo ""
echo "---------------------------------"
echo ""

echo "Question 4"
COMMAND4='ls /usr/share | wc -l'
echo ""
echo "Commande: $COMMAND4"
echo ""
echo "Résultat:"
eval $COMMAND4
echo ""
echo "---------------------------------"
echo ""

echo "Question 5"
COMMAND5='ls /usr/share | grep "gnome" | wc -l'
echo ""
echo "Commande: $COMMAND5"
echo ""
echo "Résultat:"
eval $COMMAND5
echo ""
echo "---------------------------------"
echo ""

echo "Question 6"
COMMAND6='ps -aux | grep "gnome" > $REP_REPONSES/proc.txt'
echo ""
echo "Commande: $COMMAND6"
eval $COMMAND6
echo ""
echo "Contenu du fichier $REP_REPONSES/proc.txt :"
cat $REP_REPONSES/proc.txt
echo ""
echo "---------------------------------"
echo ""

echo "Question 7"
COMMAND7="cut -d'/' -f1 /etc/mime.types"
echo ""
echo "Commande: $COMMAND7"
echo ""
echo "Résultat:"
eval $COMMAND7
echo ""
echo "---------------------------------"
echo ""

echo "Question 8"
COMMAND8="ps -aux | cut -d' ' -f1"
echo ""
echo "Commande: $COMMAND8"
echo ""
echo "Résultat:"
eval $COMMAND8
echo ""
echo "---------------------------------"
echo ""

echo "Question 9"
COMMAND9="ps -aux | cut -d' ' -f1 | sort"
echo ""
echo "Commande:  $COMMAND9"
echo ""
echo "Résultat:"
eval $COMMAND9
echo ""
echo "---------------------------------"
echo ""

echo "Question 10"
COMMAND10="ps -aux | cut -d' ' -f1 | sort | uniq"
echo ""
echo "Commande:  $COMMAND10"
echo ""
echo "Résultat:"
eval $COMMAND10
echo ""
echo "---------------------------------"
echo ""