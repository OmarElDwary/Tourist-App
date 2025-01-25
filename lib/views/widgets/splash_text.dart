import 'package:flutter/material.dart';

class SplashText extends StatelessWidget {
  const SplashText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "Tourist App",
      style: TextStyle(
        fontSize: 40,
        fontWeight: FontWeight.bold,
        color: Color(0xC00C0600),
      ),
    );
  }
}
