#!/bin/bash

# Chapitre 6 - Utilitaires du shell
# Exercice 1 - Redirections

REP_REPONSES="/home/info/Documents/chap6"

echo ""
echo "---------------------------------"
echo "Chapitre 6 - Utilitaires du shell"
echo "Exercice 1 - Redirections"
echo "---------------------------------"
echo ""

echo "Création du répertoire des fichiers de réponses:"
COMMAND="mkdir -p $REP_REPONSES"
echo $COMMAND
eval $COMMAND
echo ""

echo "Question 1"
COMMAND1="echo 'Le soleil brille' > $REP_REPONSES/f.txt"
echo ""
echo "Commande: $COMMAND1"
eval $COMMAND1
echo ""
echo "Contenu du fichier $REP_REPONSES/f.txt:"
cat $REP_REPONSES/f.txt
echo ""
echo "---------------------------------"
echo ""

echo "Question 2"
COMMAND2='echo "La lune se lève" >> $REP_REPONSES/f.txt'
echo ""
echo "Commande: $COMMAND2"
eval $COMMAND2
echo ""
echo "Contenu du fichier $REP_REPONSES/f.txt:"
cat $REP_REPONSES/f.txt
echo ""
echo "---------------------------------"
echo ""

echo "Question 3"
COMMAND3='ip address > $REP_REPONSES/ip.txt'
echo ""
echo "Commande: $COMMAND3"
eval $COMMAND3
echo ""
echo "Contenu du fichier $REP_REPONSES/ip.txt:"
cat $REP_REPONSES/ip.txt
echo ""
echo "---------------------------------"
echo ""

echo "Question 4"
COMMAND4='MACHINEID=$(cat /etc/machine-id)'
echo ""
echo "Commande: $COMMAND4"
eval $COMMAND4
echo ""
echo "Valeur de MACHINEID: $MACHINEID"
echo ""
echo "---------------------------------"
echo ""

echo "Question 5"
COMMAND5='head -2 /etc/hosts'
echo ""
echo "Commande: $COMMAND5"
echo ""
echo "Résultat:"
eval $COMMAND5
echo ""
echo "---------------------------------"
echo ""

echo "Question 6"
COMMAND6='ls /etc  |  head -5'
echo ""
echo "Commande: $COMMAND6"
echo ""
echo "Résultat:"
eval $COMMAND6
echo ""
echo "---------------------------------"
echo ""

echo "Question 7"
COMMAND7='ls /etc/systemd/*.conf > $REP_REPONSES/liste.txt'
echo ""
echo "Commande: $COMMAND7"
eval $COMMAND7
echo ""
echo "Contenu du fichier $REP_REPONSES/liste.txt :"
cat $REP_REPONSES/liste.txt
echo ""
echo "---------------------------------"
echo ""

echo "Question 8"
COMMAND8='ls /etc/systemd/*.conf | head -3  > $REP_REPONSES/liste2.txt'
echo ""
echo "Commande: $COMMAND8"
eval $COMMAND8
echo ""
echo "Contenu du fichier $REP_REPONSES/liste2.txt :"
cat $REP_REPONSES/liste2.txt
echo ""
echo "---------------------------------"
echo ""

echo "Question 9"
COMMAND9='tail -2 /etc/group | head -1'
echo ""
echo "Commande:  $COMMAND9"
echo ""
echo "Résultat:"
eval $COMMAND9
echo ""
echo "---------------------------------"
echo ""