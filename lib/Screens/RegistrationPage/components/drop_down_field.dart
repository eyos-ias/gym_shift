import 'package:flutter/material.dart';

class MyGenderDropdown extends StatefulWidget {
  @override
  _MyGenderDropdownState createState() => _MyGenderDropdownState();
}

class _MyGenderDropdownState extends State<MyGenderDropdown> {
  String? selectedGender;

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
          child: DropdownButtonFormField<String>(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Gender",
            ),
            items: ["Male", "Female", "Non-binary", "Prefer not to say"]
                .map((String item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(item),
              );
            }).toList(),
            value: selectedGender,
            onChanged: (String? value) {
              setState(() {
                selectedGender = value;
              });
            },
          ),
        ),
      ),
    );
  }
}
