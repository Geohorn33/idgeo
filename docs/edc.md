# Étude des cas BDD

# I. Présentation du projet

## 1. Commande

L’agglomération de Losse-en-Gelaisse possède une base de données d’accessibilité créée pour répondre aux obligations de la Loi d’Orientation des Mobilités (LOM). Elle est stockée sous PostgreSQL/PostGIS et suit le modèle CNIG, couvrant la voirie et un rayon de 200 m autour des arrêts prioritaires.

La collectivité souhaite désormais mieux exploiter et fiabiliser ces données. La mission confiée au prestataire repose sur deux volets :

- Outil web d’analyse de l’accessibilité  
- Méthodologie de contrôle qualité  

---

## 2. Périmètre de travail

L’étude s’inscrit dans le cadre des obligations liées à la Loi d’Orientation des Mobilités (LOM) et couvre l’intégralité du territoire de l’agglomération de Losse-en-Gelaisse.

Le projet inclut deux objectifs principaux :

### Développement d’un outil web open source

Conception d’une solution d’analyse de l’accessibilité incluant :
- Cartographies thématiques  
- Backoffice de gestion des comptes et des droits  
- Interface responsive (Web et Mobile)  

### Méthodologie et outils de contrôle des données

Mise au point d’outils pour vérifier la conformité des données externes :
- Télédétection  
- LIDAR  
- Modèles Numériques de Terrain (MNT)  

### Hors périmètre

Le projet ne couvre pas :
- Les données « indoor » (ERP et cheminements internes)  
- La collecte initiale des données (réalisée par un prestataire tiers)  
- L’assistance, la maintenance et la mise à jour au-delà de la durée contractuelle  

---

## 3. Analyse des besoins

L’analyse des besoins se divise en trois catégories :

### a. Besoins fonctionnels : Outil web d’analyse

- **Aide à la décision** : Identifier les zones prioritaires d’intervention en croisant accessibilité réelle, offre de transport (arrêts) et densité de population.  
- **Communication et concertation** : Générer des cartographies thématiques exportables pour les réunions avec les associations PMR.  
- **Suivi temporel** : Visualiser l’impact des chantiers via la gestion des zones de travaux sur une période donnée.  
- **Accessibilité numérique** : Garantir la conformité RGAA (> 85 %) et l’accessibilité universelle de l’outil.  

### b. Besoins techniques : Contrôle qualité

- **Standardisation** : Automatiser la vérification de conformité au standard CNIG Accessibilité.  
- **Fiabilisation des données** : Détecter les anomalies (ex. passages piétons manquants, erreurs de saisie).  
- **Précision topographique** : Vérifier pentes et dévers via LIDAR et/ou MNT.  

### c. Besoins d’administration et de gouvernance

- **Interopérabilité** : Utilisation exclusive de solutions open source.  
- **Transparence et traçabilité** : Documentation via métadonnées conformes à la directive INSPIRE.  

---

## 4. Déroulement de la prestation

Le projet est structuré en plusieurs phases :

### Phase 1 : Analyse des données existantes
- Étude du MCD CNIG Accessibilité  
- Compréhension de la structure actuelle  

### Phase 2 : Structuration et modélisation
Proposition d’un schéma organisé en sous-ensembles :
- Schéma Accessibilité  
- Schéma Travaux  
- Schéma Transport (GTFS – complémentaire)  

### Phase 3 : Analyse qualité
Application des principes de la norme ISO 19157 :
- Cohérence logique  
- Exhaustivité  
- Précision thématique  
- Précision de position  
- Qualité temporelle  

---

# II. Étude des sources de données et analyse critique

---

# III. Contenu de la base de données

## 1. Description et exigences générales

- a. Présentation du contenu des données  
- b. Identifiants  
- c. Positionnement indirect  
- d. Modélisation géométrique  
- e. Topologie  
- f. Systèmes de référence  
- g. Modélisation temporelle  

## 2. Modèle Conceptuel de Données (MCD)

---

# IV. Qualité des données

---

# V. Administration et cycle de vie des données

## a. Cycle de vie des données  

## b. Gestion des utilisateurs  

---

# VI. Métadonnées

---

# VII. Annexes

---

# Prérequis

## Plan technique

- MCD conforme au standard CNIG Accessibilité  
- Accès complet administrateur à PostgreSQL  

## Plan organisationnel

- Collaboration avec les services SIG et Voirie  
- Définition d’un processus de validation à chaque phase  

## Plan contractuel

- Convention de mise à disposition des données  
- Description des méthodes d’administration et de gestion des métadonnées  

## Sécurité et qualité

- Respect du RGPD  
- Plan de sauvegarde et de restauration  
- Objectif de conformité ISO 19115  