import 'package:ai_weather/core/firebase/firebase_service.dart';

abstract class BaseAuthDataRemote{
  Future login(String email,String password);
  Future register(String email,String password);
  Future sign_out();
}
class AuthDataRemote extends BaseAuthDataRemote{
  FirebaseService firebaseService;
  AuthDataRemote(this.firebaseService);
  @override
  Future login(String email, String password) async{
    return await firebaseService.login(email, password);
  }

  @override
  Future register(String email, String password) async{
    return await firebaseService.sign_up(email, password);
  }
Future sign_out() async{
  return await firebaseService.sign_out();
}
}