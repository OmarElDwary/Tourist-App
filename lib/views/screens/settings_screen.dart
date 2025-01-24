import 'package:flutter/material.dart';
import 'package:tourist_app/views/widgets/language_switcher.dart';
import 'package:tourist_app/views/widgets/theme_switcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.settings),
        ),
        body: Container(
            margin: const EdgeInsets.all(15),
            child: const Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  LanguageSwitcher(),
                  SizedBox(
                    height: 40,
                  ),
                  ThemeSwitcher(),
                ])));
  }
}
