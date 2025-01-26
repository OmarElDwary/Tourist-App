abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final String name;
  final String email;
  final String avatarUrl;

  ProfileLoaded(
      {required this.name, required this.email, required this.avatarUrl});
}

class ProfileUpdated extends ProfileState {
  final String name;
  final String email;
  final String avatarUrl;

  ProfileUpdated(
      {required this.name, required this.email, required this.avatarUrl});
}

class ProfileError extends ProfileState {
  final String errorMessage;

  ProfileError(this.errorMessage);
}
