import 'package:dio/dio.dart';

class LandmarksService {
  LandmarksService({
    required this.dio,
  });

  final Dio dio;
  final String baseUrl =
      'https://tourist-app-75e56-default-rtdb.firebaseio.com/landmarks.json';

  Future<List<Map<String, dynamic>>> fetchLandmarks() async {
    try {
      Response response = await dio.get(baseUrl);
      if (response.statusCode == 200 && response.data != null) {
        Map<String, dynamic> data = Map<String, dynamic>.from(response.data);
        List<Map<String, dynamic>> landmarks = [];
        data.forEach((key, value) {
          landmarks.add({'id': key, ...Map<String, dynamic>.from(value)});
        });
        return landmarks;
      } else {
        throw Exception('Failed to load landmarks');
      }
    } catch (e) {
      throw Exception('Failed to load landmarks: $e');
    }
  }

  Future<void> addLandmark(Map<String, dynamic> landmark) async {
    try {
      Response response = await dio.post(
          'https://tourist-app-75e56-default-rtdb.firebaseio.com/landmarks.json',
          data: landmark);
      if (response.statusCode != 200) {
        throw Exception('Failed to add landmark');
      }
    } catch (e) {
      throw Exception('Failed to add landmark: $e');
    }
  }

  Future<void> deleteLandmark(String id) async {
    try {
      Response response = await dio.delete(
          'https://tourist-app-75e56-default-rtdb.firebaseio.com/landmarks/$id.json');
      if (response.statusCode != 200) {
        throw Exception('Failed to delete landmark');
      }
    } catch (e) {
      throw Exception('Failed to delete landmark: $e');
    }
  }

  Future<void> editLandmark(
      String id, Map<String, dynamic> updatedLandmark) async {
    try {
      Response response = await dio.put(
        'https://tourist-app-75e56-default-rtdb.firebaseio.com/landmarks/$id.json',
        data: updatedLandmark,
      );
      if (response.statusCode != 200) {
        throw Exception('Failed to edit landmark');
      }
    } catch (e) {
      throw Exception('Failed to edit landmark: $e');
    }
  }
}
