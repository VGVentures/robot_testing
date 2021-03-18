import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

class HomeRobot {
  const HomeRobot(this.driver);

  final FlutterDriver driver;

  Future<void> navigateToCounterPage() async {
    await driver.tap(find.text('Counter'));
    await Future.delayed(const Duration(seconds: 1));
  }

  Future<void> navigateToLoginPage() async {
    await driver.tap(find.text('Login'));
    await Future.delayed(const Duration(seconds: 1));
  }

  Future<void> navigateToScrollingListPage() async {
    await driver.tap(find.text('Scrolling list'));
    await Future.delayed(const Duration(seconds: 1));
  }

  Future<void> assertUserIsOnTheHomeScreen() async {
    expect(await driver.getText(find.text('Counter')), 'Counter');
    expect(await driver.getText(find.text('Login')), 'Login');
    expect(await driver.getText(find.text('Scrolling list')), 'Scrolling list');
  }
}
