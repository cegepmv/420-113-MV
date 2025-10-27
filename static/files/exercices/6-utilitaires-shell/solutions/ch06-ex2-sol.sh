#!/bin/bash

# Chapitre 6 - Utilitaires du shell
# Exercice 2 - grep et find

REP_REPONSES="/home/info/Documents/chap6"

echo ""
echo "---------------------------------"
echo "Chapitre 6 - Utilitaires du shell"
echo "Exercice 2 - grep et find"
echo "---------------------------------"
echo ""

echo "Création du répertoire des fichiers de réponses:"
COMMAND="mkdir -p $REP_REPONSES"
echo $COMMAND
eval $COMMAND
echo ""

echo "Question 1"
COMMAND1="grep '/bin/bash' /etc/passwd"
echo ""
echo "Commande: $COMMAND1"
echo ""
echo "Résultat:"
eval $COMMAND1
echo ""
echo "---------------------------------"
echo ""

echo "Question 2"
COMMAND2='grep -c "/bin/bash" /etc/passwd'
echo ""
echo "Commande: $COMMAND2"
echo ""
echo "Résultat:"
eval $COMMAND2
echo ""
echo "---------------------------------"
echo ""

echo "Question 3"
COMMAND3='grep -lr "kernel" /var/log/ 2> /dev/null'
echo ""
echo "Commande: $COMMAND3"
echo ""
echo "Résultat:"
eval $COMMAND3
echo ""
echo "---------------------------------"
echo ""

echo "Question 4"
COMMAND4='find /etc -iname "*network*" 2> /dev/null'
echo ""
echo "Commande: $COMMAND4"
echo ""
echo "Résultat:"
eval $COMMAND4
echo ""
echo "---------------------------------"
echo ""

echo "Question 7"
COMMAND7='find / -name "*kernel*" 2> /dev/null > $REP_REPONSES/kernel.txt'
echo ""
echo "Commande: $COMMAND7"
eval $COMMAND7
echo ""
echo "Contenu du fichier $REP_REPONSES/kernel.txt :"
cat $REP_REPONSES/kernel.txt
echo ""
echo "---------------------------------"
echo ""

echo "Question 8"
COMMAND8='grep -r "debian.org" /etc/ 2> /dev/null > $REP_REPONSES/resultats.txt'
echo ""
echo "Commande: $COMMAND8"
eval $COMMAND8
echo ""
echo "Contenu du fichier $REP_REPONSES/resultats.txt:"
cat $REP_REPONSES/resultats.txt
echo ""
echo "---------------------------------"
echo ""