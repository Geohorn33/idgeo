# PostgreSQL / PostGIS — Gestion des rôles et des droits (Correction exercice)

## 1. Création de la base `template_gis`

La base `template_gis` est utilisée comme **modèle** pour créer d'autres bases SIG.

Elle contient plusieurs extensions nécessaires aux projets géomatiques :

* `postgis`
* `hstore`
* `pgrouting`
* `postgres_fdw`
* `ogr_fdw`

Vérification de l'installation de PostGIS :

```sql
SELECT PostGIS_full_version();
```

La base est créée avec un **superutilisateur**, car certaines extensions nécessitent les droits `SUPERUSER`.

Ensuite les administrateurs peuvent créer de nouvelles bases à partir de ce **template**.

Bonne pratique :

> Il n'est pas recommandé de travailler directement dans le schéma `public`.

---

# 2. Création du rôle groupe admin

Rôle groupe sans connexion :

```sql
CREATE ROLE admin
NOLOGIN
NOSUPERUSER
INHERIT
NOCREATEDB
NOCREATEROLE
NOREPLICATION;
```

Ce rôle sert à **gérer les privilèges administrateurs**.

---

# 3. Création du rôle stagiaire

Utilisateur avec connexion appartenant au groupe `admin`.

```sql
CREATE ROLE stagiaire WITH
LOGIN
NOSUPERUSER
INHERIT
NOCREATEDB
NOCREATEROLE
NOREPLICATION
PASSWORD 'motdepasse';

GRANT admin TO stagiaire;
```

Le rôle `stagiaire` devient membre du groupe **admin**.

---

# 4. Création de la base `demo_role`

La base est créée à partir du template `template_gis`.

```sql
CREATE DATABASE demo_role
WITH TEMPLATE template_gis
OWNER admin;
```

---

# 5. Création des schémas

Deux schémas sont créés :

* `production`
* `consultation`

```sql
CREATE SCHEMA production AUTHORIZATION stagiaire;

CREATE SCHEMA consultation AUTHORIZATION stagiaire;
```

---

# 6. Chargement des données

Les données sont importées dans les schémas correspondants :

| Donnée      | Schéma       |
| ----------- | ------------ |
| communes    | consultation |
| territoires | production   |
| pav         | production   |

---

# 7. Création des rôles fonctionnels

## 7.1 Rôle `ecrivains`

Les écrivains peuvent **modifier les données**.

```sql
CREATE ROLE ecrivains WITH
NOLOGIN
NOSUPERUSER
INHERIT
NOCREATEDB
NOCREATEROLE
NOREPLICATION;
```

---

## 7.2 Rôle `lecteurs`

Les lecteurs ont **un accès lecture uniquement**.

```sql
CREATE ROLE lecteurs WITH
NOLOGIN
NOSUPERUSER
INHERIT
NOCREATEDB
NOCREATEROLE
NOREPLICATION;
```

---

# 8. Création des utilisateurs

## 8.1 Utilisateur `adama`

Adama appartient aux rôles **ecrivains** et **lecteurs**.

```sql
CREATE ROLE adama WITH
LOGIN
NOSUPERUSER
INHERIT
NOCREATEDB
NOCREATEROLE
NOREPLICATION
NOBYPASSRLS;

GRANT ecrivains, lecteurs TO adama;
```

---

## 8.2 Utilisateur `bakari`

Bakari appartient uniquement au rôle **lecteurs**.

```sql
CREATE ROLE bakari WITH
LOGIN
NOSUPERUSER
INHERIT
NOCREATEDB
NOCREATEROLE
NOREPLICATION
NOBYPASSRLS;

GRANT lecteurs TO bakari;
```

---

# 9. Attribution des droits sur les schémas

## Schéma `consultation`

Tous les utilisateurs ont **uniquement un accès lecture**.

```sql
GRANT USAGE ON SCHEMA consultation TO lecteurs;
GRANT SELECT ON ALL TABLES IN SCHEMA consultation TO lecteurs;
```

---

## Schéma `production`

### Droits pour les écrivains

Les écrivains peuvent :

* créer des tables
* modifier les données
* supprimer des données

```sql
GRANT USAGE ON SCHEMA production TO ecrivains;

GRANT INSERT, UPDATE, DELETE
ON ALL TABLES IN SCHEMA production
TO ecrivains;
```

---

### Droits pour les lecteurs

Les lecteurs peuvent seulement consulter les données.

```sql
GRANT USAGE ON SCHEMA production TO lecteurs;

GRANT SELECT
ON ALL TABLES IN SCHEMA production
TO lecteurs;
```

---

# 10. Droits sur les tables

Exemple sur la table :

`points_dapport_volontaire_dechets_et_moyens_techniques`

### Droits écrivains

```sql
GRANT INSERT, UPDATE, DELETE
ON production.points_dapport_volontaire_dechets_et_moyens_techniques
TO ecrivains;
```

---

### Droits lecteurs

```sql
GRANT SELECT
ON production.points_dapport_volontaire_dechets_et_moyens_techniques
TO lecteurs;
```

---

# 11. Droits par défaut

Pour que les **nouvelles tables héritent automatiquement des droits** :

```sql
ALTER DEFAULT PRIVILEGES IN SCHEMA production
GRANT SELECT ON TABLES TO lecteurs;

ALTER DEFAULT PRIVILEGES IN SCHEMA production
GRANT INSERT, UPDATE, DELETE ON TABLES TO ecrivains;
```

---

# 12. Test dans QGIS

Connexion avec **adama**

Résultat :

* accès aux schémas
* modification des tables
* création de nouvelles tables
* édition des données

Connexion avec **bakari**

Résultat :

* accès en lecture uniquement

---

# 13. Import d'une table avec `stagiaire`

Import de :

```
territoire_tm.shp
```

dans le schéma :

```
production
```

Ensuite connexion avec **adama** pour vérifier les droits :

* ajout
* modification
* suppression

---

# 14. Import des données WFS avec `ogr_fdw`

Création du serveur FDW :

```sql
CREATE SERVER fdw_ogr_inpn_metropole
FOREIGN DATA WRAPPER ogr_fdw
OPTIONS (
datasource 'WFS:http://ws.carmencarto.fr/WFS/119/fxx_inpn?',
format 'WFS'
);
```

Création du schéma :

```sql
CREATE SCHEMA IF NOT EXISTS inpn_metropole;
```

Import des tables :

```sql
IMPORT FOREIGN SCHEMA ogr_all
FROM SERVER fdw_ogr_inpn_metropole
INTO inpn_metropole
OPTIONS (
launder_table_names 'true',
launder_column_names 'true'
);
```

Résultat :

**35 tables importées dans PostgreSQL**.

---

# Conclusion

Cette architecture permet :

* une **gestion claire des droits**
* une **séparation production / consultation**
* une **gestion par rôles (RBAC)**

| Rôle      | Accès              |
| --------- | ------------------ |
| ecrivains | lecture + écriture |
| lecteurs  | lecture seule      |
| adama     | écrivain + lecteur |
| bakari    | lecteur            |

Cette organisation est une **bonne pratique pour les bases de données SIG professionnelles**.
