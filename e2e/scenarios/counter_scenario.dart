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
      await counterRobot.validateCounter(0);
      await counterRobot.increment();
      await counterRobot.increment();
      await counterRobot.increment();
      await counterRobot.increment();
      await counterRobot.validateCounter(4);
    });
  });
}
