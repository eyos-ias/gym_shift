import 'package:flutter/material.dart';
import 'package:gym_shift/Core/constants/colors.dart';
import './components/otp_field.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Verification",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const Text("Enter the OTP code sent to your email"),
              const SizedBox(height: 50),
              const OtpField(),
              const SizedBox(height: 20),
              ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(kPrimaryColor),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/bmi');
                    },
                    child: Container(
                      padding: const EdgeInsets.all(20.0),
                      child: const Center(
                        child: Text(
                          'Verify Code',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text("Didn't receive the code?"),
              TextButton(
                onPressed: () {},
                child: const Text('Resend Code'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
