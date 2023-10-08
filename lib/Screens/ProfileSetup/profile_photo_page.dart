import 'package:flutter/material.dart';
import 'package:gym_shift/Core/constants/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../common/components/button.dart';

class ProfilePicturePage extends StatelessWidget {
  const ProfilePicturePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Column(
              children: [
                Center(
                  child: Text(
                    "Profile Picture",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    CircleAvatar(
                      backgroundImage:
                          AssetImage("assets/images/default_profile.png"),
                      radius: 60,
                    ),
                    Icon(Icons.add_rounded, color: kPrimaryColor),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Take a minute to upload a profile picture",
                  style: TextStyle(color: kTextColor),
                ),
              ],
            ),
            SizedBox(
              height: 60,
            ),
            MyButton(
              text: "Next",
              onPressed: () {},
            ),
            SizedBox(
              height: 30,
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                "Skip",
                style: TextStyle(color: kTextColor, fontSize: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
