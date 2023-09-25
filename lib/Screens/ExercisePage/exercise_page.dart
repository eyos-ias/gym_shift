import 'package:flutter/material.dart';
import 'package:flutter_launcher_icons/xml_templates.dart';

class ExercisesPage extends StatelessWidget {
  const ExercisesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 5,
        centerTitle: true,
        title: const Text(
          "Exercises Page",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Padding(
            padding: EdgeInsets.all(constraints.maxWidth * 0.05),
            child: GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 16 / 19,
              ),
              children: [
                Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    Stack(
                      children: [
                        Image.asset(
                          "assets/images/abs.png",
                          width: double.infinity,
                          height: double.infinity,
                        ),
                      ],
                    ),
                    const Text("Renegade Row")
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
