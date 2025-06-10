import 'package:flutter/material.dart';
import '../pages/home_page.dart';
import '../pages/onboarding_page.dart';
import '../pages/login_page.dart';
import '../pages/signup_page.dart';
import '../pages/subscription_page.dart';
import '../pages/notification_page.dart';
import '../pages/profile_page.dart';

class AppRoutes {
  static const String splash = '/';
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String home = '/';
  static const String subscription = '/subscription';
  static const String notification = '/notification';
  static const String profile = '/profile';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      onboarding: (context) => const OnboardingPage(),
      login: (context) => const LoginPage(),
      signup: (context) => const SignupPage(),
      home: (context) => const HomePage(),
      subscription: (context) => const SubscriptionPage(),
      notification: (context) => const NotificationPage(),
      profile: (context) => const ProfilePage(),
    };
  }

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case onboarding:
        return MaterialPageRoute(builder: (context) => const OnboardingPage());
      case login:
        return MaterialPageRoute(builder: (context) => const LoginPage());
      case signup:
        return MaterialPageRoute(builder: (context) => const SignupPage());
      case home:
        return MaterialPageRoute(
          builder: (context) => const HomePage(),
        );
      case subscription:
        return MaterialPageRoute(
          builder: (context) => const SubscriptionPage(),
        );
      case notification:
        return MaterialPageRoute(builder: (_) => const NotificationPage());
      case profile:
        return MaterialPageRoute(builder: (_) => const ProfilePage());
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(child: Text('Route non trouvée')),
          ),
        );
    }
  }
}
