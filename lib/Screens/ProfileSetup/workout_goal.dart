import 'package:flutter/material.dart';
import 'package:gym_shift/Screens/ProfileSetup/components/goal_tiles.dart';
import 'package:gym_shift/Screens/common/components/button.dart';

import '../../core/constants/colors.dart';

class GoalsPage extends StatelessWidget {
  const GoalsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Set Your Workout Goal",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 20),
                child: Text(
                  "Establish your workout objective: Your path to progress begins here.",
                  style: TextStyle(fontSize: 18, color: kTextColor),
                ),
              ),
              Container(
                //padding: const EdgeInsets.all(20),
                height: 400,
                child: GridView.count(
                  padding: const EdgeInsets.all(20),
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  crossAxisCount: 2,
                  childAspectRatio: 1.5,
                  children: [
                    GoalTile(
                      title: "Build Muscle",
                      icon: Icon(Icons.add),
                    ),
                    GoalTile(
                      title: "Lose Fat",
                      icon: Icon(Icons.remove),
                    ),
                    GoalTile(
                      title: "Maintain Weight",
                      icon: Icon(Icons.accessibility_new_rounded),
                    ),
                    GoalTile(
                      title: "Shred",
                      icon: const Icon(Icons.emoji_food_beverage_rounded),
                    ),
                    GoalTile(
                      title: "Bulk",
                      icon: const Icon(Icons.food_bank_outlined),
                    )
                  ],
                ),
              ),
              MyButton(onPressed: () {}, text: "Next")
            ],
          ),
        ),
      ),
    );
  }
}
