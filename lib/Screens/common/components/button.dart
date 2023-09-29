import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';

class MyButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  Color? color = kPrimaryColor;
  MyButton({
    this.color,
    required this.onPressed,
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(color),
          ),
          onPressed: onPressed,
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Text(
                text,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
