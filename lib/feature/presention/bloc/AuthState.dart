
class AuthState {}

class AuthInitial extends AuthState {}
class AuthLoading extends AuthState {}
class AuthSucces extends AuthState {
  String username;
  AuthSucces(
      this.username
      );

}
class AuthError extends AuthState {

  String error;
  AuthError(
      this.error
      );
}