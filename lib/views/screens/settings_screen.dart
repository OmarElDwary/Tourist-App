import 'package:flutter/material.dart';
import 'package:tourist_app/models/SettingsManager.dart';
import 'package:tourist_app/views/screens/profile_screen.dart';
import 'package:tourist_app/views/widgets/Factory%20Pattern.dart';
import 'package:tourist_app/views/widgets/language_switcher.dart';
import 'package:tourist_app/views/widgets/theme_switcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final SettingsManager settingsManager = SettingsManager();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.settings),
        leading: IconButton(
          onPressed: () => settingsManager.goToProfile(context),
          icon: Icon(Icons.arrow_back_outlined),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            WidgetFactory.createWidget('language'),
            const SizedBox(height: 40),
            WidgetFactory.createWidget('theme'),
          ],
        ),
      ),
    );
  }
}
