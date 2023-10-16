import 'package:flutter/material.dart';
import 'package:gym_shift/models/auth.dart';
import 'package:gym_shift/models/user.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthProvider extends ChangeNotifier {
  bool authenticated = false;
  bool pending = false;
  bool? otpVerified;
  User? user;
  AuthModel _authModel = AuthModel(isLoggedIn: false, token: '');
  String errorMessage = '';
  AuthModel get authModel => _authModel;

  Future<void> signInUser(String email, String password) async {
    const String apiUrl = 'http://localhost:5000/user/signin';

    try {
      final Map<String, String> headers = {
        'Content-Type': 'application/json',
      };

      final Map<String, String> body = {
        'email': email,
        'password': password,
      };

      final http.Response response = await http.post(
        Uri.parse(apiUrl),
        headers: headers,
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        // Process the response data as needed
        // print('FullName: ${responseData['result']['fullName'].toString()}');
        user = User(
            id: responseData['result']['_id'],
            fullName: responseData['result']['fullName'] ?? '',
            password: responseData['result']['confirmPassword'],
            email: responseData['result']['email'],
            profileUrl: responseData['result']['profilUrl'] ??
                "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png",
            bmi: responseData['result']['bmi'] ?? '',
            allergies: List<String>.from(responseData['result']['allergies']),
            workoutGoal: responseData['result']['workoutGoal'] ?? '');

        authenticated = true;
        print("${user.toString()}");
        print(responseData);
      } else {
        //print(response.body.runtimeType);
        final Map<String, dynamic> responseBody = json.decode(response.body);

        errorMessage = responseBody['message'];
        print('Request failed with status: ${response.statusCode}');
        print('Response: ${response.body}');
        authenticated = false;
      }
    } catch (error) {
      errorMessage = 'Something went wrong on our side.';
      authenticated = false;
      print('Error occurred: $error');
    }

    notifyListeners();
  }

  Future<void> signUpUser(
      {required String email,
      required String password,
      required String fullName,
      required String gender,
      required String confirmPassword}) async {
    //email, passsword, fullName, gender, confirmPassword

    const String apiUrl = 'http://localhost:5000/user/signup';

    try {
      final Map<String, String> headers = {
        'Content-Type': 'application/json',
      };

      final Map<String, String> body = {
        'email': email,
        'password': password,
        'fullName': fullName,
        'gender': gender,
        'confirmPassword': confirmPassword
      };

      final http.Response response = await http.post(
        Uri.parse(apiUrl),
        headers: headers,
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData =
            await jsonDecode(response.body);
        // Process the response data as needed
        print("pending");
        //print('FullName: ${responseData['result']['fullName'].toString()}');
        user = User(
          id: responseData['result']['_id'],
          fullName: responseData['result']['fullName'],
          password: responseData['result']['confirmPassword'],
          email: responseData['result']['email'],
          profileUrl: responseData['result']['profilUrl'] ??
              "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png",
        );
        pending = true;
        // authenticated = true;
        print("${user.toString()}");
        print(responseData);
      } else {
        //print(response.body.runtimeType);
        final Map<String, dynamic> responseBody =
            await json.decode(response.body);
        pending = false;
        errorMessage = responseBody['message'];
        print('Request failed with status: ${response.statusCode}');
        print('Response: ${response.body}');
      }
    } catch (error) {
      errorMessage = 'Something went wrong on our side.';
      authenticated = false;
      pending = false;
      print('Error occurred: $error');
    }

    notifyListeners();
  }

  Future<void> confirmOtp(String id, String otp) async {
    const String apiUrl = 'http://localhost:5000/user/verifyOtp';

    try {
      final Map<String, String> headers = {'Content-Type': 'application/json'};

      final Map<String, String> body = {
        'userId': id,
        'otp': otp,
      };

      final http.Response response = await http.post(
        Uri.parse(apiUrl),
        headers: headers,
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        if (response.body.toString() == "Code Pass Invalid") {
          otpVerified = false;
        } else {
          otpVerified = true;
        }
        print('success message: ${response.body}');
      } else {
        print(response.reasonPhrase);
        otpVerified = false;
        errorMessage = "Otp invalid";
        print('400 message: ${response.body}');
      }
    } catch (e) {
      errorMessage = "Something went wrong";
      otpVerified = false;
      print('Error occurred: $e');
    }
  }

  // Future<void> confirmOtp(String id, String otp) async {
  //   var headers = {'Content-Type': 'application/json'};
  //   var request =
  //       http.Request('POST', Uri.parse('http://localhost:5000/user/verifyOtp'));
  //   request.body = json.encode({"userId": id, "otp": otp});
  //   request.headers.addAll(headers);
  //   try {
  //     http.StreamedResponse response = await request.send();

  //     if (response.statusCode == 200) {
  //       otpVerified = true;
  //       print(await response.stream.bytesToString());
  //     } else {
  //       print(response.reasonPhrase);
  //       otpVerified = false;
  //       errorMessage = "Otp invalid";
  //       print(await response.stream.bytesToString());
  //     }
  //   } catch (e) {
  //     errorMessage = "Something went wrong";
  //     otpVerified = false;
  //   }
  // }

  void logout() {
    authenticated = false;

    _authModel = AuthModel(isLoggedIn: false, token: '');
    notifyListeners();
  }
}
