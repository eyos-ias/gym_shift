import 'package:flutter/material.dart';
import 'package:gym_shift/Screens/WorkoutPlans/components/workout_card.dart';

import '../../../core/constants/colors.dart';

class WorkoutPlans extends StatelessWidget {
  //final BoxConstraints constraints;
  const WorkoutPlans({
    //required this.constraints,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 5,
        centerTitle: true,
        title: const Text(
          "Workout Plans",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        return Container(
          width: double.infinity,
          height: constraints.maxHeight * 0.89,
          color: Colors.white,
          child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
            return ListView(
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: constraints.maxHeight * 0.02,
                ),
                SizedBox(
                  height: constraints.maxHeight * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    WorkoutCard(
                      onPressed: () {},
                      constraints: constraints,
                      imagePath: "assets/images/shoulder.png",
                      title: "Week 1",
                    ),
                    WorkoutCard(
                      onPressed: () {},
                      constraints: constraints,
                      imagePath: "assets/images/chest.png",
                      title: "Week 2",
                    ),
                  ],
                ),
                SizedBox(
                  height: constraints.maxHeight * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    WorkoutCard(
                      onPressed: () {},
                      constraints: constraints,
                      imagePath: "assets/images/quads.png",
                      title: "Week 3",
                    ),
                    WorkoutCard(
                      onPressed: () {},
                      constraints: constraints,
                      imagePath: "assets/images/obliques.png",
                      title: "Week 4",
                    ),
                  ],
                ),
                SizedBox(
                  height: constraints.maxHeight * 0.02,
                ),
              ],
            );
          }),
        );
      }),
    );
  }
}
