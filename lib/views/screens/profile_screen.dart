import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourist_app/services/users_firebase_services.dart';
import 'package:tourist_app/views/blocs/profile/profile_bloc.dart';
import 'package:tourist_app/views/blocs/profile/profile_event.dart';
import 'package:tourist_app/views/blocs/profile/profile_state.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tourist_app/views/widgets/profile_appBar.dart';
import 'package:tourist_app/views/widgets/profile_content.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProfileBloc(userServiceFirestore: UsersFirebaseServices())
            ..add(LoadProfile()),
      child: Scaffold(
        appBar: ProfileAppBar(),
        body: BlocConsumer<ProfileBloc, ProfileState>(
          listener: (context, state) {
            if (state is ProfileUpdated) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                      AppLocalizations.of(context)!.profileUpdatedSuccessfully),
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is ProfileLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ProfileLoaded) {
              return ProfileContent(state: state);
            } else if (state is ProfileError) {
              return Center(child: Text(state.errorMessage));
            } else {
              return Center(child: Text('Unknown state'));
            }
          },
        ),
      ),
    );
  }
}
