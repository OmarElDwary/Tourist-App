import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tourist_app/generated/l10n.dart';
import 'package:tourist_app/services/user_services.dart';
import 'package:tourist_app/views/blocs/profile/profile_bloc.dart';
import 'package:tourist_app/views/blocs/profile/profile_event.dart';
import 'package:tourist_app/views/blocs/profile/profile_state.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<ProfileBloc>().add(LoadProfile());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("S.of(context).edit_profile"),
      ),
      body: BlocConsumer<ProfileBloc, ProfileState>(
        listener: (context, state) {
          if (state is ProfileUpdated) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Profile Updated Successfully!")),
            );
          } else if (state is ProfileError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.errorMessage)),
            );
          }
        },
        builder: (context, state) {
          if (state is ProfileLoaded) {
            _fullNameController.text = state.name;
            _emailController.text = state.email;
          }
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextField(
                    controller: _fullNameController,
                    decoration:
                        InputDecoration(labelText: "S.of(context).fullName"),
                  ),
                  TextField(
                    controller: _emailController,
                    decoration:
                        InputDecoration(labelText: "S.of(context).email"),
                  ),
                  TextField(
                    controller: _passwordController,
                    decoration:
                        InputDecoration(labelText: "S.of(context).password"),
                    obscureText: true,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      context.read<ProfileBloc>().add(UpdateProfile(
                            name: _fullNameController.text,
                            email: _emailController.text,
                            avatarUrl: "assets/images/no_image.png",
                          ));
                    },
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(150, 40),
                        padding: EdgeInsets.all(15),
                        backgroundColor: const Color.fromARGB(255, 137, 54, 3),
                        iconColor: const Color.fromARGB(255, 0, 0, 0)),
                    child: Text(
                      "S.of(context).save",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
