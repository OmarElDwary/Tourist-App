import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:tourist_app/main.dart';
import 'package:tourist_app/services/landmark_service.dart';
import 'package:tourist_app/services/user_services.dart';
import 'package:tourist_app/services/users_firebase_services.dart';
import 'package:tourist_app/views/blocs/auth/auth_bloc.dart';
import 'package:tourist_app/views/blocs/landmarks/landmarks_bloc.dart';
import 'package:tourist_app/views/blocs/profile/profile_bloc.dart';
import 'package:tourist_app/views/blocs/profile/profile_event.dart';
import 'package:tourist_app/views/blocs/theme/theme_bloc.dart';
import 'package:tourist_app/views/cubits/changeLanguage/change_language_cubit.dart';

class AppProviders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dio = Dio();
    final landmarksService = LandmarksService(dio: dio);
    final usersFirebaseServices = UsersFirebaseServices();
    return MultiProvider(
      providers: [
        Provider(
          create: (context) => usersFirebaseServices,
        ),
        BlocProvider(
          create: (context) => AuthBloc(),
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
              ProfileBloc(context.read<UsersFirebaseServices>())
                ..add(LoadProfile()),
        ),
        BlocProvider(
          create: (context) =>
              LandmarksBloc(landmarksService: landmarksService),
        ),
      ],
      child: MyApp(),
    );
  }
}
