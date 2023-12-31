import 'package:flutter/material.dart';
import 'package:gym_shift/Screens/ProfileSetup/bmi_page.dart';
import 'package:gym_shift/Screens/RegistrationPage/components/drop_down_field.dart';
import 'package:gym_shift/Screens/common/components/button.dart';
import '../../core/constants/colors.dart';
import '../common/components/text_field.dart';

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
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Signup",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30),
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // const Text(
                //   'Sign Up',
                //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 36),
                // ),
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
                MyTextField(
                  hintText: "Full Name",
                ),
                const SizedBox(height: 15.0),
                //password input field
                MyTextField(
                  hintText: "Email",
                ),
                const SizedBox(height: 15.0),
                // MyTextField(
                //   hintText: "Gender",
                // ),
                MyGenderDropdown(),
                const SizedBox(height: 15.0),
                MyTextField(
                  hintText: "Password",
                ),
                const SizedBox(height: 15.0),
                MyTextField(
                  hintText: "Confirm password",
                ),
                const SizedBox(height: 15.0),
                //sign in button

                MyButton(
                    onPressed: () {
                      // Navigator.pushNamed(context, '/homepage');
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return BmiPage();
                      }));
                    },
                    text: "Sign Up"),
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