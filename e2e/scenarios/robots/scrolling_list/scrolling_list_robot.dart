import 'package:flutter_driver/flutter_driver.dart';

class ScrollingListRobot {
  const ScrollingListRobot(this.driver);

  final FlutterDriver driver;

  Future<void> scrollToItem(String itemName) async {
    await driver.waitFor(find.byType('ListView'));
    await driver.scrollUntilVisible(
      find.byValueKey('scrollingListPage_listView'),
      find.text(itemName),
      dyScroll: -200.0,
    );
  }

  Future<void> tapOnItem(String itemName) async {
    await driver.tap(find.text(itemName));
  }
}
