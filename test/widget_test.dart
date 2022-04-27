import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:inshorts_clone/main.dart';
import 'package:network_image_mock/network_image_mock.dart';

Widget makeTestableWidget() => MaterialApp(
    home: Image.network(
        'https://www.cityam.com/wp-content/uploads/2022/02/GettyImages-1233945081-1.jpg'));

void main() {
  //To test the scaffold using a key
  testWidgets('finds a widget using a Key', (WidgetTester tester) async {
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

    final headingsFinder = find.text(
        "As Delhi Sees Over 60% Spike, India's Fresh Covid Tally Zooms to 2,380");

    final infoFinder = find.text(
        "Delhi logged 1,009 fresh Covid cases on Wednesday, a 60 per cent jump from a day ago, with the city government making the wearing of masks in public places mandatory again and announcing a Rs 500 fine on violators. This was the maximum number of cases recorded in Delhi since February 10 when 1,104 infections were reported.");

    expect(headingsFinder, findsOneWidget);

    expect(infoFinder, findsOneWidget);
  });

//To check the text color and font size of the heading
  testWidgets('To test color and fontSize of text',
      (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    final text = tester.widget<Text>(find.text(
        "As Delhi Sees Over 60% Spike, India's Fresh Covid Tally Zooms to 2,380"));

    expect(text.style?.color, Colors.black);
    expect(text.style?.fontSize, 25.0);
  });

//To check padding instances
  testWidgets('find padding instances', (WidgetTester tester) async {
    const childWidget = Padding(padding: EdgeInsets.all(16.0));

    // Provide the childWidget to the Container.
    await tester.pumpWidget(Container(child: childWidget));

    // Search for the childWidget in the tree and verify it exists.
    expect(find.byWidget(childWidget), findsOneWidget);
  });
}
