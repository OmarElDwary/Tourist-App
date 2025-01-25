import 'package:flutter/material.dart';
import 'package:tourist_app/views/widgets/splash_text.dart';

class SplashBackground extends StatelessWidget {
  const SplashBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          'assets/images/mmm.jpg',
          fit: BoxFit.cover,
        ),
        const Center(
          child: SplashText(),
        ),
      ],
    );
  }
}
