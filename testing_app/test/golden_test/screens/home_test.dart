import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:testing_app/screens/home.dart';

import '../../utils.dart';
import '../widget_test_utils.dart';

void main() {
  group('Basic Goldens', () {
    testGoldens('Home screen - Mobile', (tester) async {
      await tester.pumpWidgetBuilder(
        loadScreen(const HomePage()),
        surfaceSize: TestDefaults.surfaceSize,
      );
      await screenMatchesGolden(tester, 'home-screen-mobile');
    });
  });
}
