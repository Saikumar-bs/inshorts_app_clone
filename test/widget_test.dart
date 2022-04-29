import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:inshorts_clone/main.dart';
import 'package:inshorts_clone/newsCard.dart';
import 'package:inshorts_clone/news_screen.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:inshorts_clone/constants.dart';

Widget makeTestableWidget() => MaterialApp(
    home: Image.network(
        'https://www.cityam.com/wp-content/uploads/2022/02/GettyImages-1233945081-1.jpg'));

void main() {
  //To test the scaffold using a key
  testWidgets('finds scaffold using a Key', (WidgetTester tester) async {
    const testKey = Key('Scaffold');

    await tester.pumpWidget(const MaterialApp(key: testKey, home: Scaffold()));

    expect(find.byKey(testKey), findsOneWidget);
  });

//To check the network image using mock
  testWidgets(
    'should properly mock Image.network and not crash',
    (WidgetTester tester) async {
      mockNetworkImagesFor(() => tester.pumpWidget(makeTestableWidget()));
    },
  );

// To check whether the news card has a headline and info
  testWidgets('test headline and info', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    final headingsFinder = find.text(kHeading1);

    final infoFinder = find.text(kDetails1);

    expect(headingsFinder, findsOneWidget);

    expect(infoFinder, findsOneWidget);
  });

//To check the text color, font size and font weight of the heading
  testWidgets('To test color, fontSize and fontWeight of text heading',
      (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    final text = tester.widget<Text>(find.text(kHeading1));

    expect(text.style?.color, Colors.black);
    expect(text.style?.fontSize, 25.0);
    expect(text.style?.fontWeight, FontWeight.bold);
  });

//To check the text color, font size and font weight of the info
  testWidgets('To test color and fontSize of text info',
      (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    final text = tester.widget<Text>(find.text(kDetails1));

    expect(text.style?.color, Colors.black);
    expect(text.style?.fontSize, 18.0);
  });

//To check padding instance of the heading
  testWidgets('find padding instances', (WidgetTester tester) async {
    const childWidget = Padding(padding: EdgeInsets.all(16.0));

    await tester.pumpWidget(Container(child: childWidget));

    expect(find.byWidget(childWidget), findsOneWidget);
  });

// //To test the asset image
//   test('AssetImage from package', () {
//     const AssetImage image = AssetImage(
//       'assets/images/News1.jpg',
//       package: 'test_package',
//     );
//     expect(image.keyName, 'packages/test_package/assets/images/News1.jpg');
//   });

  // //To test the asset image
  // testWidgets('AssetImage from package', (WidgetTester tester) async {
  //   const childWidget = AssetImage('assets/images/News1.jpg');
  //   await tester.pumpWidget(Container(child: childWidget));
  //   expect(find.byType(childWidget), findsOneWidget);
  // });

  // testWidgets(
  //   "Checking the image",
  //   (WidgetTester tester) async {
  //     await tester.pumpWidget(MaterialApp(home: Image.asset()));
  //     expect(find.image(const AssetImage('assets/images/News1.jpg')),
  //         findsNWidgets(1));
  //   },
  // );
}
