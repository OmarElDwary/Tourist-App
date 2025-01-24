import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourist_app/generated/l10n.dart';
import 'package:tourist_app/services/user_services.dart';
import 'package:tourist_app/views/blocs/profile/profile_bloc.dart';
import 'package:tourist_app/views/blocs/profile/profile_state.dart';
import 'package:tourist_app/views/blocs/profile/profile_event.dart';
import 'package:tourist_app/views/screens/edit_profile_screen.dart';
import 'package:tourist_app/views/widgets/list_tile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "S.of(context).profile_details",
          style: TextStyle(fontSize: 15),
        ),
      ),
      body: BlocProvider(
        create: (_) => ProfileBloc(UserService()),
        child: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            if (state is ProfileLoading) {
              return const Center(child: CircularProgressIndicator());
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
                      backgroundImage: AssetImage(state.avatarUrl),
                    ),
                    const SizedBox(height: 8),
                    listTileFunc("Full Name", state.name, Icon(Icons.person)),
                    const SizedBox(height: 2),
                    listTileFunc("Email", state.email, Icon(Icons.email)),
                    const SizedBox(height: 2),
                    listTileFunc("Password", "********", Icon(Icons.password)),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: ElevatedButton.icon(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EditProfilePage()));
                        },
                        icon: Icon(Icons.edit),
                        label: Text(
                          "S.of(context).edit_profile",
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
                    ),
                  ]),
                ),
              );
            } else if (state is ProfileError) {
              return Center(child: Text('Error: ${state.errorMessage}'));
            } else {
              // Default empty state
              return Center(child: Text('No data available'));
            }
          },
        ),
      ),
    );
  }
}
