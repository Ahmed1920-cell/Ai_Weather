import 'package:ai_weather/feature/data/data%20source/AuthDataRemote.dart';
import 'package:ai_weather/feature/domain/repositry/AuthRepo.dart';

class AuthRepoImp extends AuthRepo{
  BaseAuthDataRemote baseAuthDataRemote;
  AuthRepoImp(this.baseAuthDataRemote);
  @override
  Future login(String email, String password) async{
    return await baseAuthDataRemote.login(email, password);
  }

  @override
  Future register(String email, String password) async{
    return await baseAuthDataRemote.register(email, password);
  }
  @override
  Future signout() async{
    return await baseAuthDataRemote.sign_out();
  }
}