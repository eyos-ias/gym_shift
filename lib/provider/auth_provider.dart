import 'package:flutter/material.dart';
import 'package:gym_shift/models/auth.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthProvider extends ChangeNotifier {
  AuthModel _authModel = AuthModel(isLoggedIn: false, token: '');

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
        print(responseData);
      } else {
        print('Request failed with status: ${response.statusCode}');
        print('Response: ${response.body}');
      }
    } catch (error) {
      print('Error occurred: $error');
    }
  }

  void logout() {
    _authModel = AuthModel(isLoggedIn: false, token: '');
    notifyListeners();
  }
}
