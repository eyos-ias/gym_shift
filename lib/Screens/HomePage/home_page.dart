import 'package:flutter/material.dart';
import 'package:gym_shift/core/constants/colors.dart';
import './components/heading_section.dart';

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

class MainSection extends StatelessWidget {
  final BoxConstraints constraints;
  const MainSection({
    required this.constraints,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      ),
      child: Container(
        width: double.infinity,
        height: constraints.maxHeight * 0.89,
        color: Colors.white,
        child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          return ListView(
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: constraints.maxHeight * 0.02,
              ),
              Text(
                "Today's Inspiring Motivation",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: kTextColor,
                  fontSize: 18 * MediaQuery.of(context).textScaleFactor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: constraints.maxHeight * 0.465,
                child: Image.asset("assets/images/motivation1.png"),
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Container(
                        color: Colors.yellow,
                      )
                    ],
                  )
                ],
              )
            ],
          );
        }),
      ),
    );
  }
}
