import 'package:tourist_app/models/landmark_model_from_firestore.dart';

abstract class FavoriteLandmarksEvent {}

class ToggleLandmarkFavoriteStatus extends FavoriteLandmarksEvent {
  final LandmarkModelFromFirestore landmark;

  ToggleLandmarkFavoriteStatus(this.landmark);
}

class LoadUserFavorites extends FavoriteLandmarksEvent {
  final String userId;

  LoadUserFavorites(this.userId);
}
