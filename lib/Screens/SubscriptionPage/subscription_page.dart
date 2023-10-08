import 'package:flutter/material.dart';
import 'package:gym_shift/screens/common/components/button.dart';

class SubscriptionPage extends StatelessWidget {
  const SubscriptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 5,
        centerTitle: true,
        title: const Text(
          "Subscription Plan",
          textAlign: TextAlign.justify,
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Padding(
            padding: EdgeInsets.symmetric(
                horizontal: constraints.maxWidth * (20 / 360),
                vertical: constraints.maxHeight * 0.01),
            child: ListView(
              children: [
                Text(
                  "Access exclusive personalized workouts and advanced features by subscribing to“GymShift”.",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 21 * MediaQuery.of(context).textScaleFactor),
                ),
                SizedBox(
                  height: constraints.maxHeight * 0.02,
                ),
                Image.asset("assets/images/subscription.png"),
                SizedBox(
                  height: constraints.maxHeight * 0.02,
                ),
                MyButton(onPressed: () {}, text: "Subscribe Now")
              ],
            ),
          );
        },
      ),
    );
  }
}
