
### **Q1. Lancez la commande :**

```bash
sudo grep -r a /
```

Cette commande recherche récursivement la lettre **« a »** dans **tous les fichiers du système**, à partir de la racine `/`.

> Le processus `grep` ainsi lancé consommera beaucoup de ressources puisqu’il parcourt l’ensemble du disque.

---

### **Q2. À l’aide de la commande ps, trouvez :**

```bash
ps -al
```

* **PID du processus grep** : visible dans la colonne `PID`.
* **Utilisateur associé** : en général **root**, puisque la commande a été lancée avec `sudo`.

Exemple de sortie :

```
F S   UID   PID  PPID  C PRI  NI ADDR SZ WCHAN  TTY   TIME CMD
4 S     0  1234  1200  0  80   0 -  4230 pipe_w pts/0 00:00:00 grep
```

➡️ PID = **1234**, utilisateur = **root (id 0)**.

---

### **Q3. À l’aide de la commande top, trouvez :**

```bash
top
```

Dans la liste des processus, repérez la ligne correspondant à `grep`.
Les colonnes `%CPU` et `%MEM` indiquent :

* **%CPU** ≈ au-dessus de **90%**
* **%MEM** ≈ quelques pourcents, selon la taille de la mémoire

> Cela montre que `grep -r` sollicite fortement le processeur.

---

### **Q4. Suspendez le processus avec `CTRL+Z`**

L’appui sur `CTRL+Z` **met le processus en pause** (état « Stopped »).

Si on vérifie à nouveau avec `top`, le processus est toujours présent mais :

* **%CPU ≈ 0**
* **%MEM ≈ très faible ou inchangé**

> Le processus est toujours en mémoire, mais ne s’exécute plus activement.

---

### **Q5. Remettez le processus en avant-plan :**

```bash
fg
```

Cette commande relance le processus suspendu dans le terminal actif.
On peut ensuite le terminer proprement avec :

```
CTRL+C
```

> Cela envoie le signal `SIGINT` qui interrompt `grep`.

---

### **Q6. À partir du terminal, lancez Firefox :**

```bash
firefox
```

---

### **Q7. D’après les résultats de la commande :**

```bash
ps -au
```

Firefox crée plusieurs processus.

> Typiquement entre **5 et 10 processus** différents : un pour l’interface principale, un pour le GPU, plusieurs pour le contenu (onglets, extensions, etc.).

---

### **Q8. À quel terminal ces processus sont-ils associés ?**

Dans la colonne **TTY** du résultat de `ps -au`, on observe :

```
? 
```

➡️ Cela signifie qu’ils **ne sont associés à aucun terminal**.

> Firefox, lancé en mode graphique, n’est pas contrôlé par le terminal.

---

### **Q9. Stoppez les processus avec la commande :**

```bash
sudo killall firefox-esr
```

> `killall` envoie un signal `SIGTERM` à tous les processus portant ce nom.
> L’option `sudo` est parfois nécessaire si certains processus appartiennent à un autre utilisateur.

---

### **Q10. Lancez maintenant Firefox à partir de la barre des applications.**

#### Pourquoi les processus ne s’affichent pas avec `ps -au` ?

Parce que `ps -a` **affiche uniquement les processus associés à un terminal**.
Or, Firefox lancé depuis l’environnement graphique **n’a pas de terminal contrôleur** (`TTY = ?`).

---

### **Q11. Quelle option de ps permettrait de les afficher ?**

Il faut ajouter l’option **`x`**, qui affiche également les processus **non associés à un terminal**.

```bash
ps -aux
```

---
