import 'package:flutter/material.dart';
import 'package:gym_shift/Screens/ProfileSetup/components/chip_input_textfield.dart';
import 'package:gym_shift/Screens/common/components/button.dart';
import 'package:gym_shift/core/constants/colors.dart';

class AllergiesPage extends StatelessWidget {
  AllergiesPage({super.key});
  final recommendations_list = [
    "Egg",
    "Milk",
    "Peanuts",
    "Tree Nuts",
    "Fish",
    "Shellfish",
    "Wheat",
    "Soy"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Allergies Food",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Center(child: Text("Add your allergies food")),
          ChipInputTextField(),
          const SizedBox(height: 30),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text("Recommended for you"),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  //height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: kTextColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: const Wrap(
                    spacing: 8.0,
                    runSpacing: 4.0,
                    children: [
                      Chip(
                        label: const Text("Egg"),
                        backgroundColor: Colors.white,
                      ),
                      Chip(
                        label: const Text("Milk"),
                        backgroundColor: Colors.white,
                      ),
                      Chip(
                        label: const Text("Peanuts"),
                        backgroundColor: Colors.white,
                      ),
                      Chip(
                        label: const Text("Tree Nuts"),
                        backgroundColor: Colors.white,
                      ),
                      Chip(
                        label: const Text("Fish"),
                        backgroundColor: Colors.white,
                      ),
                      Chip(
                        label: const Text("Shellfish"),
                        backgroundColor: Colors.white,
                      ),
                      Chip(
                        label: const Text("Wheat"),
                        backgroundColor: Colors.white,
                      ),
                      Chip(
                        label: const Text("Soy"),
                        backgroundColor: Colors.white,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          MyButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, '/homepage');
              },
              text: "Next")
        ],
      ),
    );
  }
}
