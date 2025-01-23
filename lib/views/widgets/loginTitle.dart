import 'package:flutter/material.dart';

class CustomTitle extends StatelessWidget {
  String title;

  CustomTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: MediaQuery.of(context).size.width * 0.099,
        ),
      ),
    );
  }
}
