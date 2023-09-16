import 'package:flutter/material.dart';
import 'package:gym_shift/core/constants/colors.dart';

class BmiPage extends StatelessWidget {
  const BmiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kBackgroundColor,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text('Incorporate Your BMI',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 50.0),
                child: Text(
                  "Key Insights into Your Health and Weight Ratio.",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w100),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
