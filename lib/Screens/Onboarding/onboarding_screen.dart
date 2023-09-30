import 'package:flutter/material.dart';
import 'package:gym_shift/Screens/RegistrationPage/registration_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../core/constants/colors.dart';
import 'onboarding_page.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final pageController = PageController();
  bool isLastPage = false;

  @override
  void dispose() {
    pageController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(builder: (context, constraints) {
          return Container(
            padding: const EdgeInsets.only(bottom: 80),
            child: PageView(
              onPageChanged: (index) {
                setState(() {
                  isLastPage = index == 2;
                });
              },
              controller: pageController,
              children: [
                OnboardingPage(
                  constraints: constraints,
                  imageUrl: "assets/vectors/onboarding1.svg",
                  title: "Workout Anywhere",
                  description:
                      "You have the flexibility to engage in your workout either within the comfort of your home, outdoors, or at the gym, all without requiring any equipment.",
                ),
                OnboardingPage(
                  constraints: constraints,
                  imageUrl: "assets/vectors/onboarding2.svg",
                  title: "Meal Plans",
                  description:
                      "We provide personalized meal plans meticulously crafted to align seamlessly with your unique fitness aspirations and cater to your individual dietary preferences and needs.",
                ),
                OnboardingPage(
                  constraints: constraints,
                  imageUrl: "assets/vectors/onboarding3.svg",
                  title: "Stay Strong & Healthy",
                  description:
                      "Our goal is your full program enjoyment, paired with enduring health and positivity. We're committed to supporting you as you embrace the program fostering both physical well-being and an optimistic mindset.",
                ),
              ],
            ),
          );
        }),
      ),
      bottomSheet: Container(
        color: kBackgroundColor,
        height: 80,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {
                pageController.previousPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.ease,
                );
              },
              child:
                  const Text("Previous", style: TextStyle(color: kTextColor)),
            ),
            Center(
              child: SmoothPageIndicator(
                onDotClicked: (index) => pageController.animateToPage(index,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeIn),
                effect: const JumpingDotEffect(
                  verticalOffset: 10.0,
                  dotColor: kTextColor,
                  activeDotColor: kPrimaryColor,
                ),
                controller: pageController,
                count: 3,
              ),
            ),
            //get started button

            isLastPage
                ? TextButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(kPrimaryColor)),
                    onPressed: () {
                      //Navigator.pop(context);
                      Navigator.popAndPushNamed(context, '/registration');
                    },
                    child: const Text(
                      'Get Started',
                      style: TextStyle(color: kBackgroundColor),
                    ),
                  )
                : TextButton(
                    onPressed: () {
                      pageController.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.ease,
                      );
                      print("page: ${pageController.page}}");
                    },
                    child: const Text(
                      "Next",
                      style: TextStyle(color: kPrimaryColor),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
