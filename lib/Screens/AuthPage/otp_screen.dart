// import 'package:flutter/material.dart';
// import 'package:gym_shift/Core/constants/colors.dart';
// import 'package:gym_shift/providers/auth_provider.dart';
// import 'package:otp_text_field/otp_field.dart';
// import 'package:otp_text_field/style.dart';
// import 'package:provider/provider.dart';
// import './components/otp_field.dart';

// class OtpScreen extends StatefulWidget {
//   OtpScreen({super.key});

//   @override
//   State<OtpScreen> createState() => _OtpScreenState();
// }

// class _OtpScreenState extends State<OtpScreen> {
//   bool isVerifying = false;
//   bool? otpVerified;
//   String? id;
//   bool showOtpField = true;

//   bool resendOtp = false;

//   String value = "";

//   @override
//   Widget build(BuildContext context) {
//     id = Provider.of<AuthProvider>(context).user!.id;
//     return Scaffold(
//       body: Center(
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const Text(
//                 "Verification",
//                 style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
//               ),
//               const Text("Enter the OTP code sent to your email"),
//               const SizedBox(height: 50),
//               // OtpField(
//               //   value: value,
//               //   onChanged: (otpValue) {},
//               // ),
//               isVerifying
//                   ? const CircularProgressIndicator()
//                   : showOtpField
//                       ? OTPTextField(
//                           onChanged: (_) {},
//                           length: 4,
//                           width: MediaQuery.of(context).size.width * 0.7,
//                           fieldWidth: 80,
//                           style: const TextStyle(fontSize: 17),
//                           textFieldAlignment: MainAxisAlignment.spaceAround,
//                           fieldStyle: FieldStyle.box,
//                           onCompleted: (pin) async {
//                             setState(() {
//                               isVerifying = true;
//                             });
//                             await Provider.of<AuthProvider>(context,
//                                     listen: false)
//                                 .confirmOtp(id!, pin);
//                             print(id!);
//                             if (Provider.of<AuthProvider>(context,
//                                     listen: false)
//                                 .otpVerified) {
//                               Navigator.popAndPushNamed(context, '/login');
//                             } else {
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                 const SnackBar(
//                                   content: Text("Invalid OTP"),
//                                 ),
//                               );
//                             }
//                             setState(() {
//                               isVerifying = false;

//                               if (otpVerified!) {
//                                 showOtpField = false;
//                               } else {
//                                 showOtpField = true;
//                               }
//                             });

//                             print("Completed: " + pin);
//                           },
//                         )
//                       : Container(),
//               const SizedBox(height: 20),
//               const SizedBox(height: 20),

//               // Provider.of<AuthProvider>(context).otpVerified
//               //     ? Column(
//               //         children: [
//               //           const Text("Email Verified"),
//               //           TextButton(
//               //             onPressed: () {
//               //               Navigator.pushNamed(context, '/login');
//               //             },
//               //             child: const Text('Login'),
//               //           ),
//               //         ],
//               //       )
//               //     : Text("invalid otp")

//               //const Text("Didn't receive the code?"),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:gym_shift/providers/auth_provider.dart';

class OtpScreen extends StatefulWidget {
  OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  bool isVerifying = false;
  bool showOtpField = true;
  String? id;
  bool? otpVerified;
  String value = "";

  @override
  Widget build(BuildContext context) {
    id = Provider.of<AuthProvider>(context).user!.id;

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
              isVerifying
                  ? const CircularProgressIndicator()
                  : showOtpField
                      ? OTPTextField(
                          onChanged: (otpValue) {},
                          length: 4,
                          width: MediaQuery.of(context).size.width * 0.7,
                          fieldWidth: 80,
                          style: const TextStyle(fontSize: 17),
                          textFieldAlignment: MainAxisAlignment.spaceAround,
                          fieldStyle: FieldStyle.box,
                          onCompleted: (pin) async {
                            setState(() {
                              isVerifying = true;
                            });
                            await Provider.of<AuthProvider>(context,
                                    listen: false)
                                .confirmOtp(id!, pin);
                            print(id!);
                            otpVerified = Provider.of<AuthProvider>(context,
                                    listen: false)
                                .otpVerified;
                            print('otpVerified: $otpVerified');
                            setState(() {
                              isVerifying = false;
                              showOtpField = !otpVerified!;
                            });

                            print("Completed: " + pin);
                          },
                        )
                      : Container(),
              const SizedBox(height: 20),
              if (otpVerified != null)
                if (otpVerified!)
                  Column(
                    children: [
                      const Text("Email Verified"),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/login');
                        },
                        child: const Text('Login'),
                      ),
                    ],
                  )
                else
                  const Text("Invalid OTP"),
            ],
          ),
        ),
      ),
    );
  }
}
