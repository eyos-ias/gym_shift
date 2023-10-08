import 'package:flutter/material.dart';
import 'package:gym_shift/screens/common/components/button.dart';
import 'package:gym_shift/screens/common/components/text_field.dart';

class BmiPage extends StatefulWidget {
  const BmiPage({Key? key}) : super(key: key);

  @override
  _BmiPageState createState() => _BmiPageState();
}

class _BmiPageState extends State<BmiPage> {
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  String bmiResult = '';

  void calculateBMI() {
    if (heightController.text.isNotEmpty && weightController.text.isNotEmpty) {
      double height =
          double.parse(heightController.text) / 100; // Convert cm to meters
      double weight = double.parse(weightController.text);

      double bmi = weight / (height * height);

      setState(() {
        bmiResult =
            "Your BMI: ${bmi.toStringAsFixed(2)}"; // Format BMI to two decimal places
      });
    } else {
      setState(() {
        bmiResult = '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30),
        ),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                'Incorporate Your BMI',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 20),
                child: Text(
                  "Key Insights into Your Health and Weight Ratio.",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w100,
                      color: Colors.black),
                ),
              ),
              const SizedBox(height: 10),
              MyTextField(
                controller: heightController,
                hintText: "Enter Height (cm)",
                numOnly: true,
                maxLength: 3,
                onChanged: (value) {
                  calculateBMI();
                },
              ),
              const SizedBox(height: 20),
              MyTextField(
                controller: weightController,
                hintText: "Enter Weight (kg)",
                numOnly: true,
                maxLength: 3,
                onChanged: (value) {
                  calculateBMI();
                },
              ),
              const SizedBox(height: 20),
              Text(
                bmiResult,
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 20),
              MyButton(
                onPressed: () {
                  // You can navigate to the next screen or perform other actions here
                },
                text: "Next",
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    heightController.dispose();
    weightController.dispose();
    super.dispose();
  }
}
