abstract class AuthEvent {}

class LoginButtonPressed extends AuthEvent {
  final String email;
  final String password;

  LoginButtonPressed({required this.email, required this.password});
}

class SignUpButtonPressed extends AuthEvent {
  final String email;
  final String password;

  SignUpButtonPressed({required this.email, required this.password});
}

class SignOutEvent extends AuthEvent {}
