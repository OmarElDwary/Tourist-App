import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourist_app/generated/l10n.dart';
import 'package:tourist_app/models/landmark_model_from_firestore.dart';
import 'package:tourist_app/views/blocs/favorite/favorite_bloc.dart';
import 'package:tourist_app/views/blocs/favorite/favorite_event.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

class LandmarkCard extends StatelessWidget {
  final LandmarkModelFromFirestore landMarkModel;
  final bool isFavorite;

  const LandmarkCard({
    super.key,
    required this.landMarkModel,
    required this.isFavorite,
  });

  void _openGoogleMaps(double latitude, double longitude) async {
    final Uri url = Uri.parse(
        'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude');

    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      debugPrint('Could not launch $url');
    }
  }

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
                landMarkModel.image.toString(),
                width: MediaQuery.of(context).size.width * 8,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              landMarkModel.name.toString(),
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              landMarkModel.government.toString(),
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                              ? AppLocalizations.of(context)!
                                  .removed_from_favorites
                              : AppLocalizations.of(context)!
                                  .added_to_favorites,
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
                IconButton(
                  onPressed: () {
                    _openGoogleMaps(landMarkModel.latitude ?? 0,
                        landMarkModel.longitude ?? 0);
                  },
                  icon: const Icon(Icons.map, color: Colors.blue),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
