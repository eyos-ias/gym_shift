import 'package:flutter/material.dart';
import 'package:gym_shift/core/constants/colors.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:table_calendar/table_calendar.dart';

class ChallengesPage extends StatelessWidget {
  const ChallengesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 5,
        centerTitle: true,
        title: const Text(
          "Challenges",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        return Padding(
          padding: EdgeInsets.symmetric(
              horizontal: constraints.maxWidth * (20 / 360),
              vertical: constraints.maxHeight * 0.01),
          child: ListView(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: constraints.maxHeight * 0.02,
              ),
              Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(15),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Monthly Progress",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize:
                                20 * MediaQuery.of(context).textScaleFactor),
                      ),
                      SizedBox(
                        height: constraints.maxHeight * 0.02,
                      ),
                      LinearPercentIndicator(
                        leading: const Text(
                          "0%",
                          style: TextStyle(color: kPrimaryColor),
                        ),
                        trailing: const Text(
                          "100%",
                          style: TextStyle(color: kPrimaryColor),
                        ),
                        barRadius: Radius.circular(15),
                        width: constraints.maxWidth * 0.7,
                        lineHeight: 14.0,
                        percent: 0.5,
                        backgroundColor: Colors.grey[350],
                        progressColor: kPrimaryColor,
                      ),
                      SizedBox(
                        height: constraints.maxHeight * 0.02,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: constraints.maxHeight * 0.02,
              ),
              TableCalendar(
                calendarFormat: CalendarFormat.month,
                headerVisible: true,
                calendarStyle: CalendarStyle(),
                focusedDay: DateTime.now(),
                firstDay: DateTime.utc(2010, 10, 16),
                lastDay: DateTime.utc(2030, 3, 14),
              ),
              const Divider(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Today's Challenges",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24 * MediaQuery.of(context).textScaleFactor),
                  ),
                  SizedBox(
                    height: constraints.maxHeight * 0.02,
                  ),
                  Text(
                    "Foods",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18 * MediaQuery.of(context).textScaleFactor),
                  ),
                  SizedBox(
                    height: constraints.maxHeight * 0.01,
                  ),
                  ListTile(
                    leading: Container(
                      height: 50,
                      width: 50,
                      color: kPrimaryColor,
                    ),
                    title: const Wrap(
                      children: [
                        Text(
                          "Turkey Meatballs in marinara sauce",
                          style: TextStyle(color: kTextColor),
                        ),
                      ],
                    ),
                    trailing: Checkbox(value: false, onChanged: (_) {}),
                  )
                ],
              ),
            ],
          ),
        );
      }),
    );
  }
}
