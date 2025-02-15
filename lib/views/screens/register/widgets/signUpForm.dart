import 'package:flutter/material.dart';
import 'package:tourist_app/views/widgets/customTextField.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
    super.key,
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
            label: AppLocalizations.of(context)!.fullName,
            controller: fullNameController,
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
          CustomTextFormField(
            prefixIcon: Icon(Icons.email),
            label: AppLocalizations.of(context)!.email,
            controller: emailController,
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
          CustomTextFormField(
            prefixIcon: Icon(Icons.lock),
            label: AppLocalizations.of(context)!.password,
            controller: passwordController,
            validator: (value) {
              if (value != null && value.isEmpty) {
                return AppLocalizations.of(context)!.enterPassword;
              } else if (value!.length < 6) {
                return AppLocalizations.of(context)!.validPassword;
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
            label: AppLocalizations.of(context)!.confirmPassword,
            controller: confirmPasswordController,
            validator: (value) {
              if (value != null && value.isEmpty) {
                return AppLocalizations.of(context)!.enterConfirmPassword;
              } else if (!isEqual(value!, passwordController.text)) {
                return AppLocalizations.of(context)!.passwordsMatch;
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
            label: AppLocalizations.of(context)!.phone,
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
