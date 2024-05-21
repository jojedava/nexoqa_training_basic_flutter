import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:provider/provider.dart';
import 'package:testing_app/models/favorites.dart';
import 'package:testing_app/screens/favorites.dart';
import 'package:testing_app/screens/home.dart';

import '../../utils.dart';
import '../widget_test_utils.dart';

void main() {
  group('Basic Goldens', () {
    testGoldens('Favorites screen - Mobile', (tester) async {
      await tester.pumpWidgetBuilder(
        loadScreen(const FavoritesPage()),
        surfaceSize: TestDefaults.surfaceSize,
      );
      final BuildContext context = tester.element(find.byType(ListView));

      var favoritesList = Provider.of<Favorites>(context, listen: false);
      favoritesList.add(0);

      await screenMatchesGolden(tester, 'favorites-screen-mobile');
    });
  });
}
