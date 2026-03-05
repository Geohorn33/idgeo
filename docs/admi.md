# Administrer son serveur de bases de données 

## Objectifs de la séquence 
avoir le soucis de la pérennité et de la cohérence des données
# tt le concept d'administration : on doit diffrencier la gestion du serveur de la gestion des BD
- metiers autours de BD
- systéme d'exploitation 
- une base de dev et une base de prod

# etapes de la creation d'un systeme bd
- etablir caracteritique 
- evalution du materiel serveur
- installation logiciel postgresql/postgis
- creer et ouvrir la base de donnees
- sauvegarde de la ou des bd
- creer et gerer les utilisateur et leur droit dacces
- implementer la structure de base
- optimiser les performance de la base

# architecture et arborescence
- datas
-cofiguration
- binaires

# focus sur les tablespaces
# le role de dba
la gestion des droits utilisateurs,

la gestion des tablespaces,

la gestion de l'espace disque,

identifier les tables à suivre,

la gestion des sauvegardes

# Manipulations diverses

Pgtune & modification de la configuration du serveur

Gestion des tablespaces

Création d'une base et attribution du tablespace

Création d'une base de données template

Création d'un utilisateur = ! de postgres

Création de tables et affectation à un tablespace

Création d'indexes et affectation à un tablespace

------



###  Concept d'administration : différence entre SG et DB

composants d'un sgbd

composants bd => base de données
- modéles de données ( mcd, mld,mpd)
- les schémas
- les données
-  application connectees ( clients)
- utilisateurs de la base de donnees (roles)
- requetes
- indexes

----

composants sg => systeme de gestion
- architestecteur
- reseau
- cpu
- ram
- stcokage
- os

----

#### Les métiers autour de la base de données vs taille de l'entreprise

- Il existe plusieurs fonctions au sein d'un système de gestion de base de données :

--  l'administrateur système (SI),

--  l'administrateur de base de données (DBA),

--  le développeur d'application,

-- l'utilisateur


## Système d'exploitation du serveur

Il est possible d'installer le serveur sur une machine windows ou linux.

Dans la mesure où les sources sont disponibles, il est tout à fait possible de compiler les sources pour obtenir un exécutable adapté.

La plus-part des distributions "standard" ont des exécutables disponibles au téléchargement.

https://www.postgresql.org/download/

Citons la présence dans les dépôts "apt" côté Debian / Ubuntu https://www.postgresql.org/download/linux/ubuntu/

et d'un ".exe" pour windows https://www.postgresql.org/download/windows/ avec son installeur EDB.

## Une base de dev et une base de prod

La face cachée de l'iceberg ...

- base de dev : serveur de développement est le premier environnement où les développeurs travaillent. C’est ici que les idées prennent forme. Ce serveur permet aux équipes de coder, tester et itérer rapidement sans affecter la version active du site. Pour le développement d'application mobile & web, on choisira des frameworks mixtes comme flutter ou React Native.

D’abord, ce serveur permet de tester de nouvelles fonctionnalités sans crainte de perturber le site en production. Les développeurs peuvent se concentrer sur leur code, corriger les erreurs et optimiser les performances. Grâce à cet environnement isolé, les risques de briser la version en ligne du site sont nuls. De plus, les équipes peuvent expérimenter librement, ce qui est crucial pour l’innovation.

Ensuite, un serveur de développement est souvent configuré différemment d’un serveur de production. Il utilise des bases de données fictives ou simplifiées. Cela permet de gagner du temps lors des tests tout en s’assurant que les fonctionnalités de base fonctionnent correctement. On utilise aussi une copie du site en production sur un environnement de test ou de développement pendant les opérations de maintenance de site web.

Enfin, cet environnement encourage le travail collaboratif. Chaque développeur peut travailler sur sa propre branche du projet sans interférer avec les autres. En conséquence, les équipes peuvent avancer de manière plus agile et plus rapide.

- base de prod : Ensuite vient le serveur de préproduction, souvent appelé serveur de staging. Ce serveur est une réplique quasi exacte du serveur de production. Il permet de simuler l’environnement réel du site avant de lancer les modifications en ligne. Cela offre une vue réaliste des performances du site.

Tout d’abord, le serveur de préproduction permet de valider les fonctionnalités et les ajustements dans un cadre très proche de la production. Grâce à cela, les développeurs et les parties prenantes peuvent voir le site comme un utilisateur final le verrait. Les bugs, incohérences ou ralentissements peuvent être détectés et corrigés avant que le site ne soit accessible au public.

Aussi, ce serveur joue un rôle crucial dans la validation des mises à jour. Les équipes peuvent vérifier si les nouveaux développements interagissent bien avec les anciennes fonctionnalités. Ainsi, il est possible d’éviter les régressions, c’est-à-dire la détérioration de fonctions qui étaient déjà en place.

De plus, un serveur de préproduction est un outil essentiel pour les équipes de QA (Quality Assurance). Ces dernières peuvent effectuer une batterie de tests rigoureux avant de valider le passage en production. Cela garantit que chaque mise à jour se déroule de manière fluide, sans interruption pour les utilisateurs finaux.

Problématiques

    ne pas l'oublier ! (pour le dimensionnement)

    à partir de quel moment ? passage en prod vs évolution, parlons fonctionnalités et non volume de données.

    quand et comment harmoniser la version de dev sur la prod ?



# etapes de la creation dune systemes de base de donnees


1. Établir les caractéristiques de la base

Ici nous cherchons à déterminer quels vont être les finalités de la base de données. Dans le cas du géomaticien, la principale sera spatiale.

2. Évaluation du matériel du serveur

Cela dépend de plusieurs facteurs :

quantité de données qui vont être stockées = prévision de charge

