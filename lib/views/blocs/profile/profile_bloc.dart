import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tourist_app/services/user_services.dart';
import 'package:tourist_app/views/blocs/profile/profile_event.dart';
import 'package:tourist_app/views/blocs/profile/profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final UserService userService;

  ProfileBloc(this.userService) : super(ProfileInitial()) {
    on<LoadProfile>(_onLoadProfile);
    on<UpdateProfile>(_onUpdateProfile);
  }

  Future<void> _onLoadProfile(
      LoadProfile event, Emitter<ProfileState> emit) async {
    emit(ProfileLoading());
    try {
      final prefs = await SharedPreferences.getInstance();
      final userData = prefs.getString('usersData');
      if (userData != null) {
        final userDataMap = json.decode(userData) as Map<String, dynamic>;
        emit(ProfileLoaded(
          name: userDataMap['name'] ?? '',
          email: userDataMap['email'] ?? '',
          avatarUrl: userDataMap['image'] ?? "assets/images/no_image.png",
        ));
      } else {
        emit(ProfileError('Failed to load profile: User data not found'));
      }
    } catch (e) {
      emit(ProfileError('Failed to load profile: ${e.toString()}'));
    }
  }

  Future<void> _onUpdateProfile(
      UpdateProfile event, Emitter<ProfileState> emit) async {
    emit(ProfileLoading());
    try {
      final prefs = await SharedPreferences.getInstance();
      final updatedUserData = {
        'name': event.name,
        'email': event.email,
        'avatarUrl': event.avatarUrl,
      };
      await prefs.setString('user', jsonEncode(updatedUserData));

      emit(ProfileUpdated(
          name: event.name, email: event.email, avatarUrl: event.avatarUrl));
    } catch (e) {
      emit(ProfileError('Failed to update profile: ${e.toString()}'));
    }
  }
}
