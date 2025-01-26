import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourist_app/generated/l10n.dart';
import 'package:tourist_app/services/landmark_service.dart';
import 'package:tourist_app/views/blocs/landmarks/landmarks_bloc.dart';
import 'package:tourist_app/views/blocs/favorite/favorite_bloc.dart';
import 'package:tourist_app/views/screens/landmarks_screen.dart';
import 'package:tourist_app/views/screens/favorites_screen.dart';
import 'package:tourist_app/views/screens/profile_screen.dart';

class TabsScreen extends StatefulWidget {
  TabsScreen({super.key});
  final LandmarksService landmarksService = LandmarksService(dio: Dio());

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int selectedPageIndex = 0;

  Widget _buildActiveScreen() {
    switch (selectedPageIndex) {
      case 0:
        return LandmarksScreen();
      case 1:
        return FavoritesScreen();
      case 2:
        return ProfileScreen();
      default:
        return ProfileScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LandmarksBloc>(
          create: (context) =>
              LandmarksBloc(landmarksService: widget.landmarksService),
        ),
        BlocProvider<FavoriteLandmarksBloc>(
          create: (context) => FavoriteLandmarksBloc(),
        ),
      ],
      child: Scaffold(
        body: _buildActiveScreen(),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedPageIndex,
          selectedItemColor: Colors.teal,
          unselectedItemColor: Colors.black,
          selectedFontSize: 15,
          unselectedFontSize: 10,
          onTap: (index) => setState(() => selectedPageIndex = index),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "S.of(context).home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: "S.of(context).favorites",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.location_city),
              label: "S.of(context).governments",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "S.of(context).profile",
            ),
          ],
        ),
      ),
    );
  }
}
