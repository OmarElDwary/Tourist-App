import 'package:flutter/material.dart';

class SignUpFooter extends StatelessWidget {
  final VoidCallback onLoginPressed;

  const SignUpFooter({required this.onLoginPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Already have an account?",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: MediaQuery.of(context).size.width * 0.045,
          ),
        ),
        TextButton(
          onPressed: onLoginPressed,
          child: Text(
            "Login",
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
