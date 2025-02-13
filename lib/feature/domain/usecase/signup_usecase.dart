import 'package:ai_weather/feature/domain/repositry/AuthRepo.dart';

class SignupUsecase{
  AuthRepo authRepo;
  SignupUsecase(this.authRepo);
  Future excute(String email,String password)async{
    return await authRepo.register(email, password);
  }
}