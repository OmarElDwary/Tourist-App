import 'package:tourist_app/models/landmark_model_from_firestore.dart';

abstract class LandmarksState {}

class LandmarksLoading extends LandmarksState {}

class LandmarksLoaded extends LandmarksState {
  final List<LandmarkModelFromFirestore> landmarks;

  LandmarksLoaded(this.landmarks);
}

class LandmarksError extends LandmarksState {
  final String message;

  LandmarksError(this.message);
}
