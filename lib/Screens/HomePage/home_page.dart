import 'package:flutter/material.dart';
import 'package:gym_shift/Core/constants/colors.dart';
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
      drawer: const SideBar(),
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
  }
}
