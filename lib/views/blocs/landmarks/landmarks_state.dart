import 'package:tourist_app/models/landmark_model.dart';

abstract class LandmarksState {}

class LandmarksLoading extends LandmarksState {}

class LandmarksLoaded extends LandmarksState {
  final List<LandmarkModel> landmarks;

  LandmarksLoaded(this.landmarks);
}

class LandmarksError extends LandmarksState {
  final String message;

  LandmarksError(this.message);
}
