import 'package:flutter/material.dart';

class LocalGymsPage extends StatelessWidget {
  const LocalGymsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Local Gyms",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
