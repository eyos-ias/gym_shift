import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../core/constants/colors.dart';

class OnboardingPage extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  BoxConstraints constraints;
  OnboardingPage(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.description,
      required this.constraints});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            imageUrl,
            width: constraints.maxWidth * 0.8,
            height: constraints.maxHeight * 0.4,
          ),
          SizedBox(height: constraints.maxHeight * 0.03),
          Text(
            title,
            style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: constraints.maxHeight * 0.03,
          ),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: constraints.maxWidth * 0.06),
            child: Text(
              description,
              textAlign: TextAlign.justify,
              style: const TextStyle(color: kTextColor),
            ),
          ),
        ],
      ),
    );
  }
}
