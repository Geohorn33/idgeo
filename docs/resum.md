# 📘 A2 – MÉTADONNÉES
## ⚡ FICHE ULTRA CONDENSÉE – RÉVISION RAPIDE

---

# 1️⃣ Définition

## ✅ Métadonnée = donnée sur la donnée

➡ Carte d’identité d’une ressource (couche SIG, service WMS, fichier, table…).

Elle répond aux questions :
- Qui ?
- Quoi ?
- Où ?
- Quand ?
- Comment ?
- Pourquoi ?

---

# 2️⃣ Pourquoi c’est indispensable ?

## 🎯 4 objectifs principaux

1. 🔎 Trouver la donnée (catalogue)
2. 🧠 Comprendre la donnée
3. 🛠 Utiliser correctement la donnée
4. 🗂 Conserver la mémoire / éviter duplication

---

# 3️⃣ Les 3 niveaux de métadonnées

## 1️⃣ Découverte
But : repérer la donnée

Contient :
- Titre
- Résumé
- Mots-clés
- Emprise
- Dates

---

## 2️⃣ Exploration
But : vérifier si adaptée

Contient :
- Résolution
- Méthode de production
- Qualité générale
- Format

---

## 3️⃣ Exploitation
But : intégrer et utiliser

Contient :
- Projection
- Généalogie
- Dictionnaire des champs
- Contraintes d’usage

---

# 4️⃣ Standards à connaître

## 🌍 ISO 19115
➡ Contenu des métadonnées (quoi écrire)

## 🌐 ISO 19139
➡ Syntaxe XML (comment structurer)

## 🔎 CSW
➡ Service web pour interroger un catalogue

## 🇪🇺 INSPIRE
➡ Obligation européenne pour données environnementales

## 🌐 DCAT
➡ Standard Open Data basé sur RDF (web sémantique)

---

# 5️⃣ Structure ISO 19115 (à mémoriser)

## A) Identification
- Titre
- Résumé
- Type
- Identifiant unique
- URL

---

## B) Classification
- Thème
- Type de service (WMS = consultation, WFS = téléchargement)

---

## C) Mots-clés
Ex : chaussée, amiante, infrastructure

---

## D) Emprise géographique
Rectangle : lat/long

---

## E) Référence temporelle
- Date création
- Date révision
- Étendue temporelle

---

## F) Qualité
- Généalogie (sources + traitements)
- Résolution spatiale

---

## G) Conformité
- Conforme INSPIRE ?

---

## H) Contraintes
- Libre accès ?
- Usage interne ?
- Payant ?

---

## I) Responsables
- Producteur
- Gestionnaire
- Propriétaire
- Distributeur
- Point de contact

---

# 6️⃣ RDF (important)

Structure en triplet :

Sujet – Prédicat – Objet

Exemple :
Jeu_de_données – a_producteur – DIR_Est

---

# 7️⃣ Catalogues

## 🔹 Open Data
- data.gouv.fr
- CKAN
- uData

Caractéristiques :
- Métadonnées simples
- Données ouvertes

---

## 🔹 Catalogues géographiques
- GeoNetwork
- Géocatalogue national

Caractéristiques :
- Métadonnées complètes
- ISO + INSPIRE
- Gestion avancée des droits

---

# 8️⃣ Outils pratiques

- QGIS (éditeur métadonnées)
- ArcCatalog
- GeoNetwork
- PgMetadata (PostGIS)

---

# 9️⃣ Exemple ultra simple

Titre : Réseau chaussées DIR Est 2026  
Producteur : DIR Est  
Date : 2026  
Projection : RGF93 / Lambert-93  
Source : Relevé terrain  
Qualité : validée  
Contraintes : usage interne  

---

# 🔟 À retenir absolument

✔ Métadonnée = carte d’identité  
✔ ISO 19115 = contenu  
✔ ISO 19139 = XML  
✔ INSPIRE = obligation UE  
✔ 3 niveaux : découverte / exploration / exploitation  
✔ Généalogie = historique de production  
✔ Toujours indiquer responsable + dates + emprise + qualité  

---

🔥 Si tu maîtrises cette fiche → tu maîtrises 80% du chapitre A2 Métadonnées.






