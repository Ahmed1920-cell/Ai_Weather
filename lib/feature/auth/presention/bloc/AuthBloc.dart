import 'package:ai_weather/feature/auth/domain/usecase/getUser_usecase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ai_weather/feature/auth/domain/usecase/login_usecase.dart';
import 'package:ai_weather/feature/auth/domain/usecase/signup_usecase.dart';
import 'package:ai_weather/feature/auth/presention/bloc/AuthState.dart';

import '../../domain/usecase/logout_usecase.dart';

class AuthCubit extends Cubit<AuthState>{
  LoginUsecase loginUsecase;
  SignupUsecase signupUsecase;
  LoginOutUsecase loginOutUsecase;
  GetUserUsecase getUserUsecase;
  AuthCubit( this.loginUsecase, this.signupUsecase,this.loginOutUsecase,this.getUserUsecase):super(AuthInitial());
User? getuser(){
  User? user=getUserUsecase.excute();
  if(user==null){
    emit(AuthInitial());
  }
  else{
    emit(AuthSucces(user.toString()));
  }
  return user;
}
  Future<void> login(String email, String password) async {
    try {
      emit(AuthLoading());
      final user = await loginUsecase.excute(email, password);
      if (user != null) {
        emit(AuthSucces(user.toString()));
      } else {
        emit(AuthError("Login failed"));
      }
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }
  Future<void> register(String email, String password) async {
    try {
      emit(AuthLoading());
      final user = await signupUsecase.excute(email, password);
      if (user != null) {
        emit(AuthSucces(user.toString()));
      } else {
        emit(AuthError("Sign up failed"));
      }
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> logout() async {
    try {
      print("logout");
      await loginOutUsecase.excute();
      print("logout");
        emit(AuthInitial());

    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }
  IconData prefix = Icons.visibility_off_outlined;
  bool isPasswordVisible = true;

  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    prefix =
    isPasswordVisible ? Icons.visibility_off_outlined : Icons.visibility_outlined;
    emit(AuthUpdate());
  }
}
