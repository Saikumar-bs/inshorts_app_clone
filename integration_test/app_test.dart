import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:inshorts_clone/constants.dart';
import 'package:inshorts_clone/main.dart';
import 'package:integration_test/integration_test.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  // testWidgets('PageView control test', (WidgetTester tester) async {
  //   await tester.pumpWidget(PageView(
  //     dragStartBehavior: DragStartBehavior.down,
  //   ));

  //   await tester.tap(find.text(
  //       "As Delhi Sees Over 60% Spike, India's Fresh Covid Tally Zooms to 2,380"));
  //   await tester.drag(find.byType(PageView), const Offset(-200.0, 0.0));
  //   await tester.pump();

  //   expect(
  //       find.text(
  //           'MS Dhoni smashes 16 runs off last 4 balls as CSK defeat MI on last ball'),
  //       findsOneWidget);
  // });

//To check the swipe once and verify the text
  testWidgets(
    "check the swipe",
    (WidgetTester tester) async {
      await tester.pumpWidget(MyApp());
      await Future.delayed(const Duration(seconds: 3));
      await tester.drag(find.byType(PageView), const Offset(0, -660));
      await Future.delayed(const Duration(seconds: 3));
      await tester.pump();

      expect(find.text(kDetails2), findsOneWidget);
    },
  );

// To check the swipe twice and verify the text
  // testWidgets(
  //   "check the swipe for 2 pages",
  //   (WidgetTester tester) async {
  //     await tester.pumpWidget(MyApp());
  //     await Future.delayed(const Duration(seconds: 1));
  //     await tester.drag(find.byType(PageView), const Offset(0, -660));
  //     await Future.delayed(const Duration(seconds: 1));
  //     await tester.drag(find.byType(PageView), const Offset(0, -660));
  //     await Future.delayed(const Duration(seconds: 1));
  //     await tester.drag(find.byType(swipeDirection(details.delta.dx < 0)));
  //     await tester.pump();

  //     expect(find.text, 'Hindustan Times');
  //   },
  // );

  testWidgets("Pan working check", (WidgetTester tester) async {
    String? swipeDirection;

    _launchURL() async {
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

    await tester.pumpWidget(SizedBox.expand(
      child: GestureDetector(
        onPanUpdate: (
          DragUpdateDetails details,
        ) {
          updatePosition(details);
        },
        child: Container(),
      ),
    ));
    await tester.pump();

    expect(swipeDirection, isNull);

    // await tester.dragFrom(const Offset(250, 350), const Offset(850, 350));
    await tester.drag(find.byType(GestureDetector), const Offset(440, 0),
        warnIfMissed: false);
    await Future.delayed(const Duration(seconds: 6));

    // expect(swipeDirection, 'left');
  });

  testWidgets(
    "Pan swipe check",
    (WidgetTester tester) async {
      Offset? panDelta;
      String? swipe;
      await tester.pumpWidget(GestureDetector(
        onPanUpdate: (DragUpdateDetails details) {
          panDelta = details.delta;
          swipe = panDelta
              .toString(); // Neglect this (Trying to make a method for function)

          print('Swiped to left');
        },
      ));
      expect(panDelta, isNull);
      // await tester.dragFrom(const Offset(200, 0.0), const Offset(440.0, 0.0));
      await tester.pumpWidget(MyApp());
      await Future.delayed(const Duration(seconds: 3));
      await tester.drag(find.byType(PageView), const Offset(0, -660));
      await Future.delayed(const Duration(seconds: 3));
      await tester.drag(find.byType(GestureDetector), const Offset(440, 0));
      await Future.delayed(const Duration(seconds: 6));
      expect(panDelta!.dx, 420.00000000000006);
    },
  );
}
