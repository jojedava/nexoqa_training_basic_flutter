import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:testing_app/screens/home.dart';

import '../utils.dart';

void main() {
  group('Home Page Widget Tests', () {
    // BEGINNING OF NEW CONTENT
    testWidgets('Testing if ListView shows up', (tester) async {
      await tester.pumpWidget(loadScreen(const HomePage()));
      expect(find.byType(ListView), findsOneWidget);
    });
    // END OF NEW CONTENT

    testWidgets('Testing Scrolling', (tester) async {
      await tester.pumpWidget(loadScreen(const HomePage()));
      expect(find.text('Item 0'), findsOneWidget);
      await tester.fling(
        find.byType(ListView),
        const Offset(0, -100),
        1000,
      );
      await tester.pumpAndSettle();
      expect(find.text('Item 0'), findsNothing);
    });

    testWidgets('After tapping the favorite icon changes', (tester) async {
      await tester.pumpWidget(loadScreen(const HomePage()));

      expect(find.text('Item 0'), findsOneWidget);

      await tester.tap(find.byKey(const Key('icon_0')));
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.favorite), findsNWidgets(1));

      await tester.tap(find.byKey(const Key('icon_1')));
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.favorite), findsNWidgets(2));
    });
  });
}
