
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



# Architecture simplifiée PostgreSQL

```
Client (QGIS / pgAdmin / psql)
        │
        ▼
 PostgreSQL Server
        │
        ├── Bases de données
        │       ├── Tables
        │       ├── Index
        │       └── Extensions (PostGIS)
        │
        ├── WAL (journaux de transactions)
        │
        └── Tablespaces (stockage disque)
```

---

# 1. Vérification des fichiers PostgreSQL

Les données PostgreSQL sont stockées dans le dossier **data** du serveur.

```
sudo ls -lah /var/lib/postgresql/16/main/base/5
```

Cette commande permet de :

- voir les fichiers des tables
- vérifier leur taille
- vérifier les permissions

---

# 2. Connexion au serveur PostgreSQL

Connexion à une base distante :

```
psql -h 192.168.10.1 -p 15432 -U editeur -d abdoulhakim
```

Commandes utiles dans l'interface `psql` :

```
\dt
\dt+
\q
```

Explication :

| commande | rôle |
|--------|------|
|\dt|liste les tables|
|\dt+|affiche les tables avec leur taille|
|\q|quitter psql|

---

# 3. Gestion du service PostgreSQL

Vérifier l'état du serveur :

```
sudo systemctl status postgresql.service
```

Démarrer PostgreSQL :

```
sudo systemctl start postgresql.service
```

Connexion locale :

```
psql postgres postgres -p 5432
```

---

# 4. Création d'une base de données

Créer une base :

```
CREATE DATABASE geobase;
```

Lister les bases :

```
\l
```

Lister les tablespaces :

```
\db
\db+
```

Se connecter à une base :

```
\c geobase
```

Installer l'extension spatiale :

```
CREATE EXTENSION postgis;
```

PostGIS permet de **gérer les données géographiques dans PostgreSQL**.

---

# 5. Configuration PostgreSQL

Avant modification du serveur, on sauvegarde le fichier de configuration.

```
sudo cp /etc/postgresql/16/main/postgresql.conf /etc/postgresql/16/main/ini_postgresql.conf
```

Modifier la configuration :

```
sudo nano /etc/postgresql/16/main/postgresql.conf
```

Configuration générée avec **PGTune** :

```
max_connections = 200
shared_buffers = 4GB
effective_cache_size = 12GB
maintenance_work_mem = 2GB
checkpoint_completion_target = 0.9
wal_buffers = 16MB
default_statistics_target = 500
random_page_cost = 1.1
effective_io_concurrency = 200
work_mem = 9892kB
min_wal_size = 4GB
max_wal_size = 16GB
max_worker_processes = 12
max_parallel_workers = 12
```

Ces paramètres optimisent :

- la mémoire
- le parallélisme
- les accès disque

Recharger la configuration :

```
sudo systemctl reload postgresql.service
```

---

# 6. Gestion des tablespaces

Les **tablespaces** permettent de stocker les données PostgreSQL dans un dossier spécifique.

Création du dossier :

```
sudo mkdir -p /srv/tablespace/
```

Donner les droits à PostgreSQL :

```
sudo chown postgres:postgres /srv/tablespace/
```

Vérifier l'arborescence :

```
ls -la /srv
```

Créer un tablespace :

```
CREATE TABLESPACE mine OWNER postgres LOCATION '/srv/tablespace';
```

Associer une base au tablespace :

```
ALTER DATABASE geobase SET TABLESPACE mine;
```

Vérifier les bases :

```
\l+
```

---

# 7. Exemple base et données

Connexion à une base :

```
psql -U postgres -p 5432 -d rugby_top
```

Afficher les données :

```
select * from clubs_rugby;
```

---

# 8. Sauvegarde PostgreSQL

Sauvegarde d'une base :

```
pg_dump -f rugby_sauv -d rugby_top -p 5432 -U postgres
```

Consulter la sauvegarde :

```
less rugby_sauv
```

Supprimer une base :

```
dropdb idgeo_local -U postgres -p 5432
```

Créer une base :

```
psql -U postgres -p5432 -c "CREATE DATABASE idgeo_local"
```

Restaurer une sauvegarde :

```
psql -U postgres -d idgeo_local1 < sauv_idgeo.sql
```

---

# 9. Sauvegarde automatique

Créer un script :

```
nano script_sauv_bdd.sh
```

Script :

```
#!/bin/bash

pg_dump -f sauv_bdd_auto.sql -U postgres -p 5432 -d idgeo_local1
```

Rendre le script exécutable :

```
chmod a+x script_sauv_bdd.sh
```

Planifier avec cron :

```
crontab -e
```

```
# m h  dom mon dow   command
57 * * * * /home/idgeo/script_sauv_bdd.sh
```

Cela permet de **sauvegarder automatiquement la base toutes les heures**.

---

# 10. Sauvegarde complète du serveur

Démarrer PostgreSQL :

```
sudo service postgresql start
```

Importer une sauvegarde complète :

```
psql -U postgres -p 5432 < /mnt/d/cours/dump_all_serveur_distant.sql
```

Vérifier les bases :

```
\l+
```

Se connecter :

```
\c abdoulhakim
```

Lister les tables :

```
\dt
```


----
