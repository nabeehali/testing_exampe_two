/*
 This is a basic Flutter widget test.

 To perform an interaction with a widget in your test, use the WidgetTester
 utility in the flutter_test package. For example, you can send tap and scroll
 gestures. You can also use WidgetTester to find child widgets in the widget
 tree, read text, and verify that the values of widget properties are correct.
*/

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:testing_example_two/counter.dart';
import 'package:testing_example_two/main.dart';

void main() {
  /// Widget Testing.
  testWidgets('test widget for increment and decrement',
      (WidgetTester tester) async {
    Counter counter = Counter();

    /// Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    /// Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    /// Tap the '+' icon find it by icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    /// Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);

    /// Tap the '-' icon find widget by key and trigger a frame.
    await tester.tap(find.byKey(counter.minusButtonKey));
    await tester.pump();

    /// Verify that our counter has incremented.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);
  });
}
