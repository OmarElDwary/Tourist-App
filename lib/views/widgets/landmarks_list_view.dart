import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourist_app/models/landmark_model.dart';
import 'package:tourist_app/views/blocs/favorite/favorite_bloc.dart';
import 'package:tourist_app/views/blocs/favorite/favorite_state.dart';
import 'package:tourist_app/views/widgets/landmark_card.dart';

class LandmarksListView extends StatelessWidget {
  const LandmarksListView({
    super.key,
    required this.landmarks,
  });

  final List<LandmarkModel> landmarks;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteLandmarksBloc, FavoriteLandmarksState>(
        builder: (context, state) {
      List<LandmarkModel> favoriteLandmarks = [];
      if (state is FavoriteLandmarksUpdated) {
        favoriteLandmarks = state.favoriteLandmarks;
      }
      return SizedBox(
        height: MediaQuery.of(context).size.height * 0.3,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemCount: landmarks.length,
          itemBuilder: (ctx, index) {
            var landmark = landmarks[index];
            return Padding(
              padding: const EdgeInsets.all(5.0),
              child: LandmarkCard(
                landMarkModel: landmark,
                isFavorite: favoriteLandmarks.contains(landmark),
              ),
            );
          },
        ),
      );
    });
  }
}
