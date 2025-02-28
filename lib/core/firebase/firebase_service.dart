import 'package:firebase_auth/firebase_auth.dart';

class FirebaseService{
  FirebaseAuth _auth;

  FirebaseService(this._auth);

  Future login(String email, String password) async{
    try {
      UserCredential credential = await _auth
          .signInWithEmailAndPassword(
          email: email, password: password);
      return credential.user!.email;
    }on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        throw Exception('Invalid email');
      }
      if (e.code == 'user-not-found') {
        throw Exception('Hi, User not found');
      } else if (e.code == 'wrong-password') {
        throw Exception( "Your password is not correct");
      }
      else{
        throw Exception("email and password are not correct");
      }
  }
  }
  Future sign_up(String email, String password) async{
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return credential.user!.email;
    }on FirebaseAuthException catch (e){
      if (e.code == 'invalid-email') {
        throw Exception('Invalid email');
      }
      if (e.code == 'email-already-in-use') {
        throw Exception('Hi, User not found');
      } else if (e.code == 'weak-password') {
        throw Exception ( "Your password is weak");
      }
      else{
        throw Exception("email and password are not correct");
      }
    }
  }



  Future sign_out() async {
    try{
      await _auth.signOut();
    }catch(e){
      throw Exception("Try Again");
    }
  }
  User? getUser()  {
      return _auth.currentUser;

      throw Exception("Try Again");

  }


}