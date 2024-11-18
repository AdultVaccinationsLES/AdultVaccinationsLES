import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/main.dart'; // Make sure the path is correct

void main() {
  testWidgets('Home page smoke test', (WidgetTester tester) async {
    // Build the app and trigger a frame.
    await tester.pumpWidget(VaccineApp());

    // Verify that the Home page contains the expected text.
    expect(find.text('Welcome to the Vaccine Info App'), findsOneWidget);
    expect(find.text('General Info'), findsOneWidget);
    expect(find.text('FAQs'), findsOneWidget);
    expect(find.text('Find a Center'), findsOneWidget);
    expect(find.text('About this App'), findsOneWidget);

    // Tap the 'General Info' button and verify the navigation.
    await tester.tap(find.text('General Info'));
    await tester.pumpAndSettle();

    expect(find.text('General Information about Vaccines'), findsOneWidget);

    // Navigate back to the Home page.
    await tester.tap(find.byIcon(Icons.arrow_back));
    await tester.pumpAndSettle();

    // Tap the 'FAQs' button and verify the navigation.
    await tester.tap(find.text('FAQs'));
    await tester.pumpAndSettle();

    expect(find.text('Frequently Asked Questions'), findsOneWidget);

    // Navigate back to the Home page.
    await tester.tap(find.byIcon(Icons.arrow_back));
    await tester.pumpAndSettle();

    // Tap the 'Find a Center' button and verify the navigation.
    await tester.tap(find.text('Find a Center'));
    await tester.pumpAndSettle();

    expect(find.text('Find a Vaccination Center Near You'), findsOneWidget);
  });
}
