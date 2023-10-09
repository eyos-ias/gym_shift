import 'package:flutter/material.dart';
import 'package:gym_shift/core/common/page_not_found.dart';
import 'package:gym_shift/screens/ChallengesPage/challenges_page.dart';
import 'package:gym_shift/screens/HomePage/home_page.dart';
import 'package:gym_shift/screens/LocalGyms/local_gyms.dart';
import 'package:gym_shift/screens/MealPlans/meal_plans.dart';
import 'package:gym_shift/screens/Notifications/notifications_page.dart';
import 'package:gym_shift/screens/Onboarding/onboarding_screen.dart';
import 'package:gym_shift/screens/ProfilePage/profile_page.dart';
import 'package:gym_shift/screens/ProfileSetup/profile_photo_page.dart';
import 'package:gym_shift/screens/Auth/registration_screen.dart';
import 'package:gym_shift/screens/Settings/settings.dart';
import 'package:gym_shift/screens/SubscriptionPage/subscription_page.dart';
import 'package:gym_shift/screens/WorkoutPlans/workout_plans.dart';

Map<String, Widget Function(BuildContext)> appRoutes = {
  '/': (context) => const OnboardingScreen(),
  '/onboarding': (context) => const OnboardingScreen(),
  '/registration': (context) => const RegistrationPage(),
  '/profile_setup': (context) => const ProfilePicturePage(),
  '/homepage': (context) => const HomePage(),
  '/local_gyms': (context) => const LocalGymsPage(),
  '/notifications': (context) => const NotificationsPage(),
  '/workout_plans': (context) => const WorkoutPlans(),
  '/meal_plans': (context) => const MealPlansPage(),
  '/local_gym': (context) => const LocalGymsPage(),
  '/profile': (context) => ProfilePage(),
  '/settings': (context) => const SettingsPage(),
  '/subscription': (context) => const SubscriptionPage(),
  '/challenges': (context) => const ChallengesPage()
};

Route<dynamic> generateRoutes(RouteSettings settings) {
  final WidgetBuilder? builder = appRoutes[settings.name];

  if (builder != null) {
    return MaterialPageRoute(
      builder: builder,
      settings: settings,
    );
  }

  return MaterialPageRoute(
    builder: (context) => PageNotFound(),
    settings: settings,
  );
}
