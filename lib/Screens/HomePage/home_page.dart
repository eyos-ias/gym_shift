import 'package:flutter/material.dart';
import 'package:gym_shift/Core/constants/colors.dart';
import 'package:gym_shift/core/common/page_not_found.dart';
import 'package:gym_shift/provider/auth_provider.dart';
import 'package:provider/provider.dart';
import '../Notifications/notifications_page.dart';
import './components/heading_section.dart';
import './components/main_section.dart';
import '../common/components/SideBar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    if (Provider.of<AuthProvider>(context).authenticated) {
      return Scaffold(
        backgroundColor: kPrimaryColor,
        appBar: AppBar(
          title: const Text("Your Playground"),
          backgroundColor: kPrimaryColor,
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const NotificationsPage(),
                  ),
                );
              },
              icon: const Icon(Icons.notifications_none_outlined),
            )
          ],
        ),
        drawer: SideBar(),
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return Column(
              children: [
                HeadingSection(constraints: constraints),
                MainSection(constraints: constraints),
              ],
            );
          },
        ),
      );
    } else {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("You are not logged in"),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/registration');
                  },
                  child: const Text("Go to registration page"))
            ],
          ),
        ),
      );
    }
  }
}
