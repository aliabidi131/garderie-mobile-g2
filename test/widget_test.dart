import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ma_garderie/main.dart';

void main() {
  testWidgets(
    'affiche le splash puis la page principale après trois secondes',
    (tester) async {
      tester.view.physicalSize = const Size(390, 844);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

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
}
