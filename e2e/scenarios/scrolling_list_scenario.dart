import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

import 'robots/robots.dart';

void main() {
  FlutterDriver driver;
  HomeRobot homeRobot;
  ScrollingListRobot scrollingListRobot;
  DetailsRobot detailsRobot;

  setUpAll(() async {
    driver = await FlutterDriver.connect();
    homeRobot = HomeRobot(driver);
    scrollingListRobot = ScrollingListRobot(driver);
    detailsRobot = DetailsRobot(driver);
  });

  tearDownAll(() async {
    await driver.close();
  });

  group('Scrolling List', () {
    test(
        'can scroll to the desire item, open details '
        'and save the selected icon', () async {
      await homeRobot.navigateToScrollingListPage();
      await scrollingListRobot.scrollToItem('Zoom Out');
      await scrollingListRobot.tapOnItem('Zoom Out');
      await detailsRobot.saveItem();
      await homeRobot.assertUserIsOnTheHomeScreen();
    });
  });
}
