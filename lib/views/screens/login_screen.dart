import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourist_app/services/user_services.dart';
import 'package:tourist_app/views/blocs/auth/auth_bloc.dart';
import 'package:tourist_app/views/blocs/auth/auth_event.dart';
import 'package:tourist_app/views/blocs/auth/auth_state.dart';
import 'package:tourist_app/views/screens/signUp_screen.dart';
import 'package:tourist_app/views/screens/tabs_screen.dart';
import 'package:tourist_app/views/widgets/backgroundImage.dart';
import 'package:tourist_app/views/widgets/custom_button.dart';
import 'package:tourist_app/views/widgets/loginFooter.dart';
import 'package:tourist_app/views/widgets/loginForm.dart';
import 'package:tourist_app/views/widgets/custom_title.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isPasswordHidden = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordHidden = !_isPasswordHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) => AuthBloc(UserService()),
      child: Scaffold(
        body: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthAuthenticated) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(AppLocalizations.of(context)!.login_successful),
                  backgroundColor: Colors.green,
                ),
              );
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TabsScreen(),
                ),
              );
            } else if (state is AuthError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.errorMessage),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
          child: Stack(
            children: [
              const BackgroundImage(),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.01),
                child: ListView(
                  children: [
                    SizedBox(height: screenHeight * 0.2),
                    CustomTitle(title: AppLocalizations.of(context)!.login),
                    SizedBox(height: screenHeight * 0.05),
                    LoginForm(
                      emailController: _emailController,
                      passwordController: _passwordController,
                      formKey: _formKey,
                      hidePassword: _isPasswordHidden,
                      togglePassword: _togglePasswordVisibility,
                    ),
                    SizedBox(height: screenHeight * 0.07),
                    BlocBuilder<AuthBloc, AuthState>(
                      builder: (context, state) {
                        if (state is AuthLoading) {
                          return Center(child: CircularProgressIndicator());
                        }

                        return CustomButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              context.read<AuthBloc>().add(
                                    LoginRequested(
                                      _emailController.text,
                                      _passwordController.text,
                                    ),
                                  );
                            }
                          },
                          title: AppLocalizations.of(context)!.login,
                        );
                      },
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    LoginFooter(
                      onSignUpPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignUp(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
