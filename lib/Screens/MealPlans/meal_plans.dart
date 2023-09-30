import 'package:flutter/material.dart';

class MealPlansPage extends StatelessWidget {
  const MealPlansPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 5,
        centerTitle: true,
        title: const Text(
          "Meal Plans",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
        child: const Text("Under re-design"),
      ),
    );
  }
}
