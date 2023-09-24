import 'package:flutter/material.dart';
import 'package:gym_shift/core/constants/colors.dart';
import './components/heading_section.dart';
import './components/main_section.dart';

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
        title: const Text("GymShift Home"),
        backgroundColor: kPrimaryColor,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none_outlined),
          )
        ],
      ),
      drawer: const Drawer(),
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
