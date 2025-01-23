import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:tourist_app/generated/l10n.dart';
import 'package:tourist_app/views/widgets/list_tile.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String fullName = "";
  String email = "";
  String password = "";
  String hashedPassword = "";

  @override
  void initState() {
    super.initState();
    getUserData(); // Load user data from Shared Preferences
  }

  // Function to load user data from Shared Preferences
  Future<void> getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      fullName = prefs.getString('Name') ?? 'No Name'; // Get full name
      email = prefs.getString('Email') ?? ''; // Get email
      password = prefs.getString('Password') ?? ""; //get password
      hashedPassword = hashPassword(password); // Hashing password
    });
  }

  // Function to hash password
  String hashPassword(String password) {
    final bytes = utf8.encode(password);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "S.of(context).profile_details",
          style: TextStyle(fontSize: 15),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.white,
          padding: const EdgeInsets.all(16.0),
          child: Column(children: [
            const SizedBox(height: 2),
            CircleAvatar(
              radius: 30,
              backgroundImage: const AssetImage('assets/images/profile.png'),
            ),
            const SizedBox(height: 8),
            listTileFunc("Full Name", fullName, Icon(Icons.person)),
            const SizedBox(height: 2),
            listTileFunc("Email", email, Icon(Icons.email)),
            const SizedBox(height: 2),
            listTileFunc("Password", hashedPassword, Icon(Icons.password)),
            /*Padding(
              padding: const EdgeInsets.all(6.0),
              child: ElevatedButton.icon(
                onPressed: 
                
                () async {
                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditProfilePage(                      ),
                    ),
                  );
                  if (result == true) {
                    // Refresh user data when returning from EditProfilePage
                    getUserData();
                  }
                },
                icon: Icon(Icons.edit),
                label: Text(
                  S.of(context).edit_profile,
                  style: TextStyle(color: Colors.black),
                ),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(150, 40),
                  padding: EdgeInsets.all(15),
                  backgroundColor: const Color.fromARGB(255, 178, 62, 3),
                  iconColor: const Color.fromARGB(255, 0, 0, 0),
                ),
              ),
            ),*/
          ]),
        ),
      ),
    );
  }
}
