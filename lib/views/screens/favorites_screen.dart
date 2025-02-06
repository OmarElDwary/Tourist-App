import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourist_app/views/blocs/favorite/favorite_bloc.dart';
import 'package:tourist_app/views/blocs/favorite/favorite_state.dart';
import 'package:tourist_app/views/widgets/landmark_card.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.favorites),
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
                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: LandmarkCard(
                    landMarkModel: favoriteLandmark,
                    isFavorite: true,
                  ),
                );
              },
            );
          } else if (state is FavoriteLandmarksInitial) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return const Center(child: Text("No favorites yet."));
          }
        },
      ),
    );
  }
}
