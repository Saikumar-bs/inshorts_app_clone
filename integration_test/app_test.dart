import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:inshorts_clone/main.dart';
import 'package:integration_test/integration_test.dart';

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

      final myheading = find.text(
          "MS Dhoni smashes 16 runs off last 4 balls as CSK defeat MI on last ball");

      expect(myheading, findsOneWidget);
    },
  );

//To check the swipe twice and verify the text
  testWidgets(
    "check the swipe for 2 pages",
    (WidgetTester tester) async {
      await tester.pumpWidget(MyApp());
      await Future.delayed(const Duration(seconds: 1));
      await tester.drag(find.byType(PageView), const Offset(0, -660));
      await Future.delayed(const Duration(seconds: 1));
      await tester.drag(find.byType(PageView), const Offset(0, -660));
      await Future.delayed(const Duration(seconds: 1));
      await tester.pump();

      final myheading = find.text(
          "PM releases commemorative coin, postage stamp on 400th Parkash Purab");

      expect(myheading, findsOneWidget);
    },
  );

  // testWidgets(
  //   "App Testing by calling function",
  //   (WidgetTester tester) async {
  //     //Arrange
  //     await tester.pumpAndSettle();
  //     Widget testWidget() => MaterialApp(
  //           home: Scaffold(
  //             body: SafeArea(
  //               child: Container(
  //                 width: 200.0,
  //                 height: 200.0,
  //                 decoration: const BoxDecoration(
  //                   image: DecorationImage(
  //                     image: kImage1,
  //                   ),
  //                 ),
  //               ),
  //             ),
  //           ),
  //         );
  //     final expectedWidget = find.text("President");

  //     // Act
  //     await Future.delayed(const Duration(seconds: 3));
  //     await tester.drag(find.byType(PageView), const Offset(0, -750));
  //     await tester.pumpAndSettle();
  //     await Future.delayed(const Duration(seconds: 3));

  //     // //Assert
  // expect(find.byKey(Pv), findsOneWidget);
  // await Future.delayed(const Duration(seconds: 3));
  // await tester.dragUntilVisible(
  //   expectedWidget, // what you want to find
  //   find.byType(PageView), // widget you want to scroll
  //   const Offset(0, -100), // delta to move
  // );
  // await Future.delayed(const Duration(seconds: 5));
  //   },
  // );
}
