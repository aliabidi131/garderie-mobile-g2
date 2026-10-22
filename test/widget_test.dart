import 'package:flutter_test/flutter_test.dart';
import 'package:ma_garderie/main.dart';

void main() {
  testWidgets(
    'affiche le splash puis la page principale après trois secondes',
    (tester) async {
      await tester.pumpWidget(const MaGarderieApp());
      expect(find.text('Ma Garderie'), findsOneWidget);
      expect(find.text('Bienvenue dans notre garderie'), findsOneWidget);

      await tester.pump(const Duration(seconds: 3));
      await tester.pumpAndSettle();
      expect(find.text('Ma Garderie'), findsOneWidget);
      expect(find.text('Menus du jour'), findsOneWidget);
      expect(find.text('Bienvenue dans notre garderie'), findsNothing);
    },
  );
}
