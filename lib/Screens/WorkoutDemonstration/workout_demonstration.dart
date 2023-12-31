import 'package:flutter/material.dart';

class WorkoutDemonstration extends StatelessWidget {
  const WorkoutDemonstration({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 5,
        centerTitle: true,
        title: const Text(
          "Notifications",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: ListView(
        children: [],
      ),
    );
  }
}
