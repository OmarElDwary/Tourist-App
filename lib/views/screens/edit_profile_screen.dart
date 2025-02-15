import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tourist_app/views/blocs/profile/profile_bloc.dart';
import 'package:tourist_app/views/blocs/profile/profile_event.dart';
import 'package:tourist_app/views/blocs/profile/profile_state.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tourist_app/views/widgets/profile_avatar.dart';
import 'package:tourist_app/views/widgets/profile_text_field.dart';

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
  File? imgPath;
  final ImagePicker picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    context.read<ProfileBloc>().add(LoadProfile());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.edit_profile)),
      body: BlocConsumer<ProfileBloc, ProfileState>(
        listener: (context, state) {
          if (state is ProfileUpdated) {
            _showSnackbar(
                AppLocalizations.of(context)!.profileUpdatedSuccessfully);
          } else if (state is ProfileError) {
            _showSnackbar(state.errorMessage);
          }
        },
        builder: (context, state) {
          if (state is ProfileLoaded) {
            _fullNameController.text = state.name;
            _emailController.text = state.email;
            _passwordController.text = state.passwordHash;
            imgPath ??= File(state.avatarUrl);
          }
          return _buildProfileForm(context, state);
        },
      ),
    );
  }

  Widget _buildProfileForm(BuildContext context, ProfileState state) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Form(
            key: _formKey,
            child: Column(
              children: [
                ProfileAvatar(
                  imagePath: imgPath,
                  defaultImage: "assets/images/no_image.png",
                  onImageSelected: (file) => setState(() => imgPath = file),
                  onDelete: () {
                    context.read<ProfileBloc>().add(UpdateProfile(
                          name: _fullNameController.text,
                          email: _emailController.text,
                          avatarUrl: "assets/images/no_image.png",
                          passwordHash: _passwordController.text,
                          phone: (state as ProfileLoaded).phone,
                        ));
                    setState(() => imgPath = null);
                  },
                ),
                const SizedBox(height: 20),
                ProfileTextField(
                  controller: _fullNameController,
                  label: AppLocalizations.of(context)!.fullName,
                  icon: Icons.person,
                  validator: _validateFullName,
                ),
                const SizedBox(height: 20),
                ProfileTextField(
                  controller: _emailController,
                  label: AppLocalizations.of(context)!.email,
                  icon: Icons.email,
                  validator: _validateEmail,
                ),
                const SizedBox(height: 20),
                ProfileTextField(
                  controller: _passwordController,
                  label: AppLocalizations.of(context)!.password,
                  icon: Icons.password,
                  obscureText: true,
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                context.read<ProfileBloc>().add(UpdateProfile(
                      name: _fullNameController.text,
                      email: _emailController.text,
                      avatarUrl: imgPath?.path ?? "assets/images/no_image.png",
                      passwordHash: _passwordController.text,
                      phone: "",
                    ));
              }
            },
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(150, 40),
              backgroundColor: const Color.fromARGB(255, 137, 54, 3),
            ),
            child: Text(AppLocalizations.of(context)!.save,
                style: const TextStyle(color: Colors.black)),
          ),
        ],
      ),
    );
  }

  void _showSnackbar(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  String? _validateFullName(String? value) {
    if (value == null || value.isEmpty) {
      return AppLocalizations.of(context)!.enterName;
    } else if (value[0] != value[0].toUpperCase()) {
      return AppLocalizations.of(context)!.firstCapital;
    }
    return null;
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return AppLocalizations.of(context)!.enterEmail;
    } else if (!value.contains('@')) {
      return AppLocalizations.of(context)!.validEmail;
    }
    return null;
  }
}
