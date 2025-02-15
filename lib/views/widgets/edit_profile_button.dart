import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourist_app/views/blocs/profile/profile_bloc.dart';
import 'package:tourist_app/views/blocs/profile/profile_event.dart';
import 'package:tourist_app/views/screens/edit_profile_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EditProfileButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: ElevatedButton.icon(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BlocProvider.value(
                value: context.read<ProfileBloc>(),
                child: EditProfilePage(),
              ),
            ),
          );

          if (result == true) {
            context.read<ProfileBloc>().add(LoadProfile());
          }
        },
        icon: Icon(Icons.edit),
        label: Text(
          AppLocalizations.of(context)!.edit_profile,
          style: TextStyle(color: Colors.black),
        ),
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(150, 40),
          padding: EdgeInsets.all(15),
          backgroundColor: const Color.fromARGB(255, 178, 62, 3),
          iconColor: const Color.fromARGB(255, 0, 0, 0),
        ),
      ),
    );
  }
}
