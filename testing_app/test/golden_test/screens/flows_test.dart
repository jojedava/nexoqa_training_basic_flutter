import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

import '../../utils.dart';
import '../widget_test_utils.dart';

void main() {
  group('Flows', () {
    testGoldens('Flows', (tester) async {
      await tester.pumpWidgetBuilder(
        loadTestingApp(),
        surfaceSize: TestDefaults.surfaceSize,
      );
      await screenMatchesGolden(tester, 'flow/10-home-screen-mobile');

      await tester.tap(find.byKey(const ValueKey('icon_0')));
      await tester.pumpAndSettle();

      await screenMatchesGolden(tester, 'flow/11-home-screen-mobile');

      await tester.tap(find.text('Favorites'));
      await tester.pumpAndSettle();

      expect(1, tester.widgetList(find.byType(CircleAvatar)).length);

      await screenMatchesGolden(tester, 'flow/20-favorites-screen-mobile');
    });
  });
}
