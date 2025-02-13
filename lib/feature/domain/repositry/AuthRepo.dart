abstract class AuthRepo{
  Future login(String email, String password);

  Future register(String email, String password);
  Future signout();
}