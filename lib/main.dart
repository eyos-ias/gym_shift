import 'package:flutter/material.dart';

import 'package:gym_shift/Screens/Onboarding/onboarding_screen.dart';
import 'package:gym_shift/Screens/ProfileSetup/bmi_page.dart';
import 'package:gym_shift/Screens/RegistrationPage/login_page.dart';
import 'package:gym_shift/Screens/RegistrationPage/otp_screen.dart';
import 'package:gym_shift/Screens/RegistrationPage/signup_page.dart';
import 'package:gym_shift/Screens/SplashScreen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: OnboardingScreen(),
    );
  }
}
