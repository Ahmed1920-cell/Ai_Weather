import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ai_weather/feature/domain/usecase/login_usecase.dart';
import 'package:ai_weather/feature/domain/usecase/signup_usecase.dart';
import 'package:ai_weather/feature/presention/bloc/AuthState.dart';

import '../../domain/usecase/logout_usecase.dart';

class AuthCubit extends Cubit<AuthState>{
  LoginUsecase loginUsecase;
  SignupUsecase signupUsecase;
  LoginOutUsecase loginOutUsecase;
  AuthCubit( this.loginUsecase, this.signupUsecase,this.loginOutUsecase):super(AuthInitial());

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
      await loginOutUsecase.excute();
        emit(AuthInitial());

    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }
}
