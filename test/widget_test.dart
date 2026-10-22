import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ma_garderie/main.dart';

void main() {
  void setMobileSize(WidgetTester tester) {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
  }

  testWidgets(
    'affiche le splash puis la page principale après trois secondes',
    (tester) async {
      setMobileSize(tester);
      await tester.pumpWidget(const MaGarderieApp());
      expect(find.text('Ma Garderie'), findsOneWidget);
      expect(find.text('Bienvenue dans notre garderie'), findsOneWidget);

      await tester.pump(const Duration(seconds: 3));
      await tester.pumpAndSettle();
      expect(find.text('Ma Garderie'), findsOneWidget);
      expect(find.text('Menus du jour'), findsOneWidget);
      expect(find.text('Petit déjeuner'), findsOneWidget);
      expect(find.text('Lait, céréales et fruits'), findsOneWidget);
      expect(find.text('Déjeuner'), findsOneWidget);
      expect(find.text('Goûter'), findsOneWidget);
      expect(find.text('Jus de fruits'), findsOneWidget);
      expect(find.text('Fruits frais'), findsOneWidget);
      expect(find.text('Bienvenue dans notre garderie'), findsNothing);
    },
  );

  testWidgets(
    'les boutons, les menus et le tiroir répondent aux interactions',
    (tester) async {
      setMobileSize(tester);
      await tester.pumpWidget(const MaGarderieApp());
      await tester.pump(const Duration(seconds: 3));
      await tester.pumpAndSettle();

      await tester.tap(find.byTooltip('Recherche'));
      await tester.pump();
      expect(find.text('Rechercher un menu'), findsOneWidget);

      await tester.tap(find.byTooltip('Notifications'));
      await tester.pump();
      expect(find.text('Aucune notification'), findsOneWidget);

      await tester.tap(find.byTooltip('Ajouter un menu'));
      await tester.pump();
      expect(find.text('Ajouter un menu'), findsOneWidget);

      await tester.tap(find.text('Déjeuner'));
      await tester.pump();
      expect(find.text('Déjeuner'), findsNWidgets(2));

      await tester.tap(find.byIcon(Icons.menu));
      await tester.pumpAndSettle();
      expect(find.text('Accueil'), findsOneWidget);
      expect(find.text('Menus'), findsOneWidget);
      expect(find.text('À propos'), findsOneWidget);

      await tester.tap(find.text('À propos'));
      await tester.pumpAndSettle();
      expect(find.text('Ma Garderie — Gestion des menus'), findsOneWidget);

      await tester.tap(find.byIcon(Icons.menu));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Menus'));
      await tester.pumpAndSettle();
      expect(find.text('Menus du jour'), findsOneWidget);
      expect(find.text('Fruits frais'), findsOneWidget);
    },
  );
}
