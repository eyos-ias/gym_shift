import 'package:flutter/material.dart';
import 'package:gym_shift/provider/auth_provider.dart';
import 'package:provider/provider.dart';

import '../../../Core/constants/colors.dart';

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
    String userName = Provider.of<AuthProvider>(context).user!.fullName;

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
                      "$userName",
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
            SizedBox(
              height: double.infinity,
              child: Center(
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      Provider.of<AuthProvider>(context).user!.profileUrl),

                  // AssetImage("assets/images/sidebar_image.png"),
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
