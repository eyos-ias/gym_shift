import 'package:flutter/material.dart';
import 'package:gym_shift/core/constants/colors.dart';

import '../common/components/button.dart';

class ProfilePicturePage extends StatelessWidget {
  const ProfilePicturePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Column(
              children: [
                Center(
                  child: Text(
                    "Profile Picture",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    CircleAvatar(
                      radius: 60,
                    ),
                    Icon(Icons.add_rounded, color: kPrimaryColor),
                  ],
                ),
                Text(
                  "Take a minute to upload a profile picture",
                  style: TextStyle(color: kTextColor),
                ),
              ],
            ),
            MyButton(
              text: "Next",
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
