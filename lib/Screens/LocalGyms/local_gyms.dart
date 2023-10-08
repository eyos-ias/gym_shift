import 'package:flutter/material.dart';
import 'package:gym_shift/screens/LocalGyms/components/gym_card.dart';
import 'package:gym_shift/Core/constants/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'components/gym_details.dart';
import 'components/search_settings.dart';

class LocalGymsPage extends StatelessWidget {
  const LocalGymsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: kPrimaryColor,
        centerTitle: true,
        title: const Text(
          "Local Gyms",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: constraints.maxHeight * 0.05,
                    color: kPrimaryColor,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: constraints.maxWidth * 0.05,
                        vertical: constraints.maxHeight * 0.015),
                    child: Material(
                      elevation: 3,
                      borderRadius: BorderRadius.circular(13),
                      child: SearchComponent(
                        constraints: constraints,
                      ),
                    ),
                  ),
                ],
              ),
              //List Items
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: constraints.maxWidth * 0.05),
                  child: ListView(
                    children: [
                      // Row(
                      //   children: [
                      //     SizedBox(
                      //       child: Image.asset("assets/images/gym_card.png"),
                      //     )
                      //   ],
                      // ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return const GymDetails();
                          }));
                        },
                        child: GymCard(
                            // /constraints: constraints,
                            name: "Strong Bodies Fitness \nCenter",
                            rating: 4.8,
                            address:
                                "Address: Office #304 G/F Unique World Business Centre United State (USA)  ",
                            imagePath: "assets/images/gym_card.png"),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class SearchComponent extends StatelessWidget {
  BoxConstraints constraints;

  SearchComponent({super.key, required this.constraints});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: constraints.maxWidth * 0.03),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Icon(Icons.search, color: Colors.grey),
          const SizedBox(
            width: 5,
          ),
          const Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search For Gyms",
                border: InputBorder.none,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              SearchSettings(context, constraints);
            },
            child: SvgPicture.asset("assets/vectors/settings.svg"),
          ),
        ],
      ),
    );
  }
}
