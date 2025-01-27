import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourist_app/models/landmark_model.dart';
import 'package:tourist_app/views/blocs/favorite/favorite_event.dart';
import 'package:tourist_app/views/blocs/favorite/favorite_state.dart';

class FavoriteLandmarksBloc
    extends Bloc<FavoriteLandmarksEvent, FavoriteLandmarksState> {
  FavoriteLandmarksBloc() : super(FavoriteLandmarksInitial()) {
    on<ToggleLandmarkFavoriteStatus>(_onToggleLandmarkFavoriteStatus);
  }

  void _onToggleLandmarkFavoriteStatus(ToggleLandmarkFavoriteStatus event,
      Emitter<FavoriteLandmarksState> emit) {
    final currentFavorites = state is FavoriteLandmarksUpdated
        ? (state as FavoriteLandmarksUpdated).favoriteLandmarks
        : <LandmarkModel>[];

    final updatedFavorites = List<LandmarkModel>.from(currentFavorites);

    if (updatedFavorites.contains(event.landmark)) {
      updatedFavorites.remove(event.landmark);
    } else {
      updatedFavorites.add(event.landmark);
    }

    emit(FavoriteLandmarksUpdated(updatedFavorites.toList()));
  }
}
