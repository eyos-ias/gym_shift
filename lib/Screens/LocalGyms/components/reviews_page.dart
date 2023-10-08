import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gym_shift/screens/LocalGyms/components/reviews_card.dart';
import 'package:gym_shift/Core/constants/colors.dart';

class ReviewsPage extends StatelessWidget {
  const ReviewsPage({super.key});
  final String review =
      "Review text popular belief, Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has...";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "Reviews and Ratings",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        return ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ReviewCard(
                  constraints: constraints,
                  name: "Alex Jack",
                  review: review,
                  rating: 4.88,
                  date: "12/12/2021"),
            ),
          ],
        );
      }),
    );
  }
}
