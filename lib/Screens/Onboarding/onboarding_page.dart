import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../core/constants/colors.dart';

class OnboardingPage extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;

  const OnboardingPage(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 60),
            // Image.asset(
            //   imageUrl,
            //   width: 400,
            //   height: 400,
            // ),
            SvgPicture.asset(imageUrl, width: 400, height: 400),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Text(
                description,
                style: const TextStyle(color: kTextColor),
              ),
            ),
          ]),
    );
  }
}
