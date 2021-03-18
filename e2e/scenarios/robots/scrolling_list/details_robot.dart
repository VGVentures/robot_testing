import 'package:flutter_driver/flutter_driver.dart';

class DetailsRobot {
  const DetailsRobot(this.driver);

  final FlutterDriver driver;

  Future<void> saveItem() async {
    await driver.tap(find.byValueKey('detailsPage_saveIcon'));
    await driver.waitFor(find.byType('AlertDialog'));
    await driver.tap(find.text('OK'));
  }
}
