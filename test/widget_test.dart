import 'package:NotesNest/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('NotesNest app smoke test', (WidgetTester tester) async {
    // Build the app and trigger a frame
    await tester.pumpWidget(const MyApp());

    // Wait for animations or splash screen to settle (if needed)
    await tester.pumpAndSettle();

    // Check if the SplashScreen or app title is shown
    expect(find.text('NotesNest'), findsOneWidget); // Adjust text as needed

    // Optionally check for the presence of a FAB if it exists on the initial screen
    if (find.byType(FloatingActionButton).evaluate().isNotEmpty) {
      expect(find.byType(FloatingActionButton), findsOneWidget);

      // Simulate tapping the FAB
      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle();

      // Check if "Add Note" screen/dialog appears (update text if needed)
      expect(find.text('Add Note'), findsOneWidget);
    } else {
      print('FloatingActionButton not found on initial screen. Skipping FAB test.');
    }
  });
}
