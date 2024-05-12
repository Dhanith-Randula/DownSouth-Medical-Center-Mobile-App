import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flash_chat/screens/search_map_page.dart'; // Import your CustomerDashboardPage file

void main() {
  testWidgets('CustomerDashboardPage renders', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: CustomerDashboardPage()));
    expect(find.byType(CustomerDashboardPage), findsOneWidget);
  });

  testWidgets('Text input and button test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: CustomerDashboardPage()));

    // Check if text field exists
    expect(find.byType(TextField), findsOneWidget);

    // Enter text into the text field
    await tester.enterText(find.byType(TextField), 'Test Medical Center');

    // Tap the search button
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    // Wait for async operation to complete
    await tester.pump(Duration(seconds: 1));

    // Check if markers are added
    expect(find.byType(Marker), findsWidgets);
  });
}
