abstract class AuthEvent {}

class LoginButtonPressed extends AuthEvent {
  final String email;
  final String password;

  LoginButtonPressed({required this.email, required this.password});
}

class SignUpButtonPressed extends AuthEvent {
  final String fullName;
  final String email;
  final String password;
  final String phoneNumber;

  SignUpButtonPressed({
    required this.fullName,
    required this.email,
    required this.password,
    required this.phoneNumber,
  });
}

class SignOutEvent extends AuthEvent {}
