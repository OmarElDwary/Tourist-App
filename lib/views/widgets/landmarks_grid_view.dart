import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourist_app/models/landmark_model.dart';
import 'package:tourist_app/views/blocs/favorite/favorite_bloc.dart';
import 'package:tourist_app/views/blocs/favorite/favorite_state.dart';
import 'package:tourist_app/views/widgets/landmark_card.dart';

class LandmarksGridView extends StatelessWidget {
  const LandmarksGridView({
    super.key,
    required this.landmarks,
  });

  final List<LandmarkModel> landmarks;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          childAspectRatio: 0.9,
        ),
        itemCount: landmarks.length,
        itemBuilder: (ctx, index) {
          var landmark = landmarks[index];

          return BlocBuilder<FavoriteLandmarksBloc, FavoriteLandmarksState>(
            builder: (context, state) {
              final isFavorite = state is FavoriteLandmarksUpdated &&
                  state.favoriteLandmarks.contains(landmark);

              return Padding(
                padding: const EdgeInsets.all(5.0),
                child: LandmarkCard(
                  landMarkModel: landmark,
                  isFavorite: isFavorite, // Pass the isFavorite value here
                ),
              );
            },
          );
        },
      ),
    );
  }
}
