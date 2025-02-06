import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:tourist_app/models/user_model_from_firestore.dart';

import 'package:tourist_app/services/users_firebase_services.dart';

import 'package:tourist_app/views/blocs/profile/profile_event.dart';
import 'package:tourist_app/views/blocs/profile/profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final UsersFirebaseServices userServiceFirestore;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  ProfileBloc(this.userServiceFirestore) : super(ProfileInitial()) {
    on<LoadProfile>(_onLoadProfile);
    on<UpdateProfile>(_onUpdateProfile);
  }

  Future<void> _onLoadProfile(
      LoadProfile event, Emitter<ProfileState> emit) async {
    emit(ProfileLoading());
    try {
      final user = _auth.currentUser;
      if (user != null) {
        final userDoc = await userServiceFirestore.getUserByUID(user.uid);
        if (userDoc != null) {
          emit(ProfileLoaded(
            name: userDoc.name ?? '',
            email: userDoc.email ?? '',
            avatarUrl: userDoc.image?.isNotEmpty == true
                ? userDoc.image!
                : "assets/images/no_image.png",
            phone: userDoc.phone ?? '',
            passwordHash: userDoc.passwordHash ?? '',
          ));
        } else {
          emit(ProfileError('User not found'));
        }
      } else {
        emit(ProfileError('User not logged in'));
      }
    } catch (e) {
      emit(ProfileError('Failed to load profile: ${e.toString()}'));
    }
  }

  Future<void> _onUpdateProfile(
      UpdateProfile event, Emitter<ProfileState> emit) async {
    emit(ProfileLoading());
    try {
      final user = _auth.currentUser;
      if (user != null) {
        print('Updating user profile for UID: ${user.uid}');
        await userServiceFirestore.updateUser(
          UserModelFromFirestore(
            id: user.uid,
            name: event.name,
            email: event.email,
            image: event.avatarUrl,
            phone: event.phone,
            passwordHash: event.passwordHash,
          ),
        );
        emit(ProfileUpdated(
            name: event.name,
            email: event.email,
            avatarUrl: event.avatarUrl,
            phone: event.phone,
            passwordHash: event.passwordHash));
        emit(ProfileLoaded(
            name: event.name,
            email: event.email,
            avatarUrl: event.avatarUrl,
            phone: event.phone,
            passwordHash: event.passwordHash));
      } else {
        emit(ProfileError('User not logged in'));
      }
    } catch (e) {
      emit(ProfileError('Failed to update profile: ${e.toString()}'));
    }
  }
}