nombre d'utilisateur se connectant en même temps

quelles données vont être traitées = images satellites vs couche de vecteurs ponctuel

3. Installation du logiciel PostgreSQL (serveur et clients)

Suivant le choix de l'OS :

utiliser un exécutable existant ou repartir des sources 

se familiariser avec l'arborescence (windows vs linux)

Quels clients vont se connecter à la base (psql, pgadmin, dbeaver (JDBC), QGis, Webmap)

4. Créer et ouvrir la base de données
Création d'un groupe de base de données, appelé CLUSTER => il s'agit en premier lieu d'initialiser un emplacement de stockage pour la base de données .

suivant l'installeur choisi (par exemple sur windows), l'intdb est effectué automatiquement. Ceci est modifiable ...

On va ensuite définir les TABLESPACE à l'intérieur de ce répertoire, comme moyen d'organiser (séparer au minimum les bases dans des sous répertoires) ou à l'extérieur afin d'optimiser si on place le tablespace sur un stockage différent (disque plus rapide pour les calculs et lent pour la stockage lourd)

5. Stratégie de sauvegarde de la base de données

On distingue deux types de sauvegardes :

    la sauvegarde manuelle avec l'utilisation de pg_dump

    la sauvegarde automatisée avec l'utilisation de script

L'enregistrement des transactions est stocké dans les journaux de transactions appelés WAL ( write aheal lo) cest une transaction , qui ont une taille prédéfinie de 32 Mo sous linux.

Il s'agit ni plus ni moins de l'historique de tout ce qui se passe sur la base.

Les transactions assurent la fiabilité de la base et sa cohérence en gérant les accès concurrents ou que le système tombe en panne pendant un traitement.

Il faut être vigilant là aussi à la configuration par exemple sur de grosses mises à jour qui peuvent rapidement saturer l'espace disque et planter le serveur.

6. Créer et gérer les utilisateurs et leur droits d'accés (stratégie de sécurité dédiée)

La stratégie des droits d'utilisateurs, du nombre d'utilisateurs se connectant en même temps à la base fait partie de la phase conceptuelle de la base de données.

Au niveau du déploiement d'une base de données, on passe à la phase de création et d'octrois des droits aux utilisateurs.
CTRL+C pour copier, CTRL+V pour coller
1

CREATE ROLE

CREATE ROLE

CTRL+C pour copier, CTRL+V pour coller
1

CREATE USER

CREATE USER

On définie dans la configuration du serveur la limite max du nombre d'utilisateurs dans le fichier 'postgresql.conf' .
7. Implémenter la base

Phase usuelle de l'administration de la BD

Modifier la structure de la base : même si non conseillé, cela peut arriver !

Par exemple, modifier un identifiant parce que le client l'exige !

Il faudra mesurer les impacts sur le modèle conceptuel de données mais aussi sur toutes les applications tierces qui utilisent cet ID.

Ajout de données en masse : opérations susceptibles de fragiliser la structure.

Imaginer une phase de maintenance / test avant la (re)mise en production.

Suppression de données : mesurer les impacts avant la suppression
8. Sauvegarder la base de données fonctionnelle

La stratégie de sauvegarde peut difficilement se concevoir de manière manuelle.

Une base en production se doit de disposer d'un système de sauvegarde automatique.

Une recherche rapide propose différents solutions, en voici deux :

    https://github.com/DiouxX/script_backup_postgresql

    http://nils.hamerlinck.fr/blog/2015/05/04/backup-automatique-base-postgresql/
9. Optimiser les performances de la base

Paramétrer le serveur PostgreSQL pour le spatial

http://www.postgis.fr/chrome/site/docs/workshop-foss4g/doc/tuning.html

PGTune

https://pgtune.leopard.in.ua/



---- 

# Fichiers importants PostgreSQL

## OID

Chaque objet PostgreSQL possède un identifiant **OID**.

Les données sont stockées dans le dossier :

```
C:\Program Files\PostgreSQL\17\data\base
```

---

## pg_hba.conf

Fichier qui gère :

- l’authentification
- les connexions utilisateurs
- les machines autorisées à accéder au serveur

Il utilise les **adresses IP (IPv4)**.

Exemple :

```
192.168.1.10/32
```

---

## postgresql.conf

Fichier principal de configuration.

Il permet de régler :

- les performances
- la mémoire
- les connexions
- la sécurité du serveur 



----

# Pratique (Commandes)

## Vérifier l'adresse IP
```
ipconfig
```

## Installer PostgreSQL (Linux)
```
sudo apt install postgresql
```

## Sauvegarder le fichier de configuration
```
sudo cp /etc/postgresql/16/main/pg_hba.conf /etc/postgresql/16/main/pg_hba_ini.conf
```

## Modifier la configuration
```
sudo nano /etc/postgresql/16/main/pg_hba.conf
```

## Recharger le service
```
sudo systemctl reload postgresql.service
```

## Se connecter à PostgreSQL
```
psql -U postgres -d postgres
```

## Voir les processus PostgreSQL
```
ps aux | grep postgres
```

## Installer htop
```
sudo apt install htop
```

## Lancer htop
```
htop
```

## Désactiver PostgreSQL
```
sudo systemctl disable postgresql
```

## Voir le statut du service
```
sudo systemctl status postgresql.service
```

## Nettoyer le terminal
```
clear
```

---

# Méthode sur Windows

## Mettre le service PostgreSQL en démarrage manuel

## Créer un fichier `.bat`

```
@echo off
net start postgresql-x64-17
pause
```

## Créer un raccourci sur le bureau

Activer l’option :

```
Exécuter en tant qu’administrateur
```

## Personnaliser l’icône si nécessaire


---- 

binaire c serveur interne 

