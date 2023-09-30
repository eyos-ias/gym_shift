import 'package:flutter/material.dart';
import 'package:gym_shift/Screens/ExercisePage/components/exercise_demo.dart';
import 'package:gym_shift/Screens/ExercisePage/exercise_page.dart';
import 'package:gym_shift/Screens/HomePage/home_page.dart';
import 'package:gym_shift/Screens/LocalGyms/components/gym_details.dart';
import 'package:gym_shift/Screens/LocalGyms/components/reviews_page.dart';
import 'package:gym_shift/Screens/LocalGyms/local_gyms.dart';
import 'package:gym_shift/Screens/Notifications/notifications_page.dart';

import 'package:gym_shift/Screens/Onboarding/onboarding_screen.dart';
import 'package:gym_shift/Screens/ProfileSetup/allergies_page.dart';
import 'package:gym_shift/Screens/ProfileSetup/bmi_page.dart';
import 'package:gym_shift/Screens/ProfileSetup/profile_photo_page.dart';
import 'package:gym_shift/Screens/ProfileSetup/workout_goal.dart';
import 'package:gym_shift/Screens/RegistrationPage/forgot_password.dart';
import 'package:gym_shift/Screens/RegistrationPage/login_page.dart';
import 'package:gym_shift/Screens/RegistrationPage/otp_screen.dart';
import 'package:gym_shift/Screens/RegistrationPage/registration_screen.dart';
import 'package:gym_shift/Screens/RegistrationPage/signup_page.dart';
import 'package:gym_shift/Screens/SplashScreen/splash_screen.dart';

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
        //'/workout_plans':(context)=> const WorkoutPage(),
        '/local_gyms': (context) => const LocalGymsPage(),
        //'./subscription':(context)=> const SubscriptionPage(),
        //'./challenges':(context)=> const Challenges(),

        '/notifications': (context) => const NotificationsPage(),

        // '/login': (context) => const LoginPage(),
        // '/forgot': (context) => const ForgotPasswordPage(),
        // '/signup': (context) => const SignUpPage(),
        // '/otp': (context) => const OtpScreen(),
        // '/bmi': (context) => const BmiPage(),
        // '/allergy': (context) => AllergiesPage(),
        // '/profile': (context) => const ProfilePicturePage(),
        // '/goals': (context) => const GoalsPage(),
      },
    );
    // return MaterialApp(
    //   title: 'GymShift demo',
    //   home: LocalGymsPage(),
    // );
  }
}
