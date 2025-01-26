import 'package:tourist_app/models/landmark_model.dart';

abstract class FavoriteLandmarksState {}

class FavoriteLandmarksInitial extends FavoriteLandmarksState {}

class FavoriteLandmarksUpdated extends FavoriteLandmarksState {
  final List<LandmarkModel> favoriteLandmarks;

  FavoriteLandmarksUpdated(List<LandmarkModel> favoriteLandmarks)
      : favoriteLandmarks = List.unmodifiable(favoriteLandmarks);
}
