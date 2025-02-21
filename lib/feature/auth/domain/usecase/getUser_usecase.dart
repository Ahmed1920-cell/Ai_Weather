import 'package:ai_weather/feature/auth/domain/repositry/AuthRepo.dart';
import 'package:firebase_auth/firebase_auth.dart';

class GetUserUsecase{
  AuthRepo authRepo;
  GetUserUsecase(this.authRepo);
  User? excute(){
    return  authRepo.getuser();
  }
}