import 'package:flutter/material.dart';
import 'package:tourist_app/models/landmark_model.dart';
import 'package:tourist_app/views/widgets/landmark_card.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key, required this.favoriteLandmarks});

  final List<LandmarkModel> favoriteLandmarks;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("S.of(context).favorites"),
        centerTitle: true,
      ),
      body: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: favoriteLandmarks.length,
        itemBuilder: (ctx, index) {
          var favoriteLandmark = favoriteLandmarks[index];
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: LandmarkCard(
              landMarkModel: favoriteLandmark,
            ),
          );
        },
      ),
    );
  }
}
