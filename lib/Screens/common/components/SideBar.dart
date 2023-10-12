import 'package:flutter/material.dart';

import 'package:gym_shift/Core/constants/colors.dart';
import 'package:gym_shift/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class SideBar extends StatelessWidget {
  const SideBar({super.key});
  static String iconPath = "assets/images/sidebar_icons/";
  @override
  Widget build(BuildContext context) {
    String profileUrl = Provider.of<AuthProvider>(context).user!.profileUrl;
    String userName = Provider.of<AuthProvider>(context).user!.fullName;
    return Drawer(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return ListView(
            children: [
              Container(
                color: kPrimaryColor,
                height: constraints.maxHeight * (140 / 850),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: constraints.maxWidth * (20 / 360)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(profileUrl),
                          //AssetImage("assets/images/sidebar_image.png"),
                          radius: 40,
                        ),
                        SizedBox(
                          width: constraints.maxWidth * (20 / 360),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "$userName",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize:
                                    22 * MediaQuery.of(context).textScaleFactor,
                              ),
                            ),
                            // const Text(
                            //   "abc**@gmail.com",
                            //   style: TextStyle(
                            //     color: Colors.white,
                            //     fontSize: 13,
                            //   ),
                            // ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              ListTile(
                leading: Image.asset(
                  "${iconPath}home.png",
                  height: 24,
                  width: 24,
                ),
                title: const Text("Home"),
                onTap: () {
                  Navigator.popAndPushNamed(context, '/homepage');
                },
              ),
              ListTile(
                leading: Image.asset(
                  "${iconPath}workout_plans.png",
                  height: 24,
                  width: 24,
                ),
                title: const Text("Workout Plans"),
                onTap: () {
                  Navigator.pushNamed(context, '/workout_plans');
                },
              ),
              ListTile(
                leading: Image.asset(
                  "${iconPath}workout_demonstration.png",
                  height: 24,
                  width: 24,
                ),
                title: const Text("Workout Demonstration"),
                onTap: () {
                  Navigator.pushNamed(context, '/workout_demonstration');
                },
              ),
              ListTile(
                leading: Image.asset(
                  "${iconPath}meal_plans.png",
                  height: 24,
                  width: 24,
                ),
                title: const Text("Meal Plans"),
                onTap: () {
                  Navigator.pushNamed(context, '/meal_plans');
                },
              ),
              ListTile(
                leading: Image.asset(
                  "${iconPath}local_gym.png",
                  height: 24,
                  width: 24,
                ),
                title: const Text("Local Gym"),
                onTap: () {
                  Navigator.pushNamed(context, '/local_gym');
                },
              ),
              ListTile(
                leading: Image.asset(
                  "${iconPath}subscription.png",
                  height: 24,
                  width: 24,
                ),
                title: const Text("Subscription"),
                onTap: () {
                  Navigator.pushNamed(context, '/subscription');
                },
              ),
              ListTile(
                leading: Image.asset(
                  "${iconPath}challenges.png",
                  height: 24,
                  width: 24,
                ),
                title: const Text("Challenges"),
                onTap: () {
                  Navigator.pushNamed(context, '/challenges');
                },
              ),
              ListTile(
                leading: Image.asset(
                  "${iconPath}profile.png",
                  height: 24,
                  width: 24,
                ),
                title: const Text("Profile"),
                onTap: () {
                  Navigator.pushNamed(context, '/profile');
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings, color: kPrimaryColor),
                title: const Text("Settings"),
                onTap: () {
                  Navigator.pushNamed(context, '/settings');
                },
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: constraints.maxWidth * (27 / 360)),
                child: const Divider(
                  thickness: 1.3,
                ),
              ),
              ListTile(
                leading: const Icon(
                  Icons.logout,
                  color: kPrimaryColor,
                ),
                title: const Text("Logout"),
                onTap: () {
                  // Navigator.pushNamed(context, '/logout');
                  Navigator.popAndPushNamed(context, '/registration');

                  Provider.of<AuthProvider>(context, listen: false).logout();
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
