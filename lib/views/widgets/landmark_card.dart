/*


import 'package:flutter/material.dart';
import 'package:tourist_app/generated/l10n.dart';

class LandmarkCard extends StatefulWidget {
  const LandmarkCard({
    super.key,
    required this.landMarkModel,
  });

  final LandmarkModel landMarkModel;

  @override
  State<LandmarkCard> createState() => _LandmarkCardState();
}

class _LandmarkCardState extends State<LandmarkCard> {
  bool isFavorite = false;
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
                widget.landMarkModel.imgUrl,
                fit: BoxFit.fitWidth,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              widget.landMarkModel.title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            IconButton(
              onPressed: () {
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(wasAdded
                        ? S.of(context).addedToFavorites
                        : S.of(context).removedFromFavorites),
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

*/
