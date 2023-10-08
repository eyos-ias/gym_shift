import 'package:flutter/material.dart';
import 'package:gym_shift/screens/ProfileSetup/allergies_page.dart';
import 'package:gym_shift/screens/ProfileSetup/components/goal_tiles.dart';
import 'package:gym_shift/screens/common/components/button.dart';

import '../../Core/constants/colors.dart';

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
                      subtitle: "Gain strength and size effectively",
                      icon: Icon(Icons.add),
                    ),
                    GoalTile(
                      title: "Lose Fat",
                      subtitle: "Achieve a lean and toned physique",
                      icon: Icon(Icons.remove),
                    ),
                    GoalTile(
                      title: "Maintain Weight",
                      subtitle: "Stay consistent and healthy",
                      icon: Icon(Icons.accessibility_new_rounded),
                    ),
                    GoalTile(
                      title: "Shred",
                      subtitle: "Cut down for a defined look",
                      icon: const Icon(Icons.emoji_food_beverage_rounded),
                    ),
                    GoalTile(
                      title: "Bulk",
                      subtitle: "Pack on muscle mass",
                      icon: const Icon(Icons.food_bank_outlined),
                    )
                  ],
                ),
              ),
              MyButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return AllergiesPage();
                    }));
                  },
                  text: "Next")
            ],
          ),
        ),
      ),
    );
  }
}
