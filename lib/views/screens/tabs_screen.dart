import 'package:flutter/material.dart';
import 'package:tourist_app/generated/l10n.dart';
import 'package:tourist_app/views/screens/landmarks_screen.dart';
import 'package:tourist_app/views/screens/profile_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    int selectedPageIndex = 4;

    Widget activeScreen = ProfileScreen();
    Widget activePage() {
      if (selectedPageIndex == 0) {
        //activeScreen = LandmarksScreen();
      } else if (selectedPageIndex == 1) {
        //activeScreen = FavoritesScreen();
      } else if (selectedPageIndex == 2) {
        //activeScreen = GovernmentsScreen();
      } else {
        //activeScreen = ProfilesScreen();
      }
      return activeScreen;
    }

    return Scaffold(
      body: activePage(),
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
    );
  }
}
