# 📘 Métadonnées

## 🎯 Les enjeux des métadonnées en géomatique

Les métadonnées ont une importance **très forte** dans nos métiers de la géomatique.

Nous travaillons avec :
- des bases de données géographiques
- des cartes
- des services web (WMS, WFS, CSW…)
- des tableaux
- des rapports
- des images
- des documents techniques

👉 Sans métadonnées, une donnée devient inutilisable.

Les métadonnées permettent de :
- comprendre une donnée
- la retrouver
- la partager
- l’analyser correctement
- éviter les erreurs d’interprétation

---

# 📖 Définition

Une **métadonnée** signifie :

> « donnée sur la donnée »

Le mot vient du grec **meta** (à propos de).

Une métadonnée est donc une information qui décrit une autre donnée, quel que soit son support (papier ou numérique).

---

## 🧠 Exemple simple

### 📷 Exemple photo

Quand tu prends une photo avec ton téléphone :

La photo contient :
- la date
- l’heure
- la position GPS
- le modèle d’appareil
- la résolution
- les paramètres d’exposition

Ces informations sont des **métadonnées**.

Souvent on ne les voit pas, mais elles sont enregistrées automatiquement.

---

### 📧 Exemple boîte mail

Un email contient :

- l’expéditeur
- le destinataire
- la date d’envoi
- l’heure
- le sujet
- l’adresse IP d’envoi

Le contenu du message = donnée  
Les informations autour = métadonnées

---

# 🌍 Métadonnées en information géographique

En géomatique, les métadonnées décrivent :

- des données spatiales
- des couches SIG
- des cartes
- des services web
- des tableaux attributaires
- des documents techniques

Elles doivent répondre aux questions :

- **Quoi ?**
- **Qui ?**
- **Où ?**
- **Quand ?**
- **Pourquoi ?**
- **Comment ?**

---

# 📌 Contenu général des métadonnées

En général, les métadonnées contiennent :

- origine des données
- identité du créateur
- objectifs de la collecte
- référence temporelle
- référence géographique
- conditions d’accès
- modalités d’utilisation
- droits de diffusion
- contraintes légales

Elles permettent :

- l’identification
- l’authentification
- la localisation
- la compréhension
- la gouvernance de la donnée

---

# 🏛 Gouvernance de la donnée

Les métadonnées traduisent une volonté de :

- structurer
- valoriser
- partager
- sécuriser
- pérenniser la donnée

Elles sont une **clé de lecture** pour trouver, comprendre et analyser les données.

---

# 🎯 Intérêts des métadonnées

## Pour le producteur

- valoriser son travail
- éviter la duplication des efforts
- garantir la qualité
- assurer la pérennité

## Pour l’utilisateur

- comprendre si la donnée est adaptée à son besoin
- évaluer sa qualité
- connaître ses limites
- savoir comment l’utiliser

---

# 🔎 Rôle fondamental des métadonnées

1️⃣ Fournir un catalogue des ressources disponibles  
2️⃣ Donner toutes les informations utiles pour bien utiliser la ressource  

---

# 📚 Les catalogues

## Catalogues anciens (1.0)

- fiches papier
- classeur
- catalogue de magasin
- livre avec index

## Catalogues modernes

- site web
- moteur de recherche
- géocatalogue
- portail open data

---

# 📏 Normalisation des métadonnées

Pour simplifier le partage :

- Rassembler les métadonnées dans des catalogues
- Normaliser le contenu
- Normaliser la forme
- Normaliser la diffusion

---

# 📐 Standards principaux

## ISO 19115

Normalise le **contenu** des métadonnées.

Plus de 300 éléments  
22 éléments constituent le profil Core (7 obligatoires + 15 optionnels)

Répond aux questions :
- Qui ?
- Quoi ?
- Où ?
- Quand ?

## ISO 19139

Normalise la **structure XML** des métadonnées.

## CSW (Catalog Service for the Web)

Permet d’interroger un catalogue en ligne.

## INSPIRE (2007)

Directive européenne qui rend obligatoire la présence de métadonnées harmonisées pour les données environnementales.

---

# 🏢 Historique (France & Europe)

- 1998 : adaptation norme européenne en France (CNIG, AFNOR)
- Outil REPORTS développé
- 2003 : publication ISO 19115
- 2005 : adoption européenne
- Développement de Géosource
- 2007 : Directive INSPIRE

---

# 🧩 Structure des métadonnées (ISO 19115)

## 1️⃣ Identification

- Intitulé
- Résumé
- Type de ressource
- Localisateur (URL)
- Identifiant unique (URI)
- Langue

---

## 2️⃣ Classification

- Catégorie thématique
- Type de service (WMS, WFS, CSW…)

---

## 3️⃣ Mots-clés

Permettent la recherche.

