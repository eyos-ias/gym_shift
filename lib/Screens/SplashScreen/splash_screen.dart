import 'package:flutter/material.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:gym_shift/Core/constants/colors.dart';

import '../Onboarding/onboarding_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      loadingText: const Text(
        'Version 1',
        style: TextStyle(color: kBackgroundColor),
      ),
      logoWidth: 140,
      logo: Image.asset(
        "assets/images/Logo.png",
        width: 400,
        height: 400,
      ),
      navigator: const OnboardingScreen(),
      backgroundColor: const Color.fromRGBO(56, 56, 56, 1),
      durationInSeconds: 5,
    );
  }
}
