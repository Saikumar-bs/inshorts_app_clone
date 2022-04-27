// import 'package:flutter_driver/flutter_driver.dart';
// import 'package:flutter_test/flutter_test.dart';

// void main() {
//   group('Flutter Driver demo', () {
//     FlutterDriver driver;

//     setUpAll(() async {
//       driver = await FlutterDriver.connect();
//     });

//     tearDownAll(() async {
//       if (driver != null) {
//         await driver.close();
//       }
//     });

//     test('check flutter driver health', () async {
//       Health health = await driver.checkHealth();
//       print(health.status);
//     });

//     test('test pageview vertical swipe', () async {
//       final SerializableFinder pv = find.byValuekey('pageview');

//       await driver.waitFor(pv);
//       await driver.scroll(pv, 0, -600, Duration(milliseconds: 500));
//       await driver.getText(find.text(
//           'MS Dhoni smashes 16 runs off last 4 balls as CSK defeat MI on last ball'));
//     });
//   });
// }
