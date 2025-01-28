import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourist_app/generated/l10n.dart';
import 'package:tourist_app/models/landmark_model.dart';
import 'package:tourist_app/views/blocs/favorite/favorite_bloc.dart';
import 'package:tourist_app/views/blocs/favorite/favorite_event.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LandmarkCard extends StatelessWidget {
  final LandmarkModel landMarkModel;
  final bool isFavorite;

  const LandmarkCard({
    super.key,
    required this.landMarkModel,
    required this.isFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Card(
        child: Column(
          children: [
            Expanded(
              child: Image.network(
                landMarkModel.image,
                width: MediaQuery.of(context).size.width * 8,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              landMarkModel.name,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              landMarkModel.government,
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
                          ? AppLocalizations.of(context)!.removed_from_favorites
                          : AppLocalizations.of(context)!.added_to_favorites,
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
  }
}
