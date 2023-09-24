import 'package:flutter/material.dart';

import 'package:gym_shift/core/constants/colors.dart';

class SideBar extends StatelessWidget {
  const SideBar({super.key});
  static String iconPath = "assets/images/sidebar_icons/";
  @override
  Widget build(BuildContext context) {
    return Drawer(child: LayoutBuilder(builder: (context, constraints) {
      return ListView(
        children: [
          Container(
            color: kPrimaryColor,
            height: constraints.maxHeight * (140 / 850),
          ),
          ListTile(
            leading: Image.asset(
              "${iconPath}home.png",
              height: 24,
              width: 24,
            ),
            title: const Text("Home"),
            onTap: () {
              Navigator.pushNamed(context, '/');
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
            title: Text("Profile"),
            onTap: () {
              Navigator.pushNamed(context, '/profile');
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("Settings"),
            onTap: () {
              Navigator.pushNamed(context, '/settings');
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text("Logout"),
            onTap: () {
              Navigator.pushNamed(context, '/logout');
            },
          ),
        ],
      );
    }));
  }
}