---

## 4️⃣ Situation géographique

Rectangle de délimitation :
- longitude est
- longitude ouest
- latitude nord
- latitude sud

---

## 5️⃣ Référence temporelle

- date de création
- date de publication
- date de révision
- période couverte

---

## 6️⃣ Qualité et validité

- précision géométrique
- précision temporelle
- cohérence logique
- exhaustivité
- généalogie (sources + traitements)

---

# 🌐 RDF et Web Sémantique

RDF = Resource Description Framework

C’est un modèle de données du Web Sémantique.

⚠️ RDF est un modèle, pas un simple format.

---

# 💡 Pourquoi c’est crucial en géomatique ?

Parce que nous travaillons avec :

- des données géolocalisées
- des projections
- des systèmes de coordonnées
- des traitements spatiaux
- des analyses décisionnelles

Sans métadonnées :

- mauvaise interprétation
- erreur d’analyse
- problème juridique
- perte de temps
- perte de crédibilité

---

# Quels outils pour les métadonnées?

Outils de création de métadonnées:

    Excel, Acces, Libre Office base

    QGIS, Propriétés de la couche/Métadonnées, plugin PgMetadata (en lien avec lizmap), QSphere, Plume

    ArcCatalogue (ESRI)

Outils de catalogage:

GeoNetwork est une solution de catalogage Open Source de gestion des métadonnées SIG en mode client / serveur. Elle se base sur de nombreuses normes internationales pour le stockage et l'échange de métadonnées (ISO, OGC, etc.). C'est une application en très fort développement et disposant d'une communauté grandissante. Un site internet : (https://geonetwork-opensource.org/)


CKAN : Compréhensive Knowledge Archive Network

Un solution très utilisée pour les portails open-data : (https://africaopendata.org/dataset)

Un projet Open source dynamique

2 grand types de catalogues

Les catalogues Open Data : des catalogues simples

Les catalogues de données Géographiques/compatibles INSPIRE, plus complexes

Comment se retrouver dans l'immensité des catalogues de données ?

Une question d'actualité et d'avenir !

Laurent Jégou Enseignant / Chercheur de l'université de Toulouse 2 vient de publier un travail collaboratif avec la parution récente du site « Sources de données pour le diagnostic teritorial » https://www.geotests.net/donnees_diag/

Un site avec des archives

https://files.opendatarchives.fr/


Les catalogues Open Data : des catalogues simples

Des métadonnées simplifiées

Une gestion des droits simplifiée (données ouvertes)

Plus orientés donnée

Proposent souvent de la dataviz

Solutions Open-Source : CKAN, uData

Solutions propriétaires : OpenDataSoft, Isogeo ?

ex. http://data.gouv.fr

Ou la flambante version béta https://cartes.gouv.fr/catalogue/search


Focus sur les catalogues
Dans quel catalogue publier ses données ?

Le catalogue national

https://www.geoportail.gouv.fr/producteurs

Le catalogue national opendata

http://data.gouv.fr

Le catalogue régional,

https://portail.pigma.org/outils-et-services/catalogue/

Le catalogue local à son organisme déployé par vous, sur l'infra de l'entreprise ou de concert avec la DSI ?

La mise en commun et l'interopérabilité !

Recherche centralisée

Moissonnages : les catalogues moissonnent des catalogues plus petits (collectent leurs métadonnées)

 https://www.europeandataportal.eu/

https://www.geoportail.gouv.fr/producteurs

http://data.gouv.fr

https://geo.data.gouv.fr/fr

Indexation dans les moteurs de recherche

Un secteur qui se cherche encore ...

Solutions encore "jeunes"

Dichotomie artificielle entre données géo et données open data

Dataviz

Indexation du contenu des données

Problématique de commercialisation ou de rentabilité du temps à investir

# Un plugin récent PgMedata

à surveiller ! enregistrement des métadonnées dans la base PostreSQL / PostGIS

https://docs.3liz.org/qgis-pgmetadata-plugin/

concerne les données vectorielles

construit une base de données de métadonnées

permet l'export au format DCAT, HTML ou PDF

S'insère dans le client Web Lizmap avec son module PgMetadata

# uData
Plateforme dédié à l'open data

Une plateforme maintenue par data.gouv.fr, cocorico, inclue dans un groupe international OpenDataTeam.

Tout est documenté https://udata.readthedocs.io/en/stable/
Complément
Un test rapide avec une composition docker

https://udata.readthedocs.io/en/stable/quickstart/


# 🏁 Conclusion

Les métadonnées ne sont pas un simple formulaire administratif.

Elles sont :

- un outil de gouvernance
- un outil de qualité
- un outil d’interopérabilité
- un outil stratégique

En géomatique, une donnée sans métadonnées est une donnée morte.