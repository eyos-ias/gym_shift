import 'package:flutter/material.dart';
import 'package:gym_shift/Screens/ProfileSetup/components/chip_input_textfield.dart';

class AllergiesPage extends StatelessWidget {
  const AllergiesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(child: Text("Allergies Page")),
            ChipInputTextField(),
          ],
        ),
      ),
    );
  }
}
