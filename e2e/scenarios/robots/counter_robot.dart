import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

class CounterRobot {
  const CounterRobot(this.driver);

  final FlutterDriver driver;

  Future<void> increment() async {
    await driver.tap(find.byTooltip('Increment'));
  }

  Future<void> validateCounter(int counterValue) async {
    expect(await driver.getText(find.text('$counterValue')), '$counterValue');
  }
}
