// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:gym_shift/core/Utils/validation.dart';
import 'package:gym_shift/providers/auth_provider.dart';
import 'package:gym_shift/screens/AuthPage/forgot_password.dart';
import 'package:gym_shift/screens/common/components/button.dart';
import 'package:provider/provider.dart';
// import 'package:gym_shift/Core/constants/colors.dart';
// import 'package:http/http.dart' as http;
import '../sign_up/signup_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  // void signIn() async {
  //   try {
  //     http.post(Uri.parse('http://localhost:5000/user/signin'), body: {});
  //   } catch (e) {}
  // }

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isSigningIn = false;
  bool signInError = true;
  String errorMessage = "";
  bool validEmail = false;
  bool validPassword = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Login",
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
                Image.asset(
                  "assets/Logo.png",
                  width: 150,
                  height: 150,
                ),
                const SizedBox(height: 10),
                const Text(
                  'Welcome back!',
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  height: 50,
                ),
                // Email input field
                Padding(
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
                        decoration: const InputDecoration(
                            border: InputBorder.none, hintText: 'Email'),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15.0),
                //password input field
                Padding(
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
                        obscureText: true,
                        decoration: const InputDecoration(
                            border: InputBorder.none, hintText: 'Password'),
                      ),
                    ),
                  ),
                ),
                signInError
                    ? Text(
                        errorMessage,
                        style: const TextStyle(color: Colors.red),
                      )
                    : Container(),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ForgotPasswordPage(),
                      ),
                    );
                  },
                  child: const Text("Forgot Password?"),
                ),
                const SizedBox(height: 15.0),
                //sign in button

                MyButton(
                    enabled: validEmail,
                    onPressed: isSigningIn
                        ? () {}
                        : () async {
                            setState(() {
                              isSigningIn = true;
                              errorMessage = '';
                            });

                            print(
                                "email: ${emailController.text}, password: ${passwordController.text}");
                            await Provider.of<AuthProvider>(context,
                                    listen: false)
                                .signInUser(emailController.text,
                                    passwordController.text);
                            if (Provider.of<AuthProvider>(context,
                                    listen: false)
                                .authenticated) {
                              Navigator.pushNamed(context, '/homepage');
                            } else {
                              setState(() {
                                signInError = true;
                                errorMessage = Provider.of<AuthProvider>(
                                        context,
                                        listen: false)
                                    .errorMessage;
                              });
                            }
                            print("signing in");
                            setState(() {
                              isSigningIn = false;
                            });
                          },
                    text: isSigningIn ? ". . ." : "SignIn"),
                const SizedBox(height: 30),
                //not a member?
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('''Don't have an account?'''),
                    const SizedBox(
                      width: 5.0,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUpPage()));
                      },
                      child: const Text(
                        'SignUp',
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                      ),
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
