import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourist_app/models/landmark_model.dart';
import 'package:tourist_app/views/blocs/favorite/favorite_bloc.dart';
import 'package:tourist_app/views/blocs/favorite/favorite_state.dart';
import 'package:tourist_app/views/widgets/landmark_card.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("S.of(context).favorites"),
        centerTitle: true,
      ),
      body: BlocBuilder<FavoriteLandmarksBloc, FavoriteLandmarksState>(
        builder: (context, state) {
          // Check the state for favorites
          if (state is FavoriteLandmarksUpdated) {
            final favoriteLandmarks = state.favoriteLandmarks;

            return ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: favoriteLandmarks.length,
              itemBuilder: (ctx, index) {
                var favoriteLandmark = favoriteLandmarks[index];

                // Pass isFavorite parameter to LandmarkCard
                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: LandmarkCard(
                    landMarkModel: favoriteLandmark,
                    isFavorite:
                        true, // Since these are the favorites, isFavorite is always true
                  ),
                );
              },
            );
          } else if (state is FavoriteLandmarksInitial) {
            // Show a loading indicator when there are no favorites
            return const Center(child: CircularProgressIndicator());
          } else {
            // Handle any unexpected states, show an empty screen for now
            return const Center(child: Text("No favorites yet."));
          }
        },
      ),
    );
  }
}
