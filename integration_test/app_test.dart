import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:inshorts_clone/main.dart' as app;
import 'package:integration_test/integration_test.dart';
import 'package:flutter/gestures.dart' show DragStartBehavior;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('PageView control test', (WidgetTester tester) async {
    await tester.pumpWidget(PageView(
      dragStartBehavior: DragStartBehavior.down,
    ));

    await tester.tap(find.text(
        "As Delhi Sees Over 60% Spike, India's Fresh Covid Tally Zooms to 2,380"));
    await tester.drag(find.byType(PageView), const Offset(-200.0, 0.0));
    await tester.pump();

    expect(
        find.text(
            'MS Dhoni smashes 16 runs off last 4 balls as CSK defeat MI on last ball'),
        findsOneWidget);
  });
}
