import 'package:flutter/material.dart';

import '../../../Core/constants/colors.dart';

class MyButton extends StatelessWidget {
  bool? enabled;
  final String text;
  final void Function() onPressed;
  Color? color = kPrimaryColor;
  MyButton({
    this.color,
    required this.onPressed,
    required this.text,
    this.enabled = false,
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
            backgroundColor:
                MaterialStateProperty.all(enabled! ? color : kTextColor),
          ),
          onPressed: enabled! ? onPressed : null,
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
