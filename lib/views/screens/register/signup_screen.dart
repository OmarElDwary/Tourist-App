import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tourist_app/views/blocs/auth/auth_bloc.dart';
import 'package:tourist_app/views/blocs/auth/auth_event.dart';
import 'package:tourist_app/views/blocs/auth/auth_state.dart';
import 'package:tourist_app/views/screens/login/login_screen.dart';
import 'package:tourist_app/views/screens/register/widgets/signUpFooter.dart';
import 'package:tourist_app/views/screens/register/widgets/signUpForm.dart';
import 'package:tourist_app/views/widgets/CustomButton.dart';
import 'package:tourist_app/views/widgets/CustomTitle.dart';
import 'package:tourist_app/views/widgets/backgroundImage.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool hiddenPassword = true;
  bool confirmPasswords = true;
  TextEditingController fullName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  final _formKey = GlobalKey<FormState>();

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
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthLoading) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(AppLocalizations.of(context)!.loading)),
          );
        } else if (state is AuthAuthenticated) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text(AppLocalizations.of(context)!.signUpSuccessful)),
          );
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen()),
          );
        } else if (state is AuthError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage)),
          );
        }
      },
      child: Scaffold(
        body: Stack(
          children: [
            const BackgroundImage(),
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.01),
                child: ListView(
                  children: [
                    SizedBox(height: screenHeight * 0.09),
                    CustomTitle(title: AppLocalizations.of(context)!.signUP),
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
                          context.read<AuthBloc>().add(
                                SignUpButtonPressed(
                                  email: email.text,
                                  password: password.text,
                                  fullName: fullName.text,
                                  phoneNumber: phoneNumber.text,
                                ),
                              );
                        }
                      },
                      title: AppLocalizations.of(context)!.signUP,
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
      ),
    );
  }
}
