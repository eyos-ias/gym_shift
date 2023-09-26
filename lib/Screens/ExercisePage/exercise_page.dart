import 'package:flutter/material.dart';
import 'package:gym_shift/models/exercise_model.dart';
import 'components/exercise_cards.dart';

class ExercisesPage extends StatelessWidget {
  const ExercisesPage({super.key});

  @override
  Widget build(BuildContext context) {
    const imagePath = "assets/images/exercises/";
    List<Exercise> exercises = [
      Exercise(
          title: "Renegade Row", imagePath: "${imagePath}renegade_row.png"),
      Exercise(
          title: "Dumbbell Fly", imagePath: "${imagePath}dumbbell_fly.png"),
      Exercise(title: "Face Pull", imagePath: "${imagePath}face_pull.png"),
      Exercise(title: "High Pull", imagePath: "${imagePath}high_pull.png"),
      Exercise(title: "Trap Raise", imagePath: "${imagePath}trap_raise.png"),
      Exercise(
          title: "Rack Deadlift", imagePath: "${imagePath}rack_deadlift.png"),
      Exercise(
          title: "Clean & Press", imagePath: "${imagePath}clean_n_press.png"),
      Exercise(
          title: "Bench Support", imagePath: "${imagePath}bench_support.png"),
    ];
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
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Padding(
            padding: EdgeInsets.symmetric(
                horizontal: constraints.maxWidth * 0.03,
                vertical: constraints.maxHeight * 0.02),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 15,
                childAspectRatio: 16 / 19,
              ),
              itemCount: exercises.length,
              itemBuilder: (context, index) {
                return ExerciseCard(
                  title: exercises[index].title,
                  imagePath: exercises[index].imagePath,
                );
              },
            ),
          );
        },
      ),
    );
  }
}
