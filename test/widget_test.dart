import 'package:flutter_test/flutter_test.dart';
import 'package:ma_garderie/main.dart';

void main() {
  testWidgets('affiche le titre Ma Garderie', (tester) async {
    await tester.pumpWidget(const MaGarderieApp());
    expect(find.text('Ma Garderie'), findsNWidgets(2));
  });
}
