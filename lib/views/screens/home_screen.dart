import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourist_app/views/screens/settings_screen.dart';
import 'package:tourist_app/views/blocs/auth/auth_bloc.dart';
import 'package:tourist_app/views/blocs/auth/auth_event.dart';
import 'package:tourist_app/views/blocs/auth/auth_state.dart';
import 'package:tourist_app/views/screens/login_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthUnauthenticated) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen()),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(AppLocalizations.of(context)!.home),
          actions: [
            IconButton(
              icon: Icon(Icons.logout),
              onPressed: () {
                context.read<AuthBloc>().add(LogoutRequested());
              },
            ),
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SettingsScreen(),
                    ));
              },
            )
          ],
        ),
        body: Column(),
      ),
    );
  }
}
