import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourist_app/app_providers.dart';
import 'package:tourist_app/views/blocs/theme/theme_bloc.dart';
import 'package:tourist_app/views/blocs/theme/theme_state.dart';
import 'package:tourist_app/views/cubits/changeLanguage/change_language_cubit.dart';
import 'package:tourist_app/views/cubits/changeLanguage/change_language_state.dart';
import 'package:tourist_app/views/screens/splash_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(AppProviders());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangeLanguageCubit, ChangeLanguageState>(
      builder: (context, state) {
        return BlocBuilder<ThemeBloc, ThemeState>(
          builder: (context, themeState) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Tourist App',
              theme: themeState.themeData,
              locale: state.locale,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              home: SplashScreen(),
            );
          },
        );
      },
    );
  }
}
