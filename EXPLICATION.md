# Explication de l'épreuve

## Application

`lib/main.dart` contient l'application Flutter. L'écran d'accueil affiche
l'illustration locale `assets/garderie_accueil.png`, le nom « Ma Garderie » et
le texte « Bienvenue dans notre garderie ». Après trois secondes, il ouvre la
page principale.

La page principale contient la barre d'application, le tiroir de navigation,
les cinq menus statiques et le bouton d'ajout. Les boutons et les menus
affichent les messages demandés dans un SnackBar. Les ressources visuelles se
trouvent dans `assets/` et `screenshots/`.

## Réalisation et branches

Chaque étape de développement est isolée dans sa branche, commitée puis
fusionnée dans `main` :

| N° | Étape demandée | Réalisation |
|---|---|---|
| 1 | Dépôt public `garderie-mobile-g2` | Dépôt cible : `https://github.com/aliabidi131/garderie-mobile-g2` |
| 2 | `feature/init-project` | Application Flutter « Ma Garderie » dans `lib/main.dart` |
| 3 | Exécuter, commiter, fusionner | Exécution Flutter et tests; commit et fusion locale dans `main` |
| 4 | `feature/splash-screen` | Image `assets/garderie_accueil.png`, nom, texte de bienvenue et délai de trois secondes |
| 5 | Commit et fusion du splash | Commit propre à `feature/splash-screen`, fusion sans fast-forward dans `main` |
| 6 | `feature/home-page` | AppBar, recherche, notifications, Drawer, FAB et titre de section |
| 7 | Commit et fusion de la page principale | Commit propre à `feature/home-page`, fusion dans `main` |
| 8 | `feature/list-view` | Les cinq menus sont définis localement dans `menusDuJour` |
| 9 | Affichage des menus | Chaque carte affiche l'emoji, le titre et la description |
| 10 | Commit et fusion de la liste | Commit propre à `feature/list-view`, fusion dans `main` |
| 11 | `feature/interactions` | Recherche, notifications, FAB, carte-menu et entrées du Drawer sont interactifs |
| 12 | Commit et fusion des interactions | Commit propre à `feature/interactions`, fusion dans `main` |
| 13 | `docs/readme` | README de présentation, technologies, installation, lancement et captures |
| 14 | Captures dans `screenshots/` | Splash, menus, Drawer et SnackBar inclus dans ce dépôt |
| 15 | Commit et fusion de la documentation | Commit propre à `docs/readme`, fusion dans `main` |
| 16 | Vérifications Git et application | Voir les commandes de vérification ci-dessous |
| 17 | Livrable | Code Flutter, documentation, captures et branches de travail locales |

Les tests d'interface se trouvent dans `test/widget_test.dart`. Les quatre
captures sont celles de l'application exécutée dans Chrome avec un viewport
mobile de 390 × 844 pixels.

## Reproduire le travail avec Git

### 1. Créer le dépôt public

Sur GitHub, créer un dépôt public nommé `garderie-mobile-g2`, sans générer
automatiquement de README (le projet en fournit déjà un). Dans un terminal,
se placer dans le dossier du projet et connecter le dépôt distant :

```bash
git init
git branch -M main
git remote add origin https://github.com/aliabidi131/garderie-mobile-g2.git
```

### 2. Créer une branche, travailler, commiter et fusionner

Exemple pour l'écran de démarrage :

```bash
git checkout main
git pull origin main
git checkout -b feature/splash-screen
# Modifier les fichiers de l'écran de démarrage
flutter test
git add lib/main.dart pubspec.yaml test/
git commit -m "Add timed welcome splash screen"
git checkout main
git merge --no-ff feature/splash-screen -m "Merge feature/splash-screen"
git push origin main
```

Répéter ce cycle pour chacune des branches listées ci-dessus en adaptant son
nom et les fichiers modifiés. Le commit de fusion `--no-ff` conserve la trace
de chaque intégration dans l'historique.

### 3. Publier l'historique et les branches

Après les fusions, publier `main` et toutes les branches locales pour conserver
l'historique demandé sur GitHub :

```bash
git push -u origin main
git push origin --all
```

Vérifier le travail localement :

```bash
git branch --all
git log --oneline --graph --decorate --all
git status
flutter analyze
flutter test
```

## Lancement

```bash
flutter pub get
flutter run -d chrome
```

Pour Android, démarrer un émulateur ou connecter un téléphone, puis exécuter
`flutter devices` et `flutter run -d <identifiant-de-l-appareil>`.
