import 'package:flutter/material.dart';
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
        surfaceSize: CustomDevices.iPhone11.size,
      );
      await screenMatchesGolden(tester, 'home/home-screen-mobile');
    });

    testGoldens('Home screen - testing scrolling - Mobile', (tester) async {
      await tester.pumpWidgetBuilder(
        loadScreen(const HomePage()),
        surfaceSize: CustomDevices.iPhone11.size,
      );
      await screenMatchesGolden(
          tester, 'home/scroll/01-home-screen-scroll-mobile');
      await tester.fling(
        find.byType(ListView),
        const Offset(0, -100),
        1000,
      );
      await tester.pumpAndSettle();
      await screenMatchesGolden(
          tester, 'home/scroll/02-home-screen-scroll-mobile');
      expect(find.text('Item 0'), findsNothing);
    });

    testGoldens('After tapping the favorite icon changes - Mobile',
        (tester) async {
      await tester.pumpWidgetBuilder(
        loadScreen(const HomePage()),
        surfaceSize: CustomDevices.iPhone11.size,
      );
      await screenMatchesGolden(
          tester, 'home/tap-favorites/01-home-screen-tap-favorites-mobile');
      await tester.tap(find.byKey(const Key('icon_0')));
      await tester.pumpAndSettle();

      await screenMatchesGolden(
          tester, 'home/tap-favorites/02-home-screen-tap-favorites-mobile');

      await tester.tap(find.byKey(const Key('icon_1')));
      await tester.pumpAndSettle();
      await screenMatchesGolden(
          tester, 'home/tap-favorites/03-home-screen-tap-favorites-mobile');
    });

    testGoldens('Home Multidevices - Mobile', (tester) async {
      final deviceBuilder = DeviceBuilder()
        ..overrideDevicesForAllScenarios(devices: [
          CustomDevices.googlePixel4,
          CustomDevices.iPhone11,
          CustomDevices.iPhoneSE,
        ])
        ..addScenario(
          widget: loadScreen(const HomePage()),
          name: "Home Screen",
        )
        ..addScenario(
          widget: loadScreen(const HomePage()),
          name: "Tap favorite",
          onCreate: (scenarioWidgetKey) async {
            var finder = find.descendant(
              of: find.byKey(scenarioWidgetKey),
              matching: find.byKey(const Key('icon_0')),
            );
            await tester.tap(finder);
            await tester.pumpAndSettle();
            finder = find.descendant(
              of: find.byKey(scenarioWidgetKey),
              matching: find.byKey(const Key('icon_4')),
            );
            await tester.tap(finder);
            await tester.pumpAndSettle();
          },
        );

      await tester.pumpDeviceBuilder(deviceBuilder);
      await screenMatchesGolden(
          tester, 'home/multidevices/home-multiscreens-mobile');
    });
  });
}
