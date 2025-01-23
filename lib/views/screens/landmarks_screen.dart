/*

import 'package:flutter/material.dart';
import 'package:tourist_app/generated/l10n.dart';
import 'package:tourist_app/views/widgets/landmarks_grid_view.dart';
import 'package:tourist_app/views/widgets/landmarks_list_view.dart';

class LandmarksScreen extends StatefulWidget {
  const LandmarksScreen({super.key});

  @override
  State<LandmarksScreen> createState() => _LandmarksScreenState();
}

class _LandmarksScreenState extends State<LandmarksScreen> {
  List<Widget> tabs = [
    const LandmarksGridView(),
    const LandmarksListView(),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
          appBar: AppBar(
            title: Text(""),
            bottom: TabBar(
              labelColor: Colors.white,
              unselectedLabelColor: Colors.black,
              indicatorColor: Colors.black,
              tabs: [
                Tab(
                  text: S.of(context).suggestedPlaces,
                ),
                Tab(
                  text: S.of(context).popularPlaces,
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: tabs,
          )),
    );
  }
}
*/
