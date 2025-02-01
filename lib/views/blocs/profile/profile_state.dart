abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final String name;
  final String email;
  final String avatarUrl;
  final String phone;
  final String passwordHash;

  ProfileLoaded(
      {required this.name,
      required this.email,
      required this.avatarUrl,
      required this.phone,
      required this.passwordHash});
}

class ProfileUpdated extends ProfileState {
  final String name;
  final String email;
  final String avatarUrl;
  final String phone;
  final String passwordHash;

  ProfileUpdated(
      {required this.name,
      required this.email,
      required this.avatarUrl,
      required this.phone,
      required this.passwordHash});
}

class ProfileError extends ProfileState {
  final String errorMessage;

  ProfileError(this.errorMessage);
}
