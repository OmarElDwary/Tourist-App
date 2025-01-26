import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:tourist_app/services/user_services.dart';
import 'package:tourist_app/views/blocs/landmarks/landmarks_bloc.dart';
import 'package:tourist_app/views/blocs/theme/theme_bloc.dart';
import 'package:tourist_app/views/blocs/theme/theme_state.dart';
import 'package:tourist_app/views/cubits/changeLanguage/change_language_cubit.dart';
import 'package:tourist_app/views/cubits/changeLanguage/change_language_state.dart';
import 'package:tourist_app/views/screens/splash_screen.dart';
import 'package:tourist_app/views/blocs/auth/auth_bloc.dart';
import 'package:tourist_app/views/screens/home_screen.dart';
import 'package:tourist_app/views/blocs/profile/profile_bloc.dart';
import 'package:tourist_app/views/blocs/profile/profile_event.dart';
import 'package:tourist_app/views/screens/login_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(AppProviders());
}

class AppProviders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(UserService()),
        ),
        Provider(
          create: (context) => UserService(),
        ),
        BlocProvider(
          create: (context) => ThemeBloc(),
        ),
        BlocProvider(
          create: (context) => ChangeLanguageCubit(),
        ),
        BlocProvider(
          create: (context) =>
          ProfileBloc(context.read<UserService>())..add(LoadProfile()),
        ),
      ],
      child: MyApp(),
    );
  }
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
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown),
                useMaterial3: true,
                inputDecorationTheme: const InputDecorationTheme(
                  errorStyle: TextStyle(fontWeight: FontWeight.bold),
                ),
                fontFamily: 'Lora',
              ),
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              home: SplashScreen(),
              routes: {
                '/login': (context) => LoginScreen(),
                '/home': (context) => HomeScreen(),
              },
            );
          },
        );
      },
    );
  }
}
