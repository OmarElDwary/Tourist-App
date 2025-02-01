import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tourist_app/models/landmark_model_from_firestore.dart';

class LandmarkFirebaseServices {
  final _firestore = FirebaseFirestore.instance;

  Future<void> createLandmark(LandmarkModelFromFirestore landmark) async {
    try {
      await _firestore
          .collection('landmarks')
          .doc(landmark.id)
          .set(landmark.toFirestore());
    } catch (e) {
      throw Exception('Error creating user: $e');
    }
  }

  Future<List<LandmarkModelFromFirestore>> getLandmarksFromFirebase() async {
    try {
      List<LandmarkModelFromFirestore> landmarks = [];
      final querySnapshot = await _firestore.collection('landmarks').get();

      for (var doc in querySnapshot.docs) {
        landmarks.add(LandmarkModelFromFirestore.fromFirestore(doc));
      }

      return landmarks;
    } catch (e) {
      throw Exception('Error fetching landmarks: $e');
    }
  }
}
