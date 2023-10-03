import 'package:flutter/material.dart';
import 'package:gym_shift/Screens/ProfileSetup/workout_goal.dart';
import 'package:gym_shift/Screens/common/components/button.dart';
import 'package:gym_shift/Screens/common/components/text_field.dart';
import 'package:gym_shift/core/constants/colors.dart';

class BmiPage extends StatelessWidget {
  const BmiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text('Incorporate Your BMI',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28)),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 20),
                child: Text(
                  "Key Insights into Your Health and Weight Ratio.",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w100,
                      color: kTextColor),
                ),
              ),
              const SizedBox(height: 10),
              MyTextField(
                hintText: "Enter BMI",
                numOnly: true,
              ),
              const SizedBox(height: 20),
              const Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 80.0, right: 10),
                      child: Divider(
                        thickness: 2,
                      ),
                    ),
                  ),
                  Text("or"),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 10.0, right: 80),
                      child: Divider(
                        thickness: 2,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              MyTextField(
                hintText: "Enter Height (cm)",
                numOnly: true,
                maxLength: 3,
              ),
              const SizedBox(height: 20),
              MyTextField(
                hintText: "Enter Weight (kg)",
                maxLength: 3,
                numOnly: true,
              ),
              const SizedBox(height: 20),
              MyTextField(
                hintText: "Enter Your Age.",
                numOnly: true,
                maxLength: 2,
              ),
              const SizedBox(height: 20),
              MyButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return GoalsPage();
                    }));
                  },
                  text: "Next")
            ],
          ),
        ),
      ),
    );
  }
}
