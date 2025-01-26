import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourist_app/generated/l10n.dart';
import 'package:tourist_app/models/landmark_model.dart';
import 'package:tourist_app/views/blocs/landmarks/landmarks_bloc.dart';
import 'package:tourist_app/views/blocs/landmarks/landmarks_state.dart';
import 'package:tourist_app/views/widgets/landmarks_grid_view.dart';
import 'package:tourist_app/views/widgets/landmarks_list_view.dart';

class LandmarksScreen extends StatefulWidget {
  const LandmarksScreen({
    super.key,
  });

  @override
  State<LandmarksScreen> createState() => _LandmarksScreenState();
}

class _LandmarksScreenState extends State<LandmarksScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LandmarksBloc, LandmarksState>(
      builder: (context, state) {
        if (state is LandmarksLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is LandmarksLoaded) {
          // Define the list of tabs
          List<Widget> tabs = [
            LandmarksGridView(landmarks: state.landmarks),
            LandmarksListView(landmarks: state.landmarks),
          ];

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
        } else if (state is LandmarksError) {
          return Center(child: Text("Error: ${state.message}"));
        } else {
          return const Center(child: Text('Unknown State'));
        }
      },
    );
  }
}
