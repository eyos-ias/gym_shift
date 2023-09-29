import 'package:flutter/material.dart';

class GymDetails extends StatelessWidget {
  const GymDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: LayoutBuilder(builder: (context, constraints) {
            return Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset("assets/images/gym_details.png"),
                  Card(
                    elevation: 5,
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(10.0),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Strong Bodies Fitness Center",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
