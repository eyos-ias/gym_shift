import 'package:flutter/material.dart';
import 'package:gym_shift/models/auth.dart';
import 'package:gym_shift/models/user.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthProvider extends ChangeNotifier {
  bool authenticated = false;
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
        print('FullName: ${responseData['result']['fullName'].toString()}');
        user = User(
            id: responseData['result']['_id'],
            fullName: responseData['result']['fullName'],
            password: responseData['result']['confirmPassword'],
            email: responseData['result']['email'],
            profileUrl: responseData['result']['profilUrl'] ??
                "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png",
            bmi: responseData['result']['bmi'],
            allergies: List<String>.from(responseData['result']['allergies']),
            workoutGoal: responseData['result']['workoutGoal']);

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
      authenticated = false;
      print('Error occurred: $error');
    }

    notifyListeners();
  }

  void logout() {
    user = null;
    _authModel = AuthModel(isLoggedIn: false, token: '');
    notifyListeners();
  }
}
