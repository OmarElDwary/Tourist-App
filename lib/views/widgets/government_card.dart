/*


import 'package:flutter/material.dart';

class GovernmentCard extends StatefulWidget {
  const GovernmentCard({
    super.key,
    required this.government,
    required this.togglelanguage,
  });

  final LandmarkModel government;
  final void Function() togglelanguage;

  @override
  State<GovernmentCard> createState() => _GovernmentcardState();
}

class _GovernmentcardState extends State<GovernmentCard> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => GovernmentdetailsScreen(
                government: widget.government,
                togglelanguage: widget.togglelanguage,
              ),
            ),
          );
        },
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 7,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.25,
            width: MediaQuery.of(context).size.height * 0.8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage(widget.government.imgUrl),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  widget.government.title,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
*/
