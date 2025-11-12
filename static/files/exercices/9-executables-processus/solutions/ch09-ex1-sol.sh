#Q1
nano compteur.c
./compt
sudo gcc compteur.c -o compt
./compt
# Affiche les chiffres de 0 à 9 inclusivement

#Q2
echo $PATH
sudo mv compt /usr/bin
compt
which compt
#/usr/bin/compt

#Q3
nano fibs.py
python3 fibs.py

#Q4
nano fibs.py 
sudo chmod a+x fibs.py 
mv fibs.py /usr/bin
sudo mv fibs.py /usr/bin
fibs.py

#Q5
sudo apt update
sudo apt install git
git clone https://github.com/elerch/cadaver.git
cd cadaver/
./configure
make
make install
sudo make install
#La commande ./configure est précédé de ./, car elle ne fait pas partie du PATH et son chemin doit être précisé au complet.

#Q6
which cadaver
#/usr/local/bin/cadaver
