import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:tourist_app/services/user_services.dart';
import 'package:tourist_app/views/blocs/profile/profile_bloc.dart';
import 'package:tourist_app/views/blocs/profile/profile_event.dart';
import 'package:tourist_app/views/blocs/profile/profile_state.dart';
import 'package:tourist_app/views/screens/edit_profile_screen.dart';
import 'package:tourist_app/views/widgets/list_tile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProfileBloc(Provider.of<UserService>(context, listen: false))
            ..add(LoadProfile()),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "S.of(context).profile_details",
            style: TextStyle(fontSize: 15),
          ),
        ),
        body: BlocBuilder<ProfileBloc, ProfileState>(
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
                    const SizedBox(height: 8),
                    listTileFunc("Full Name", state.name, Icon(Icons.person)),
                    const SizedBox(height: 2),
                    listTileFunc("Email", state.email, Icon(Icons.email)),
                    const SizedBox(height: 2),
                    listTileFunc("Password", "*******", Icon(Icons.password)),
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: ElevatedButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BlocProvider(
                                create: (context) => ProfileBloc(
                                  Provider.of<UserService>(context,
                                      listen: false),
                                ),
                                child: EditProfilePage(),
                              ),
                            ),
                          );
                        },
                        icon: Icon(Icons.edit),
                        label: Text(
                          "edit Profile",
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
