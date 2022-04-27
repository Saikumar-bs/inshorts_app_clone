import 'package:flutter_driver/flutter_driver.dart'; 
import 'package:flutter_test/flutter_test.dart';


//to test the vertical swipe of the app

test('test pageview vertical swipe', () async {
  final SerializableFinder pv = find.byValuekey ('pageview');

  await driver.waitFor(pv);
  await driver.scroll(pv, 0, -600, Duration(milliseconds: 500));
  await driver.getText(find.text('Second'));
});
