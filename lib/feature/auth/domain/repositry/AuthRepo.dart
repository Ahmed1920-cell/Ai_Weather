import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepo{
  Future login(String email, String password);

  Future register(String email, String password);
  Future signout();
  User? getuser();
}