import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Counter App', () {
    final buttonFinder = find.byValueKey('increment');
    final counterTextFinder = find.byValueKey('counter');
    FlutterDriver? driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });
    tearDownAll(() async => driver!.close());

    test('increments the counter', () async {
      await driver!.tap(buttonFinder, timeout: const Duration(seconds: 10));
      expect(await driver!.getText(counterTextFinder), "1");
    });
  });
}
