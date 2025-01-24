import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginFooter extends StatelessWidget {
  final VoidCallback onSignUpPressed;

  const LoginFooter({super.key, required this.onSignUpPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(AppLocalizations.of(context)!.new_here,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: MediaQuery.of(context).size.width * 0.045,
            )),
        TextButton(
          onPressed: onSignUpPressed,
          child: Text(
            AppLocalizations.of(context)!.sign_up,
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
