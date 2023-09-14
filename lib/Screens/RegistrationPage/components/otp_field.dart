import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:gym_shift/core/constants/colors.dart';

class OtpField extends StatelessWidget {
  const OtpField({super.key});

  @override
  Widget build(BuildContext context) {
    return OtpTextField(
      borderWidth: 3,
      numberOfFields: 5,
      borderColor: kPrimaryColor,
      showFieldAsBox: true,
      onCodeChanged: (_) {},
      onSubmit: (_) {},
    );
  }
}
