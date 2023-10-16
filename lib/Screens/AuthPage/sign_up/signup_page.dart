import 'package:flutter/material.dart';
import 'package:gym_shift/core/Utils/validation.dart';
import 'package:gym_shift/providers/auth_provider.dart';
import 'package:gym_shift/screens/AuthPage/otp_screen.dart';
import 'package:gym_shift/screens/ProfileSetup/bmi_page.dart';
import 'package:gym_shift/screens/AuthPage/components/drop_down_field.dart';
import 'package:gym_shift/screens/common/components/button.dart';
import 'package:provider/provider.dart';
import '../../../Core/constants/colors.dart';
import '../../common/components/text_field.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool agreeToTerms = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  String gender = "male";
  bool validEmail = false;
  bool validPassword = false;
  bool validFullName = false;
  bool passwordConfirmed = false;
  bool signingUp = false;
  bool signUpError = false;
  String errorMessage = "";
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

                //Full Name text field
                MyTextField(
                  controller: fullNameController,
                  onChanged: (value) {
                    if (FullNameValidator.isValid(value)) {
                      setState(() {
                        validFullName = true;
                      });
                    } else {
                      setState(() {
                        validFullName = false;
                      });
                    }
                  },
                  maxLength: 20,
                  hintText: "Full Name",
                ),
                const SizedBox(height: 15.0),

                //Email input field
                MyTextField(
                  onChanged: (value) {
                    if (EmailValidator.isValid(value)) {
                      setState(() {
                        validEmail = true;
                      });
                    } else {
                      setState(() {
                        validEmail = false;
                      });
                    }
                  },
                  controller: emailController,
                  hintText: "Email",
                ),

                const SizedBox(height: 15.0),
                // MyTextField(
                //   hintText: "Gender",
                // ),

                //Gender Input Field
                MyGenderDropdown(),
                const SizedBox(height: 15.0),

                //Password Input Field
                MyTextField(
                  obscureText: true,
                  onChanged: (value) {
                    if (PasswordValidator.isValid(value)) {
                      setState(() {
                        validPassword = true;
                      });
                    } else {
                      setState(() {
                        validPassword = false;
                      });
                    }
                  },
                  controller: passwordController,
                  hintText: "Password",
                ),
                const SizedBox(height: 15.0),

                //Confirm Password Input Field
                MyTextField(
                  obscureText: true,
                  onChanged: (value) {
                    if (value == passwordController.text) {
                      setState(() {
                        passwordConfirmed = true;
                      });
                    } else {
                      setState(() {
                        passwordConfirmed = false;
                      });
                    }
                  },
                  controller: confirmPasswordController,
                  hintText: "Confirm password",
                ),

                signUpError
                    ? Text(
                        errorMessage,
                        style: const TextStyle(color: Colors.red),
                      )
                    : Container(),

                const SizedBox(height: 15.0),
                //sign in button

                MyButton(
                    enabled: validEmail &&
                        validFullName &&
                        validPassword &&
                        passwordConfirmed &&
                        agreeToTerms &&
                        !signingUp,
                    onPressed: () async {
                      setState(() {
                        signingUp = true;
                      });
                      // await Future.delayed(Duration(seconds: 2), () {
                      //   print(
                      //       "${emailController.text}, ${passwordController.text}, ${fullNameController.text}, $gender, ${confirmPasswordController.text}");
                      // });
                      await Provider.of<AuthProvider>(context, listen: false)
                          .signUpUser(
                              email: emailController.text,
                              password: passwordController.text,
                              fullName: fullNameController.text,
                              gender: "male",
                              confirmPassword: confirmPasswordController.text);
                      if (Provider.of<AuthProvider>(context, listen: false)
                          .pending) {
                        //await Navigator.pushNamed(context, '/otp_screen');
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OtpScreen()));
                      } else {
                        setState(() {
                          signUpError = true;
                          errorMessage =
                              Provider.of<AuthProvider>(context, listen: false)
                                  .errorMessage;
                        });
                      }

                      setState(() {
                        signingUp = false;
                      });
                    },
                    text: signingUp ? ". . ." : "Sign Up"),
                const SizedBox(height: 30),
                // Agree to terms
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