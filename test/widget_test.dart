import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:inshorts_clone/main.dart';
import 'package:network_image_mock/network_image_mock.dart';

Widget makeTestableWidget() => MaterialApp(
    home: Image.network(
        'https://media.npr.org/assets/img/2020/04/28/gettyimages-1205434458_custom-c47a8defd1fa1c6c825b88646de9f1873aff8d0a.jpg'));

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
}
