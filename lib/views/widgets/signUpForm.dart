import 'package:flutter/material.dart';
import 'package:tourist_app/views/widgets/customTextField.dart';

class SignUpForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController fullNameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final TextEditingController phoneNumberController;
  final bool hiddenPassword;
  final bool confirmPasswords;
  final VoidCallback togglePassword;
  final VoidCallback toggleConfirmPassword;

  const SignUpForm({
    required this.formKey,
    required this.fullNameController,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.phoneNumberController,
    required this.hiddenPassword,
    required this.confirmPasswords,
    required this.togglePassword,
    required this.toggleConfirmPassword,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          CustomTextFormField(
            prefixIcon: Icon(Icons.person),
            label: "Full Name",
            controller: fullNameController,
            validator: (value) {
              if (value != null && value.isEmpty) {
                return "Please enter your full name";
              } else if (!isFirstCharacter(value!)) {
                return "First character should be a letter";
              }
              return null;
            },
          ),
          SizedBox(height: 20),
          CustomTextFormField(
            prefixIcon: Icon(Icons.email),
            label: "Email",
            controller: emailController,
            validator: (value) {
              if (value != null && value.isEmpty) {
                return "Please enter your email";
              } else if (!value!.contains('@')) {
                return "Please enter a valid email address";
              }
              return null;
            },
          ),
          SizedBox(height: 20),
          CustomTextFormField(
            prefixIcon: Icon(Icons.lock),
            label: "Password",
            controller: passwordController,
            validator: (value) {
              if (value != null && value.isEmpty) {
                return "Please enter your password";
              } else if (value!.length < 6) {
                return "Password should be at least 6 characters long";
              }
              return null;
            },
            obscureText: hiddenPassword,
            suffixIcon: IconButton(
              onPressed: togglePassword,
              icon: Icon(
                  hiddenPassword ? Icons.visibility : Icons.visibility_off),
            ),
          ),
          SizedBox(height: 20),
          CustomTextFormField(
            prefixIcon: Icon(Icons.lock),
            label: "Confirm Password",
            controller: confirmPasswordController,
            validator: (value) {
              if (value != null && value.isEmpty) {
                return "Please enter your password";
              } else if (!isEqual(value!, passwordController.text)) {
                return "Passwords do not match";
              }
              return null;
            },
            obscureText: confirmPasswords,
            suffixIcon: IconButton(
              onPressed: toggleConfirmPassword,
              icon: Icon(
                  confirmPasswords ? Icons.visibility : Icons.visibility_off),
            ),
          ),
          SizedBox(height: 20),
          CustomTextFormField(
            label: "Phone Number",
            controller: phoneNumberController,
            isPhoneNumber: true,
          ),
        ],
      ),
    );
  }

  bool isFirstCharacter(String text) {
    return text.isNotEmpty && text[0] == text[0].toUpperCase();
  }

  bool isEqual(String pass, String confirm) {
    return pass == confirm;
  }
}
