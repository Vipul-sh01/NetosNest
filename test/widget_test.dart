import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:NotesNest/Views/SplashScreen.dart';
import 'package:NotesNest/Views/Onboarding/OnboardingScreen.dart';
import 'package:NotesNest/main.dart' as app;

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('App starts and shows SplashScreen', (WidgetTester tester) async {
    await tester.pumpWidget(const app.MyApp());

    // Wait for timer to complete (simulate 3 seconds)
    await tester.pump(const Duration(seconds: 3));
    await tester.pumpAndSettle();

    expect(find.byType(SplashScreen), findsOneWidget);
  });

  testWidgets('Navigates to OnboardingScreen', (WidgetTester tester) async {
    await tester.pumpWidget(
      GetMaterialApp(
        initialRoute: '/',
        getPages: [
          GetPage(name: '/', page: () => SplashScreen()),
          GetPage(name: '/onboardingScreen', page: () => OnboardingScreen()),
        ],
      ),
    );

    // Simulate timer delay if SplashScreen uses one
    await tester.pump(const Duration(seconds: 3));
    Get.toNamed('/onboardingScreen');
    await tester.pumpAndSettle();

    expect(find.byType(OnboardingScreen), findsOneWidget);
  });
}
