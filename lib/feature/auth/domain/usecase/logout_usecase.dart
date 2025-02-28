import 'package:ai_weather/feature/auth/domain/repositry/AuthRepo.dart';

class LoginOutUsecase{
  AuthRepo authRepo;
  LoginOutUsecase(this.authRepo);
  Future excute()async{
    return await authRepo.signout();
  }
}