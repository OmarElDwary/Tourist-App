import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignUpFooter extends StatelessWidget {
  final VoidCallback onLoginPressed;

  const SignUpFooter({super.key, required this.onLoginPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          AppLocalizations.of(context)!.alreadyHaveAccount,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: MediaQuery.of(context).size.width * 0.045,
          ),
        ),
        TextButton(
          onPressed: onLoginPressed,
          child: Text(
            AppLocalizations.of(context)!.login,
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
