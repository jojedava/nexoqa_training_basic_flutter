import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:provider/provider.dart';
import 'package:testing_app/models/favorites.dart';
import 'package:testing_app/screens/favorites.dart';

import '../../utils.dart';
import '../widget_test_utils.dart';

void main() {
  group('Basic Goldens', () {
    testGoldens('Favorites screen Empty - Mobile', (tester) async {
      await tester.pumpWidgetBuilder(
        loadScreen(const FavoritesPage()),
        surfaceSize: TestDefaults.surfaceSize,
      );

      await screenMatchesGolden(
          tester, 'favorites/favorites-screen-empty-mobile');
    });

    testGoldens('Favorites screen not Empty - Mobile', (tester) async {
      await tester.pumpWidgetBuilder(
        loadScreen(const FavoritesPage()),
        surfaceSize: TestDefaults.surfaceSize,
      );
      final BuildContext context = tester.element(find.byType(ListView));
      var favoritesList = Provider.of<Favorites>(context, listen: false);
      favoritesList.add(0);
      favoritesList.add(4);

      await screenMatchesGolden(
          tester, 'favorites/favorites-screen-not-empty-mobile');
    });

    testGoldens('Favorites screen remove favorites - Mobile', (tester) async {
      await tester.pumpWidgetBuilder(
        loadScreen(const FavoritesPage()),
        surfaceSize: TestDefaults.surfaceSize,
      );

      final BuildContext context = tester.element(find.byType(ListView));
      var favoritesList = Provider.of<Favorites>(context, listen: false);
      favoritesList.add(0);
      favoritesList.add(4);

      await screenMatchesGolden(
          tester, 'favorites/01-favorites-screen-remove-mobile');

      await tester.tap(find.byKey(const Key('remove_icon_0')));
      await tester.pumpAndSettle();

      await screenMatchesGolden(
          tester, 'favorites/02-favorites-screen-remove-mobile');
    });
  });
}
