import 'package:flutter_driver/flutter_driver.dart';

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
}
