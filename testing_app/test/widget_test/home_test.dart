import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../utils.dart';

void main() {
  group('Home Page Widget Tests', () {
    // BEGINNING OF NEW CONTENT
    testWidgets('Testing if ListView shows up', (tester) async {
      await tester.pumpWidget(createHomeScreen());
      expect(find.byType(ListView), findsOneWidget);
    });
    // END OF NEW CONTENT

    testWidgets('Testing Scrolling', (tester) async {
      await tester.pumpWidget(createHomeScreen());
      expect(find.text('Item 0'), findsOneWidget);
      await tester.fling(
        find.byType(ListView),
        const Offset(0, -200),
        3000,
      );
      await tester.pumpAndSettle();
      expect(find.text('Item 0'), findsNothing);
    });
  });
}