/*

import 'package:flutter/material.dart';

import 'landmark_card.dart';

class LandmarksListView extends StatelessWidget {
  const LandmarksListView({
    super.key,
    required this.landmarks,
  });

  final List<LandmarkModel> landmarks;

  @override
  Widget build(BuildContext context) {
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
            ),
          );
        },
      ),
    );
  }
}
*/
