import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tourist_app/views/screens/home_screen.dart';
import 'package:tourist_app/views/screens/login_screen.dart';
import 'package:tourist_app/views/widgets/CustomButton.dart';
import 'package:tourist_app/views/widgets/backgroundImage.dart';
import 'package:tourist_app/views/widgets/loginTitle.dart';
import 'package:tourist_app/views/widgets/signUpForm.dart';
import 'package:tourist_app/views/widgets/signUpFooter.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool hiddenPassword = true;
  bool confirmPasswords = true;
  TextEditingController fullName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Future<void> _savedUserData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("Name", fullName.text);
    await prefs.setString("Email", email.text);
    await prefs.setString("Password", password.text);
    await prefs.setString("confirmPassword", confirmPassword.text);
    if (phoneNumber.text.isNotEmpty) {
      await prefs.setInt("Phone", int.parse(phoneNumber.text));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Phone number is empty!')),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('User data saved successfully!')),
    );
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LoginScreen(),
      ),
    );
  }

  void togglePassword() {
    setState(() {
      hiddenPassword = !hiddenPassword;
    });
  }

  void toggleConfirmPassword() {
    setState(() {
      confirmPasswords = !confirmPasswords;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundImage(),
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.01),
              child: ListView(
                children: [
                  SizedBox(height: screenHeight * 0.09),
                  CustomTitle(title: "Sign Up"),
                  SizedBox(height: screenHeight * 0.05),
                  SignUpForm(
                    formKey: _formKey,
                    fullNameController: fullName,
                    emailController: email,
                    passwordController: password,
                    confirmPasswordController: confirmPassword,
                    phoneNumberController: phoneNumber,
                    hiddenPassword: hiddenPassword,
                    confirmPasswords: confirmPasswords,
                    togglePassword: togglePassword,
                    toggleConfirmPassword: toggleConfirmPassword,
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  CustomButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _savedUserData();
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomeScreen()),
                        );
                      }
                    },
                    title: 'Sign UP',
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  SignUpFooter(
                    onLoginPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
