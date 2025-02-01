import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourist_app/models/user_model_from_firestore.dart';
import 'package:tourist_app/views/blocs/auth/auth_event.dart';
import 'package:tourist_app/views/blocs/auth/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  AuthBloc() : super(AuthInitial()) {
    on<LoginButtonPressed>(_login);
    on<SignUpButtonPressed>(_signUp);
    on<SignOutEvent>(_signOut);
  }

  Future<void> _login(LoginButtonPressed event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );
      emit(AuthAuthenticated(userCredential.user!));
    } on FirebaseAuthException catch (e) {
      emit(AuthError(e.code));
    } catch (e) {
      emit(AuthError("An unexpected error occurred during login."));
    }
  }

  Future<void> _signUp(
      SignUpButtonPressed event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );

// Create a new user document in Firestore
      await _firestore.collection('users').doc(userCredential.user!.uid).set(
            UserModelFromFirestore(
              id: userCredential.user!.uid,
              name: event.fullName,
              email: event.email,
              phone: event.phoneNumber,
              passwordHash: event.password,
            ).toFirestore(),
          );

      emit(AuthAuthenticated(userCredential.user!));
    } on FirebaseAuthException catch (e) {
      emit(AuthError(e.code));
    } catch (e) {
      emit(AuthError("An unexpected error occurred during sign-up."));
    }
  }

  Future<void> _signOut(SignOutEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      await _auth.signOut();
      emit(AuthUnauthenticated());
    } catch (e) {
      emit(AuthError("An error occurred during sign-out: ${e.toString()}"));
    }
  }
}
