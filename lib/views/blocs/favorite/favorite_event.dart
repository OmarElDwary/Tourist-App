import 'package:tourist_app/models/landmark_model.dart';

abstract class FavoriteLandmarksEvent {}

class ToggleLandmarkFavoriteStatus extends FavoriteLandmarksEvent {
  final LandmarkModel landmark;

  ToggleLandmarkFavoriteStatus(this.landmark);
}
