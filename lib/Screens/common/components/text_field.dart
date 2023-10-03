import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyTextField extends StatelessWidget {
  final String hintText;
  final bool numOnly;
  MyTextField({
    Key? key,
    required this.hintText,
    this.numOnly = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextInputType keyboardType =
        numOnly ? TextInputType.number : TextInputType.text;

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
            keyboardType: keyboardType,
            inputFormatters:
                numOnly ? [FilteringTextInputFormatter.digitsOnly] : [],
            decoration:
                InputDecoration(border: InputBorder.none, hintText: hintText),
          ),
        ),
      ),
    );
  }
}
