import 'package:get/get.dart';
import '../Views/Authentication/LoginScreen.dart';
import '../Views/FeedScreen.dart';
import '../Views/Onboarding/OnboardingScreen.dart';
import '../Views/SplashScreen.dart';

class AppRoutes {
  static const String splash = '/';
  static const String login = '/login';
  static const String feed = '/feed';
  static const String onboarding = '/onboardingScreen';

  static final routes = [
    GetPage(name: splash, page: () => SplashScreen()),
    GetPage(name: login, page: () => LoginScreen()),
    GetPage(name: feed, page: () => FeedScreen()),
    GetPage(name: onboarding, page: () => OnboardingScreen()),
  ];
}