import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:tourist_app/services/user_services.dart';
import 'package:tourist_app/services/users_firebase_services.dart';
import 'package:tourist_app/views/blocs/auth/auth_bloc.dart';
import 'package:tourist_app/views/blocs/auth/auth_event.dart';
import 'package:tourist_app/views/blocs/profile/profile_bloc.dart';
import 'package:tourist_app/views/blocs/profile/profile_event.dart';
import 'package:tourist_app/views/blocs/profile/profile_state.dart';
import 'package:tourist_app/views/screens/edit_profile_screen.dart';
import 'package:tourist_app/views/screens/login_screen.dart';
import 'package:tourist_app/views/screens/settings_screen.dart';
import 'package:tourist_app/views/widgets/list_tile.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileBloc(
          Provider.of<UsersFirebaseServices>(context, listen: false))
        ..add(LoadProfile()),
      child: Scaffold(
        appBar: AppBar(
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
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ),
                );
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                        AppLocalizations.of(context)!.logoutSuccessMessage),
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
                    MaterialPageRoute(
                      builder: (context) => SettingsScreen(),
                    ));
              },
            )
          ],
        ),
        body: BlocConsumer<ProfileBloc, ProfileState>(
          listener: (context, state) {
            if (state is ProfileUpdated) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    content: Text(AppLocalizations.of(context)!
                        .profileUpdatedSuccessfully)),
              );
            }
          },
          builder: (context, state) {
            if (state is ProfileLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is ProfileLoaded) {
              return SingleChildScrollView(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  color: Colors.white,
                  padding: const EdgeInsets.all(16.0),
                  child: Column(children: [
                    const SizedBox(height: 2),
                    CircleAvatar(
                      radius: 30,
                      backgroundImage:
                          const AssetImage('assets/images/no_image.png'),
                    ),
                    const SizedBox(height: 30),
                    listTileFunc(AppLocalizations.of(context)!.fullName,
                        state.name, Icon(Icons.person)),
                    const SizedBox(height: 10),
                    listTileFunc(AppLocalizations.of(context)!.email,
                        state.email, Icon(Icons.email)),
                    const SizedBox(height: 10),
                    listTileFunc(AppLocalizations.of(context)!.password,
                        "*******", Icon(Icons.password)),
                    SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: ElevatedButton.icon(
                        onPressed: () async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BlocProvider.value(
                                value: context.read<ProfileBloc>(),
                                child: EditProfilePage(),
                              ),
                            ),
                          );
                          context.read<ProfileBloc>().add(LoadProfile());
                        },
                        icon: Icon(Icons.edit),
                        label: Text(
                          AppLocalizations.of(context)!.edit_profile,
                          style: TextStyle(color: Colors.black),
                        ),
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(150, 40),
                          padding: EdgeInsets.all(15),
                          backgroundColor:
                              const Color.fromARGB(255, 178, 62, 3),
                          iconColor: const Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                    )
                  ]),
                ),
              );
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
