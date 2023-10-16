import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:gym_shift/Core/constants/colors.dart';

class OtpField extends StatelessWidget {
  String value = "";
  void Function(String) onChanged;
  OtpField({super.key, required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return OtpTextField(
      focusedBorderColor: kPrimaryColor,
      //enabledBorderColor: kPrimaryColor,
      borderWidth: 3,
      numberOfFields: 4,
      //borderColor: kPrimaryColor,
      showFieldAsBox: true,
      onCodeChanged: (value) {
        print(value);
      },
      onSubmit: (_) {},
    );
  }
}
