import 'package:flutter/material.dart';
import 'package:gym_shift/Screens/ChallengesPage/challenges_page.dart';
import 'package:gym_shift/Screens/ExercisePage/components/exercise_demo.dart';
import 'package:gym_shift/Screens/ExercisePage/exercise_page.dart';
import 'package:gym_shift/Screens/HomePage/home_page.dart';
import 'package:gym_shift/Screens/LocalGyms/components/gym_details.dart';
import 'package:gym_shift/Screens/LocalGyms/components/reviews_page.dart';
import 'package:gym_shift/Screens/LocalGyms/local_gyms.dart';
import 'package:gym_shift/Screens/MealPlans/meal_plans.dart';
import 'package:gym_shift/Screens/Notifications/notifications_page.dart';

import 'package:gym_shift/Screens/Onboarding/onboarding_screen.dart';
import 'package:gym_shift/Screens/ProfilePage/profile_page.dart';
import 'package:gym_shift/Screens/ProfileSetup/allergies_page.dart';
import 'package:gym_shift/Screens/ProfileSetup/bmi_page.dart';
import 'package:gym_shift/Screens/ProfileSetup/profile_photo_page.dart';
import 'package:gym_shift/Screens/ProfileSetup/workout_goal.dart';
import 'package:gym_shift/Screens/RegistrationPage/forgot_password.dart';
import 'package:gym_shift/Screens/RegistrationPage/login_page.dart';
import 'package:gym_shift/Screens/RegistrationPage/otp_screen.dart';
import 'package:gym_shift/Screens/RegistrationPage/registration_screen.dart';
import 'package:gym_shift/Screens/RegistrationPage/signup_page.dart';
import 'package:gym_shift/Screens/Settings/settings.dart';
import 'package:gym_shift/Screens/SplashScreen/splash_screen.dart';
import 'package:gym_shift/Screens/SubscriptionPage/subscription_page.dart';
import 'package:gym_shift/Screens/WorkoutPlans/workout_plans.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GymShift demo',
      initialRoute: '/',
      routes: {
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
        '/challenges': (context) => const ChallengesPage(),
      },
    );
  }
}
