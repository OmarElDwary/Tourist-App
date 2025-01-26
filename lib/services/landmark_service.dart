import 'package:dio/dio.dart';
import 'package:tourist_app/models/landmark_model.dart';

class LandmarksService {
  LandmarksService({required this.dio});

  final Dio dio;
  final String baseUrl =
      'https://my-json-server.typicode.com/OmarElDwary/tourist-db/users';

  Future<List<LandmarkModel>> fetchLandmarks() async {
    try {
      Response response = await dio.get(baseUrl);
      if (response.statusCode == 200 && response.data != null) {
        List<dynamic> landmarksData = response.data['landmarks'];
        return landmarksData.map((landmarkData) {
          return LandmarkModel.fromJson(landmarkData);
        }).toList();
      } else {
        throw Exception('Failed to load landmarks');
      }
    } catch (e) {
      throw Exception('Failed to load landmarks: $e');
    }
  }
}
