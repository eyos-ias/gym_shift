import 'package:flutter/material.dart';
import 'package:gym_shift/screens/AuthPage/sign_up/signup_page.dart';
import 'package:gym_shift/Core/constants/colors.dart';
import 'login/login_page.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 80.0),
              child: Text(
                "Welcome to GymShift, your fitness journey begins here!",
                style: TextStyle(color: kTextColor, fontSize: 18),
              ),
            ),
            Image.asset(
              "assets/images/Logo.png",
              width: 250,
              height: 250,
            ),
            const Text(
              "Always ready \n Anywhere",
              style: TextStyle(color: kTextColor),
            ),
            const SizedBox(
              height: 80,
            ),
            Row(
              children: [
                const SizedBox(width: 30),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpPage()));
                    },
                    style: ElevatedButton.styleFrom(
                      primary: kPrimaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: const Text("Sign Up"),
                  ),
                ),
                const SizedBox(width: 30),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginPage(),
                          ));
                    },
                    style: ElevatedButton.styleFrom(
                      primary: kPrimaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: const Text("Sign In"),
                  ),
                ),
                const SizedBox(width: 30),
              ],
            )
          ],
        ),
      ),
    );
  }
}
