import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';
import './home_card.dart';

class MainSection extends StatelessWidget {
  final BoxConstraints constraints;
  const MainSection({
    required this.constraints,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      ),
      child: Container(
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
              Text(
                "Today's Inspiring Motivation",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: kTextColor,
                  fontSize: 18 * MediaQuery.of(context).textScaleFactor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: constraints.maxHeight * 0.02,
              ),
              SizedBox(
                height: constraints.maxHeight * 0.47,
                child: Image.asset("assets/images/motivation1.png"),
              ),
              SizedBox(
                height: constraints.maxHeight * 0.02,
              ),
              Text(
                "Exercises",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: kTextColor,
                    fontSize: 18 * MediaQuery.of(context).textScaleFactor,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: constraints.maxHeight * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  HomeCard(
                    onPressed: () {},
                    constraints: constraints,
                    imagePath: "assets/images/shoulder.png",
                    title: "Shoulder",
                  ),
                  HomeCard(
                    onPressed: () {},
                    constraints: constraints,
                    imagePath: "assets/images/chest.png",
                    title: "Chest",
                  ),
                ],
              ),
              SizedBox(
                height: constraints.maxHeight * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  HomeCard(
                    onPressed: () {},
                    constraints: constraints,
                    imagePath: "assets/images/quads.png",
                    title: "Quads",
                  ),
                  HomeCard(
                    onPressed: () {},
                    constraints: constraints,
                    imagePath: "assets/images/obliques.png",
                    title: "Obliques",
                  ),
                ],
              ),
              SizedBox(
                height: constraints.maxHeight * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  HomeCard(
                    onPressed: () {},
                    constraints: constraints,
                    imagePath: "assets/images/forearms.png",
                    title: "Forearms",
                  ),
                  HomeCard(
                    onPressed: () {},
                    constraints: constraints,
                    imagePath: "assets/images/abs.png",
                    title: "Abs",
                  ),
                ],
              ),
              SizedBox(
                height: constraints.maxHeight * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  HomeCard(
                    onPressed: () {},
                    constraints: constraints,
                    imagePath: "assets/images/cardio.png",
                    title: "Cardio",
                  ),
                  HomeCard(
                    onPressed: () {},
                    constraints: constraints,
                    imagePath: "assets/images/biceps.png",
                    title: "Biceps",
                  ),
                ],
              ),
              SizedBox(
                height: constraints.maxHeight * 0.02,
              ),
            ],
          );
        }),
      ),
    );
  }
}
