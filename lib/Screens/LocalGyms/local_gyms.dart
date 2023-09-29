import 'package:flutter/material.dart';
import 'package:gym_shift/core/constants/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
          return Stack(
            children: [
              Container(
                width: double.infinity,
                height: constraints.maxHeight * 0.05,
                color: kPrimaryColor,
              ),
              Column(
                children: [
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
