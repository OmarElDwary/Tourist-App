import 'package:flutter/material.dart';

class LoginFooter extends StatelessWidget {
  final VoidCallback onSignUpPressed;

  const LoginFooter({super.key, required this.onSignUpPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("New Here?",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: MediaQuery.of(context).size.width * 0.045,
            )),
        TextButton(
          onPressed: onSignUpPressed,
          child: Text(
            "Sign UP",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: MediaQuery.of(context).size.width * 0.045,
            ),
          ),
        ),
      ],
    );
  }
}
