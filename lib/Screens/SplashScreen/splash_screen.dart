import 'package:flutter/material.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import '../HomePage/home_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      loadingText: const Text('v1'),
      logoWidth: 140,
      logo: Image.asset(
        "assets/images/Logo.png",
        width: 400,
        height: 400,
      ),
      navigator: HomePage(),
      backgroundColor: const Color.fromRGBO(56, 56, 56, 1),
      durationInSeconds: 10,
    );
  }
}
