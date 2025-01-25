import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourist_app/generated/l10n.dart';
import 'package:tourist_app/models/landmark_model.dart';
import 'package:tourist_app/views/blocs/favorite/favorite_bloc.dart';
import 'package:tourist_app/views/blocs/favorite/favorite_event.dart';
import 'package:tourist_app/views/blocs/favorite/favorite_state.dart';

class LandmarkCard extends StatelessWidget {
  final LandmarkModel landMarkModel;

  const LandmarkCard({
    super.key,
    required this.landMarkModel,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteLandmarksBloc, FavoriteLandmarksState>(
      builder: (context, state) {
        final isFavorite = state is FavoriteLandmarksUpdated &&
            state.favoriteLandmarks.contains(landMarkModel);

        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Card(
            child: Column(
              children: [
                Expanded(
                  child: Image.network(
                    landMarkModel.imgUrl,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  landMarkModel.title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                IconButton(
                  onPressed: () {
                    context.read<FavoriteLandmarksBloc>().add(
                          ToggleLandmarkFavoriteStatus(landMarkModel),
                        );

                    ScaffoldMessenger.of(context).clearSnackBars();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          isFavorite
                              ? "S.of(context).removedFromFavorites"
                              : "S.of(context).addedToFavorites",
                        ),
                      ),
                    );
                  },
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: Colors.teal,
                    key: ValueKey(isFavorite),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
