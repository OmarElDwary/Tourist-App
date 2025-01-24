import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tourist_app/generated/l10n.dart';

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
    getUserData();
  }

  //function to get user data
  Future<void> getUserData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _fullNameController.text = prefs.getString('Name') ?? '';
    _emailController.text = prefs.getString('Email') ?? '';
    _passwordController.text = prefs.getString('Password') ?? '';
  }

  //function to edit user data
  Future<void> editUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('Name', _fullNameController.text);
    await prefs.setString('Email', _emailController.text);
    await prefs.setString('Password', _passwordController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("S.of(context).edit_profile"),
      ),
      body: SingleChildScrollView(
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
                decoration: InputDecoration(labelText: "S.of(context).email"),
              ),
              TextField(
                controller: _passwordController,
                decoration:
                    InputDecoration(labelText: "S.of(context).password"),
                obscureText: true,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  await editUserData(); //update the user data
                  Navigator.pop(context, true); //return to the profile page
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
      ),
    );
  }
}
