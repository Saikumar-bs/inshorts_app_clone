import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:inshorts_clone/main.dart';
import 'package:integration_test/integration_test.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

// To check the swipe down twice, swipe up once and then right swipe to open link
  testWidgets("Complete integration test", (WidgetTester tester) async {
    String? swipeDirection;
    Offset? panDelta;

    Future<void> _launchURL() async {
      const url = 'https://www.hindustantimes.com';
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }

    void updatePosition(DragUpdateDetails details) {
      swipeDirection = details.delta.dx < 0 ? 'left' : 'right';
      if (swipeDirection == 'left') {
        _launchURL();
      }
    }

    await tester.pumpWidget(MyApp());
    await Future.delayed(const Duration(seconds: 5));
    await tester.drag(find.byType(PageView), const Offset(0, -660));
    await Future.delayed(const Duration(seconds: 5));
    await tester.drag(find.byType(PageView), const Offset(0, -660));
    await Future.delayed(const Duration(seconds: 5));
    await tester.drag(find.byType(PageView), const Offset(0, 660));
    await Future.delayed(const Duration(seconds: 5));

    await tester.pumpWidget(
      GestureDetector(
        onPanUpdate: (
          DragUpdateDetails details,
        ) {
          updatePosition(details);
        },
      ),
    );
    // await tester.pumpWidget(GestureDetector(
    //   onPanUpdate: (DragUpdateDetails details) {
    //     panDelta = details.delta;
    //     print('Swiped to left');
    //     if (panDelta!.dx == 0) {
    //       print('Swiped to left');
    //     } else {
    //       _launchURL();
    //     }
    //   },
    // ));
    expect(swipeDirection, isNull);

    await tester.pumpAndSettle();

    await tester.drag(find.byType(GestureDetector), const Offset(-440, 0));

    // expect(find.text('Home'), findsOneWidget);
  });
}
