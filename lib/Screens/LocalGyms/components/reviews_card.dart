// ignore_for_file: unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:gym_shift/core/constants/colors.dart';

class ReviewCard extends StatelessWidget {
  ReviewCard({
    super.key,
    required this.name,
    required this.review,
    required this.rating,
    required this.date,
    required this.constraints,
  });

  final String name;
  final String review;
  final double rating;
  final String date;
  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(15),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment
                  .spaceBetween, // Aligns items at opposite ends
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 23,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize:
                                20 * MediaQuery.of(context).textScaleFactor,
                          ),
                        ),
                        Text(
                          date,
                          style: const TextStyle(color: kTextColor),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                    Text("${rating.toStringAsFixed(1)}"),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 5),
            Text(
              review,
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
