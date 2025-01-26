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
    final currentState = state is FavoriteLandmarksUpdated
        ? (state as FavoriteLandmarksUpdated).favoriteLandmarks
        : <LandmarkModel>[];

    final favoriteSet = currentState.toSet();
    final isExisting = favoriteSet.contains(event.landmark);

    if (isExisting) {
      favoriteSet.remove(event.landmark);
      favoriteSet.add(event.landmark);
    }

    emit(FavoriteLandmarksUpdated(favoriteSet.toList()));
  }
}
