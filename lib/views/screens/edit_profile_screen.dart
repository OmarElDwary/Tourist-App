import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourist_app/views/blocs/profile/profile_bloc.dart';
import 'package:tourist_app/views/blocs/profile/profile_event.dart';
import 'package:tourist_app/views/blocs/profile/profile_state.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    // Dispatch the LoadProfile event to fetch profile data
    context.read<ProfileBloc>().add(LoadProfile());
  }

  File? imageFile;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.edit_profile),
      ),
      body: BlocConsumer<ProfileBloc, ProfileState>(
        listener: (context, state) {
          if (state is ProfileUpdated) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  content: Text(AppLocalizations.of(context)!
                      .profileUpdatedSuccessfully)),
            );
          } else if (state is ProfileError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.errorMessage)),
            );
          }
        },
        builder: (context, state) {
          // Pre-fill the form fields when the state is ProfileLoaded
          if (state is ProfileLoaded) {
            _fullNameController.text = state.name;
            _emailController.text = state.email;
            _passwordController.text = state.passwordHash;
          }
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        const SizedBox(height: 2),
                        Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundImage: state is ProfileLoaded
                                  ? (state.avatarUrl !=
                                          "assets/images/no_image.png"
                                      ? NetworkImage(state.avatarUrl)
                                      : AssetImage(state.avatarUrl)
                                          as ImageProvider)
                                  : AssetImage("assets/images/no_image.png")
                                      as ImageProvider,
                            ),
                            if (state is ProfileLoaded)
                              state.avatarUrl == "assets/images/no_image.png"
                                  ? IconButton(
                                      icon: Icon(Icons.add_a_photo),
                                      onPressed: () {
                                        // Upload image function
                                      },
                                    )
                                  : Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        IconButton(
                                          icon: Icon(Icons.delete),
                                          onPressed: () {
                                            context.read<ProfileBloc>().add(
                                                  UpdateProfile(
                                                    name: _fullNameController
                                                        .text,
                                                    email:
                                                        _emailController.text,
                                                    avatarUrl:
                                                        "assets/images/no_image.png",
                                                    passwordHash:
                                                        _passwordController
                                                            .text,
                                                    phone: state.phone,
                                                  ),
                                                );
                                          },
                                        ),
                                        IconButton(
                                          icon: Icon(Icons.edit),
                                          onPressed: () {
                                            // Change image function
                                          },
                                        ),
                                      ],
                                    ),
                          ],
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          style: TextStyle(color: Colors.black),
                          enableInteractiveSelection: true,
                          cursorColor: Theme.of(context).primaryColor,
                          decoration: InputDecoration(
                            hintStyle: const TextStyle(color: Colors.black),
                            label: Text(
                              AppLocalizations.of(context)!.fullName,
                              style: TextStyle(color: Colors.black),
                            ),
                            prefixIcon: Icon(Icons.person,
                                color: Theme.of(context)
                                    .primaryColor), // Add your prefix icon here
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                width: 3,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                width: 3,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                          controller: _fullNameController,
                          validator: (value) {
                            if (value != null && value.isEmpty) {
                              return AppLocalizations.of(context)!.enterName;
                            } else if (!isFirstCharacter(value!)) {
                              return AppLocalizations.of(context)!.firstCapital;
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          style: TextStyle(color: Colors.black),
                          enableInteractiveSelection: true,
                          cursorColor: Theme.of(context).primaryColor,
                          decoration: InputDecoration(
                            hintStyle: const TextStyle(color: Colors.black),
                            label: Text(
                              AppLocalizations.of(context)!.email,
                              style: TextStyle(color: Colors.black),
                            ),
                            prefixIcon: Icon(Icons.email,
                                color: Theme.of(context)
                                    .primaryColor), // Add your prefix icon here
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                width: 3,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                width: 3,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                          controller: _emailController,
                          validator: (value) {
                            if (value != null && value.isEmpty) {
                              return AppLocalizations.of(context)!.enterEmail;
                            } else if (!value!.contains('@')) {
                              return AppLocalizations.of(context)!.validEmail;
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          style: TextStyle(color: Colors.black),
                          enableInteractiveSelection: true,
                          cursorColor: Theme.of(context).primaryColor,
                          decoration: InputDecoration(
                            hintStyle: const TextStyle(color: Colors.black),
                            label: Text(
                              AppLocalizations.of(context)!.password,
                              style: TextStyle(color: Colors.black),
                            ),
                            prefixIcon: Icon(Icons.password,
                                color: Theme.of(context).primaryColor),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                width: 3,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                width: 3,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                          controller: _passwordController,
                          obscureText: true, // Hide the password input
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 40),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        context.read<ProfileBloc>().add(UpdateProfile(
                            name: _fullNameController.text,
                            email: _emailController.text,
                            avatarUrl: "assets/images/no_image.png",
                            passwordHash: _passwordController.text,
                            phone: ""));
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(150, 40),
                      padding: EdgeInsets.all(15),
                      backgroundColor: const Color.fromARGB(255, 137, 54, 3),
                      iconColor: const Color.fromARGB(255, 0, 0, 0),
                    ),
                    child: Text(
                      AppLocalizations.of(context)!.save,
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

  bool isFirstCharacter(String text) {
    return text.isNotEmpty && text[0] == text[0].toUpperCase();
  }
}
