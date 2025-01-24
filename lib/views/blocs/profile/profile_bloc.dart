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
      final name = prefs.getString('Name');
      final email = prefs.getString('Email');

      //if (userData != null) {
      //final List<dynamic> userDataList = json.decode(userData);
      //final userDataMap = json.decode(userData) as Map<String, dynamic>;
      //final userDataMap = userDataList[0];

      emit(ProfileLoaded(
        name: name ?? '',
        email: email ?? '',
        avatarUrl: "assets/images/no_image.png",
      ));
      /*
      } else {
        emit(ProfileError('Failed to load profile: User data not found'));
      }
      */
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
