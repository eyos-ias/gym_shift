import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyTextField extends StatelessWidget {
  final String hintText;
  final bool numOnly;
  final int? maxLength;
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;

  MyTextField({
    Key? key,
    required this.hintText,
    this.numOnly = false,
    this.maxLength,
    this.onChanged,
    this.controller,
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
            controller: controller,
            maxLength: maxLength,
            keyboardType: keyboardType,
            inputFormatters:
                numOnly ? [FilteringTextInputFormatter.digitsOnly] : [],
            onChanged: onChanged,
            decoration: InputDecoration(
                border: InputBorder.none, hintText: hintText, counterText: ""),
          ),
        ),
      ),
    );
  }
}
