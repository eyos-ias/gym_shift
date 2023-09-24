import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';

class HeadingSection extends StatelessWidget {
  final BoxConstraints constraints;
  const HeadingSection({
    required this.constraints,
    super.key,
  });

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
                      "Good morning!",
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.white60,
                          fontSize:
                              18 * MediaQuery.of(context).textScaleFactor),
                    ),
                    Text(
                      "Ashley Richmond",
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
                  backgroundImage: AssetImage("assets/images/home_avatar.png"),
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
