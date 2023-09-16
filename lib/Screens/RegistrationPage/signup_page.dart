import 'package:flutter/material.dart';
import '../../core/constants/colors.dart';
import './components/text_field.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool agreeToTerms = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Sign Up',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 36),
                ),
                Image.asset(
                  "assets/Logo.png",
                  width: 150,
                  height: 150,
                ),
                const SizedBox(height: 10),
                const Text(
                  '''Let's get started!''',
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  height: 50,
                ),
                // Email input field
                const MyTextField(
                  hintText: "Full Name",
                ),
                const SizedBox(height: 15.0),
                //password input field
                const MyTextField(
                  hintText: "Email",
                ),
                const SizedBox(height: 15.0),
                const MyTextField(
                  hintText: "Gender",
                ),
                const SizedBox(height: 15.0),
                const MyTextField(
                  hintText: "Password",
                ),
                const SizedBox(height: 15.0),
                const MyTextField(
                  hintText: "Confirm password",
                ),
                const SizedBox(height: 15.0),
                //sign in button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(kPrimaryColor),
                      ),
                      onPressed: () {},
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
                const SizedBox(height: 30),
                //not a member?
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                        value: agreeToTerms,
                        onChanged: (_) {
                          setState(() {
                            agreeToTerms = !agreeToTerms;
                          });
                        }),
                    const Text('''I agree to the'''),
                    const SizedBox(
                      width: 5.0,
                    ),
                    const Text(
                      '''terms and conditions''',
                      style: TextStyle(color: kPrimaryColor),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
/*
Fullname
email
gender
password
confirm password

*/