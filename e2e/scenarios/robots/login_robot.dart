import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

class LoginRobot {
  const LoginRobot(this.driver);

  final FlutterDriver driver;

  Future<void> enterEmail(String email) async {
    await driver.tap(find.byValueKey('emailTextField'));
    await driver.enterText(email);
  }

  Future<void> enterPassword(String password) async {
    await driver.tap(find.byValueKey('passwordTextField'));
    await driver.enterText(password);
  }

  Future<void> tapLoginButton() async {
    await driver.tap(find.text('Login'));
  }

  Future<void> checkInvalidCredentialsMessageIsShown() async {
    final errorMessageFinder = find.text('Invalid Credentials');
    await driver.waitFor(errorMessageFinder);
    expect(await driver.getText(errorMessageFinder), 'Invalid Credentials');
  }

  Future<void> checkWelcomeMessageIsShown(String email) async {
    final welcomeMessageFinder = find.text('Welcome $email');
    await driver.waitFor(welcomeMessageFinder);
    expect(await driver.getText(welcomeMessageFinder), 'Welcome $email');
  }
}
