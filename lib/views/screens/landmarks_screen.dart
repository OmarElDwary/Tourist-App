import 'package:flutter/material.dart';
import 'package:tourist_app/generated/l10n.dart';
import 'package:tourist_app/models/landmark_model.dart';
import 'package:tourist_app/views/widgets/landmarks_grid_view.dart';
import 'package:tourist_app/views/widgets/landmarks_list_view.dart';

class LandmarksScreen extends StatefulWidget {
  const LandmarksScreen({
    super.key,
    required this.landmarks,
  });

  final List<LandmarkModel> landmarks;

  @override
  State<LandmarksScreen> createState() => _LandmarksScreenState();
}

class _LandmarksScreenState extends State<LandmarksScreen> {
  List<Widget> tabs = [
    const LandmarksGridView(landmarks: landmarks),
    const LandmarksListView(landmarks: landmarks),
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
                text: "S.of(context).suggestedLandmarks",
              ),
              Tab(
                text: "S.of(context).popularLandmarks",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: tabs,
        ),
      ),
    );
  }
}
