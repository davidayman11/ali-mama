import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ali_mama/main.dart';

void main() {
  testWidgets('Ali Mama app loads with splash screen', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(AliMamaApp());

    // Verify that the splash screen is shown
    expect(find.text('Ali Mama'), findsOneWidget);

    // Wait for the duration of the splash screen
    await tester.pumpAndSettle(Duration(seconds: 2));

    // Verify that the onboarding screen is loaded
    expect(find.text('Welcome'), findsOneWidget);
  });
}
