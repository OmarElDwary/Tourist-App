import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourist_app/models/landmark_model_from_firestore.dart';
import 'package:tourist_app/services/landmark_firebase_services.dart';
import 'package:tourist_app/views/blocs/landmarks/landmarks_event.dart';
import 'package:tourist_app/views/blocs/landmarks/landmarks_state.dart';

class LandmarksBloc extends Bloc<LandmarksEvent, LandmarksState> {
  final LandmarkFirebaseServices landmarksService;

  LandmarksBloc({required this.landmarksService}) : super(LandmarksLoading()) {
    on<LoadLandmarks>(_onLoadLandmarks);
  }

  @override
  void onChange(Change<LandmarksState> change) {
    super.onChange(change);
    debugPrint('State changed: ${change.currentState} -> ${change.nextState}');
  }

  Future<void> _onLoadLandmarks(
      LoadLandmarks event, Emitter<LandmarksState> emit) async {
    try {
      debugPrint('fetching');
      emit(LandmarksLoading()); // Show loading state
      final List<LandmarkModelFromFirestore> landmarks =
          await landmarksService.getLandmarksFromFirebase();
      emit(LandmarksLoaded(landmarks)); // Show loaded landmarks
    } catch (e) {
      emit(LandmarksError("Failed to load landmarks")); // Show error state
    }
  }
}
