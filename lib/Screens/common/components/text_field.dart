import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String hintText;
  const MyTextField({
    super.key,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: TextField(
            decoration:
                InputDecoration(border: InputBorder.none, hintText: hintText),
          ),
        ),
      ),
    );
  }
}
