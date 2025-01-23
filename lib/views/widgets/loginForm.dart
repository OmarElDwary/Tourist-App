import 'package:flutter/material.dart';
import 'package:tourist_app/views/widgets/customTextField.dart';

class LoginForm extends StatefulWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> formKey;
  final bool hidePassword;
  final VoidCallback togglePassword;

  const LoginForm({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.formKey,
    required this.hidePassword,
    required this.togglePassword,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomTextFormField(
              label: "Email",
              controller: widget.emailController,
              keyboardType: TextInputType.emailAddress,
              prefixIcon: Icon(
                Icons.email,
                size: MediaQuery.of(context).size.width * 0.07,
                // color: Theme.of(context).primaryColor),
              ),
              validator: (text) {
                if (text == null ||
                    text.trim().isEmpty ||
                    !text.contains('@')) {
                  return "Please Enter Email";
                }
                return null;
              },
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            CustomTextFormField(
              label: "Password",
              controller: widget.passwordController,
              obscureText: widget.hidePassword,
              prefixIcon: Icon(
                Icons.lock,
                size: MediaQuery.of(context).size.width * 0.07,
                // color: Theme.of(context).primaryColor
              ),
              suffixIcon: IconButton(
                onPressed: widget.togglePassword,
                icon: Icon(
                  widget.hidePassword ? Icons.visibility_off : Icons.visibility,
                  size: MediaQuery.of(context).size.width * 0.06,
                  // color: Theme.of(context).primaryColor
                ),
              ),
              validator: (text) {
                if (text == null || text.trim().isEmpty) {
                  return "Please enter your password";
                }
                if (text.length < 6) {
                  return "Password should be at least 6 characters long";
                }
                return null;
              },
            ),
          ],
        ),
      ),
    );
  }
}
