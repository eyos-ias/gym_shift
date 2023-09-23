import 'package:flutter/material.dart';
import 'package:gym_shift/Screens/HomePage/home_page.dart';

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
    // return MaterialApp(title: 'GymShift demo', initialRoute: '/', routes: {
    //   '/': (context) => const OnboardingScreen(),
    //   '/registration': (context) => const RegistrationPage(),
    //   '/login': (context) => const LoginPage(),
    //   '/forgot': (context) => const ForgotPasswordPage(),
    //   '/signup': (context) => const SignUpPage(),
    //   '/otp': (context) => const OtpScreen(),
    //   '/bmi': (context) => const BmiPage(),
    //   '/allergy': (context) => const AllergiesPage(),
    //   '/profile': (context) => const ProfilePicturePage(),
    //   '/goals': (context) => const GoalsPage(),
    // });
    return MaterialApp(
      title: 'GymShift demo',
      home: HomePage(),
    );
  }
}
