/*

import 'package:flutter/material.dart';
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
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: LandmarkCard(
              landMarkModel: landmark,
            ),
          );
        },
      ),
    );
  }
}
*/
