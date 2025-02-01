import 'package:tourist_app/models/landmark_model_from_firestore.dart';

abstract class FavoriteLandmarksState {}

class FavoriteLandmarksInitial extends FavoriteLandmarksState {}

class FavoriteLandmarksUpdated extends FavoriteLandmarksState {
  final List<LandmarkModelFromFirestore> favoriteLandmarks;

  FavoriteLandmarksUpdated(List<LandmarkModelFromFirestore> favoriteLandmarks)
      : favoriteLandmarks = List.unmodifiable(favoriteLandmarks);
}
