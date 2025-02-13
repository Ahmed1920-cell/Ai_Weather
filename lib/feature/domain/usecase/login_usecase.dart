import 'package:ai_weather/feature/domain/repositry/AuthRepo.dart';

class LoginUsecase{
  AuthRepo authRepo;
  LoginUsecase(this.authRepo);
  Future excute(String email,String password)async{
    return await authRepo.login(email, password);
  }
}