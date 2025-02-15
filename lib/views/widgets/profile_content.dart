import 'package:flutter/material.dart';
import 'package:tourist_app/views/blocs/profile/profile_state.dart';
import 'package:tourist_app/views/screens/profile_screen.dart';
import 'package:tourist_app/views/widgets/edit_profile_button.dart';
import 'package:tourist_app/views/widgets/list_tile.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tourist_app/views/widgets/profile_photo.dart';

class ProfileContent extends StatelessWidget {
  final ProfileLoaded state;

  const ProfileContent({required this.state});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 10),
            ProfilePhoto(avatarUrl: state.avatarUrl),
            const SizedBox(height: 20),
            listTileFunc(AppLocalizations.of(context)!.fullName, state.name,
                Icon(Icons.person)),
            const SizedBox(height: 10),
            listTileFunc(AppLocalizations.of(context)!.email, state.email,
                Icon(Icons.email)),
            const SizedBox(height: 10),
            listTileFunc(AppLocalizations.of(context)!.password, "********",
                Icon(Icons.password)),
            SizedBox(height: 30),
            EditProfileButton(),
          ],
        ),
      ),
    );
  }
}
