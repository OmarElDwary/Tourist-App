abstract class ProfileEvent {}

class LoadProfile extends ProfileEvent {}

class UpdateProfile extends ProfileEvent {
  final String name;
  final String email;
  final String avatarUrl;

  UpdateProfile({
    required this.name,
    required this.email,
    required this.avatarUrl,
  });
}
