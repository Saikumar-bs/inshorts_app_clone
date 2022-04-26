import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:inshorts_clone/main.dart';
import 'package:image_test_utils/image_test_utils.dart';

void main() {
  //To test the scaffold using a key
  testWidgets('find scaffold using a Key', (WidgetTester tester) async {
    //act
    await tester.pumpWidget(const MaterialApp(key: Key('Scaffold')));

    //assert
    expect(find.byKey(const Key('Scaffold')), findsOneWidget);
  });

//To test the network image
  testWidgets('To test network image', (WidgetTester tester) async {
    //act
    provideMockedNetworkImages() async {
      await tester.pumpWidget(MyApp());

      //verify the finder
      expect(find.byType(Image), findsOneWidget);
    }
  });
}
