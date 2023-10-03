import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';

class HeadingSection extends StatelessWidget {
  final BoxConstraints constraints;
  const HeadingSection({
    required this.constraints,
    super.key,
  });

  String _getGreeting() {
    final hour = DateTime.now().hour;

    if (hour < 12) {
      return "Good morning!";
    } else if (hour < 17) {
      return "Good afternoon!";
    } else {
      return "Good evening!";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: constraints.maxHeight * 0.11,
      color: kPrimaryColor,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: constraints.maxWidth * 0.05),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: double.infinity,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _getGreeting(),
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.white60,
                          fontSize:
                              18 * MediaQuery.of(context).textScaleFactor),
                    ),
                    Text(
                      "Bob Richmond",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize:
                              25 * MediaQuery.of(context).textScaleFactor),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: double.infinity,
              child: Center(
                child: CircleAvatar(
                  backgroundImage:
                      AssetImage("assets/images/sidebar_image.png"),
                  radius: 30,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
