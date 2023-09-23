import 'package:flutter/material.dart';
import 'package:gym_shift/core/constants/colors.dart';

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
              Container(
                height: constraints.maxHeight * 0.11,
                color: kPrimaryColor,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: constraints.maxWidth * 0.09),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Good morning!",
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white60,
                                  fontSize: 18 *
                                      MediaQuery.of(context).textScaleFactor),
                            ),
                            Text(
                              "Ashley Richmond",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25 *
                                      MediaQuery.of(context).textScaleFactor),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: double.infinity,
                        child: Center(
                          child: CircleAvatar(
                            radius: 30,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                child: Container(
                  height: constraints.maxHeight * 0.89,
                  color: Colors.white,
                  child: Column(
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: constraints.maxHeight * 0.02,
                      ),
                      Text(
                        "Today's Inspiring Motivation",
                        style: TextStyle(
                          color: kTextColor,
                          fontSize: 18 * MediaQuery.of(context).textScaleFactor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Expanded(
                          child: Image.asset("assets/images/motivation1.png")),
                      Expanded(
                        child: GridView(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 16 / 19,
                            crossAxisCount: 2,
                          ),
                          children: [
                            Container(
                              margin: const EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
