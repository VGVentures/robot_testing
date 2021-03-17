import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

import 'robots/robots.dart';

void main() {
  FlutterDriver driver;
  LoginRobot loginRobot;
  HomeRobot homeRobot;

  setUpAll(() async {
    driver = await FlutterDriver.connect();
    loginRobot = LoginRobot(driver);
    homeRobot = HomeRobot(driver);
  });

  tearDownAll(() async {
    await driver.close();
  });

  group('Login', () {
    test('shows error message when login information is missing', () async {
      await homeRobot.navigateToLoginPage();
      await loginRobot.enterEmail('notvalid');
      await loginRobot.tapLoginButton();
      await loginRobot.checkInvalidCredentialsMessageIsShown();
    });

    test('authenticates a user with an email and password', () async {
      await loginRobot.enterEmail('email@email.com');
      await loginRobot.enterPassword('s3cr3etP4ssw0rd');
      await loginRobot.tapLoginButton();
      await loginRobot.checkWelcomeMessageIsShown('email@email.com');
    });
  });
}
