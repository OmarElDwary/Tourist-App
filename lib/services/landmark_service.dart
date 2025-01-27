import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:tourist_app/models/landmark_model.dart';

class LandmarksService {
  LandmarksService({required this.dio});

  final Dio dio;
  final String baseUrl =
      'https://my-json-server.typicode.com/eldaaww/tourist-landmarks/landmarks';

  Future<List<LandmarkModel>> fetchLandmarks() async {
    try {
      Response response = await dio.get(baseUrl);

      debugPrint('Response received: ${response.data}');
      if (response.statusCode == 200 && response.data != null) {
        List<dynamic> landmarksData = response.data;
        final landmarksList = landmarksData
            .map((landmarkData) => LandmarkModel.fromJson(landmarkData))
            .toList();

        return landmarksList;
      } else {
        throw Exception('Failed to load landmarks');
      }
    } catch (e) {
      throw Exception('Failed to load landmarks: $e');
    }
  }
}
