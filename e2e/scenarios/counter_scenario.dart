import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

import 'robots/robots.dart';

void main() {
  FlutterDriver driver;
  CounterRobot counterRobot;
  HomeRobot homeRobot;

  setUpAll(() async {
    driver = await FlutterDriver.connect();
    counterRobot = CounterRobot(driver);
    homeRobot = HomeRobot(driver);
  });

  tearDownAll(() async {
    await driver.close();
  });

  group('Counter', () {
    test('increments the counter', () async {
      await homeRobot.navigateToCounterPage();
      expect(await driver.getText(find.text('0')), '0');
      await driver.tap(find.byTooltip('Increment'));
      await driver.tap(find.byTooltip('Increment'));
      await driver.tap(find.byTooltip('Increment'));
      await driver.tap(find.byTooltip('Increment'));
      expect(await driver.getText(find.text('4')), '4');
    });
  });
}
