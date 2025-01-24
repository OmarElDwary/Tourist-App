import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourist_app/services/user_services.dart';
import 'package:tourist_app/views/blocs/auth/auth_bloc.dart';
import 'package:tourist_app/views/blocs/auth/auth_state.dart';
import 'package:tourist_app/views/blocs/theme/theme_bloc.dart';
import 'package:tourist_app/views/cubits/changeLanguage/change_language_cubit.dart';
import 'package:tourist_app/views/cubits/changeLanguage/change_language_state.dart';
import 'package:tourist_app/views/screens/home_screen.dart';
import 'package:tourist_app/views/screens/login_screen.dart';
import 'views/blocs/theme/theme_state.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(UserService()),
        ),
        BlocProvider(
          create: (context) => ThemeBloc(),
        ),
        BlocProvider(
          create: (context) => ChangeLanguageCubit(),
        ),
      ],
      child: const MyApp(),
    ),
  );
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
            home: BlocBuilder<AuthBloc, AuthState>(
              builder: (context, authState) {
                if (authState is AuthAuthenticated) {
                  return const HomeScreen();
                } else {
                  return const LoginScreen();
                }
              },
            ),
          );
        },
      );
    });
  }
}
