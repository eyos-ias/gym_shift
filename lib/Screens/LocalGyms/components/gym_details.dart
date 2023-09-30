// ignore_for_file: unnecessary_const, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:gym_shift/Screens/common/components/button.dart';
import 'package:gym_shift/core/constants/colors.dart';

class GymDetails extends StatelessWidget {
  const GymDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(builder: (context, constraints) {
          return SingleChildScrollView(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: constraints.maxHeight * 0.02,
                  ),
                  Image.asset(
                    "assets/images/gym_details.png",
                    width: constraints.maxWidth * 0.9,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(
                    height: constraints.maxHeight * 0.02,
                  ),
                  //title and heading
                  Material(
                    borderRadius: BorderRadius.circular(13),
                    color: Colors.white,
                    elevation: 10,
                    child: Container(
                      width: constraints.maxWidth * 0.9,
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Strong Bodies Fitness Center",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20 *
                                    MediaQuery.of(context).textScaleFactor),
                          ),
                          SizedBox(
                            height: constraints.maxHeight * 0.02,
                          ),
                          const Text(
                            "(512) 357-3267",
                            style: TextStyle(color: kPrimaryColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: constraints.maxHeight * 0.02,
                  ),
                  //description
                  Material(
                    borderRadius: BorderRadius.circular(13),
                    color: Colors.white,
                    elevation: 10,
                    child: Container(
                      width: constraints.maxWidth * 0.9,
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Description",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18 *
                                    MediaQuery.of(context).textScaleFactor),
                          ),
                          const Text(
                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the. Lorem Ipsum is simply dummy text of the printing and dummy text ever since thetypesetting industry. Lorem Ipsum has been the industry's standard dummy text ever sinc. ",
                            style: TextStyle(color: kTextColor),
                            textAlign: TextAlign.justify,
                          ),
                          SizedBox(
                            height: constraints.maxHeight * 0.01,
                          ),
                          Text(
                            "Opening Routine",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18 *
                                    MediaQuery.of(context).textScaleFactor),
                          ),
                          const WeekRoutine(
                              day: "Monday", openingHours: "9:00 AM-05:00"),
                          const WeekRoutine(
                              day: "Tuesday", openingHours: "9:00 AM-05:00"),
                          const WeekRoutine(
                              day: "Wednesday", openingHours: "9:00 AM-05:00"),
                          const WeekRoutine(
                              day: "Thursday", openingHours: "9:00 AM-05:00"),
                          const WeekRoutine(
                              day: "Friday", openingHours: "9:00 AM-05:00"),
                          const WeekRoutine(
                              day: "Saturday", openingHours: "Off"),
                          const WeekRoutine(day: "Sunday", openingHours: "Off"),
                          Text(
                            "Location",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18 *
                                    MediaQuery.of(context).textScaleFactor),
                          ),
                          const Text(
                            "1910 South Josephine Street • Denver CO 80210 • South Denver",
                            style: TextStyle(color: kTextColor),
                          ),
                          SizedBox(
                            height: constraints.maxHeight * 0.01,
                          ),
                          Text(
                            "Map View",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18 *
                                    MediaQuery.of(context).textScaleFactor),
                          ),
                          SizedBox(
                            height: constraints.maxHeight * 0.01,
                          ),
                          Placeholder(
                            fallbackHeight: constraints.maxHeight * 0.2,
                            fallbackWidth: constraints.maxWidth * 0.8,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: constraints.maxHeight * 0.02,
                  ),
                  //amenities
                  Material(
                    borderRadius: BorderRadius.circular(13),
                    color: Colors.white,
                    elevation: 10,
                    child: Container(
                      width: constraints.maxWidth * 0.9,
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Amenities",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18 *
                                    MediaQuery.of(context).textScaleFactor),
                          ),
                          SizedBox(
                            height: constraints.maxHeight * 0.01,
                          ),
                          Wrap(
                            spacing: constraints.maxWidth * 0.03,
                            children: [
                              Column(
                                children: [
                                  const Icon(
                                    Icons.check_box,
                                    color: kPrimaryColor,
                                    size: 30,
                                  ),
                                  const Text(
                                    "Stationary bikes",
                                    style: TextStyle(color: kTextColor),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  const Icon(
                                    Icons.check_box,
                                    color: kPrimaryColor,
                                    size: 30,
                                  ),
                                  const Text(
                                    "Treadmills",
                                    style: TextStyle(color: kTextColor),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  const Icon(
                                    Icons.check_box,
                                    color: kPrimaryColor,
                                    size: 30,
                                  ),
                                  const Text(
                                    "Ellipticals",
                                    style: TextStyle(color: kTextColor),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  const Icon(
                                    Icons.check_box,
                                    color: kPrimaryColor,
                                    size: 30,
                                  ),
                                  const Text(
                                    "Showers",
                                    style: TextStyle(color: kTextColor),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  const Icon(
                                    Icons.check_box,
                                    color: kPrimaryColor,
                                    size: 30,
                                  ),
                                  const Text(
                                    "Changine rooms",
                                    style: TextStyle(color: kTextColor),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: constraints.maxHeight * 0.02,
                  ),

                  Material(
                    borderRadius: BorderRadius.circular(13),
                    color: Colors.white,
                    elevation: 10,
                    child: Container(
                      width: constraints.maxWidth * 0.9,
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Reviews & Ratings",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18 *
                                    MediaQuery.of(context).textScaleFactor),
                          ),
                          Divider(),
                          Center(
                            child: Text(
                              "No reviews yet",
                              style: TextStyle(
                                  color: kPrimaryColor,
                                  fontSize: 18 *
                                      MediaQuery.of(context).textScaleFactor),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: constraints.maxHeight * 0.02,
                  ),
                  MyButton(onPressed: () {}, text: "Leave a Review"),
                  SizedBox(
                    height: constraints.maxHeight * 0.03,
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}

class WeekRoutine extends StatelessWidget {
  final String day;
  final String openingHours;
  const WeekRoutine({super.key, required this.day, required this.openingHours});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(day),
            Text(
              openingHours,
              style: const TextStyle(color: kTextColor),
            ),
          ],
        ),
        Divider(),
      ],
    );
  }
}
