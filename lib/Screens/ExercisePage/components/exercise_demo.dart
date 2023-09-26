import 'package:flutter/material.dart';

class ExerciseDemo extends StatelessWidget {
  const ExerciseDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 5,
        centerTitle: true,
        title: const Text(
          "Exercises Page",
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
