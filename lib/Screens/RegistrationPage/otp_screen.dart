import 'package:flutter/material.dart';
import 'package:gym_shift/core/constants/colors.dart';
import './components/otp_field.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Verification",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 80),
          OtpField(),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Container(
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(15)),
              child: const Center(
                child: Text(
                  'Verify Code',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: const Text('Resend Code'),
          ),
        ],
      ),
    );
  }
}
