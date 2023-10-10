import 'package:gym_shift/models/user.dart';

class AuthModel {
  bool isLoggedIn;
  String token;
  User? user;
  AuthModel({required this.isLoggedIn, required this.token});
}
