import 'package:flutter/material.dart';
import 'package:gym_shift/Screens/common/components/button.dart';
import 'package:gym_shift/core/constants/colors.dart';

class ExerciseDemo extends StatefulWidget {
  const ExerciseDemo({Key? key}) : super(key: key);

  @override
  _ExerciseDemoState createState() => _ExerciseDemoState();
}

class _ExerciseDemoState extends State<ExerciseDemo> {
  late PageController _pageController;
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _pageController.addListener(_pageListener);
  }

  void _pageListener() {
    setState(() {
      _currentPageIndex = _pageController.page!.round();
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 2,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.share),
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Padding(
            padding: EdgeInsets.symmetric(
              vertical: 8.0 * (constraints.maxHeight * 0.002),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: [
                Center(
                  child: Text(
                    "Bench Support",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 22 * MediaQuery.of(context).textScaleFactor,
                    ),
                  ),
                ),
                Container(
                  height: constraints.maxHeight * 0.6,
                  child: PageView(
                    controller: _pageController,
                    children: [
                      Container(
                        height: constraints.maxHeight * 0.6,
                        width: double.infinity,
                        child: Image.asset(
                          "assets/images/exercise_demo/bench_press.png",
                          width: double.infinity,
                        ),
                      ),
                      Container(
                        height: constraints.maxHeight * 0.6,
                        width: double.infinity,
                        color: Colors.blue,
                      ),
                      Container(
                        height: constraints.maxHeight * 0.6,
                        width: double.infinity,
                        color: Colors.green,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: constraints.maxWidth * 0.1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        iconSize: 55,
                        onPressed: () {
                          _pageController.animateToPage(0,
                              duration: const Duration(milliseconds: 200),
                              curve: Curves.easeInOut);
                        },
                        icon: Icon(
                          Icons.image,
                          color: _currentPageIndex == 0
                              ? kPrimaryColor
                              : kTextColor,
                        ),
                      ),
                      IconButton(
                        iconSize: 55,
                        onPressed: () {
                          _pageController.animateToPage(1,
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeInOut);
                        },
                        icon: Icon(
                          Icons.video_collection_rounded,
                          color: _currentPageIndex == 1
                              ? kPrimaryColor
                              : kTextColor,
                        ),
                      ),
                      IconButton(
                        iconSize: 52,
                        onPressed: () {
                          _pageController.animateToPage(2,
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeInOut);
                        },
                        icon: Icon(
                          Icons.document_scanner_rounded,
                          color: _currentPageIndex == 2
                              ? kPrimaryColor
                              : kTextColor,
                        ),
                      ),
                    ],
                  ),
                ),
                MyButton(onPressed: () {}, text: "Variations")
              ],
            ),
          );
        },
      ),
    );
  }
}
