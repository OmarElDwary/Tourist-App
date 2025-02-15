import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourist_app/views/blocs/auth/auth_bloc.dart';
import 'package:tourist_app/views/blocs/auth/auth_event.dart';
import 'package:tourist_app/views/screens/login_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tourist_app/views/screens/settings_screen.dart';

class ProfileAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        AppLocalizations.of(context)!.profile_details,
        style: TextStyle(fontSize: 20),
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.logout),
          onPressed: () {
            context.read<AuthBloc>().add(SignOutEvent());
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => LoginScreen()),
            );
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content:
                    Text(AppLocalizations.of(context)!.logoutSuccessMessage),
                duration: Duration(seconds: 2),
              ),
            );
          },
        ),
        IconButton(
          icon: Icon(Icons.settings),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SettingsScreen()),
            );
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
