import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tourist_app/models/landmark_model_from_firestore.dart';
import 'package:tourist_app/models/user_model_from_firestore.dart';

class UsersFirebaseServices {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> createUser(UserModelFromFirestore user) async {
    try {
      await _firestore.collection('users').doc(user.id).set(user.toFirestore());
    } catch (e) {
      throw Exception('Error creating user: $e');
    }
  }

  Future<List<UserModelFromFirestore>> getUsersFromFirebase() async {
    try {
      List<UserModelFromFirestore> users = [];
      await _firestore.collection('users').get().then((event) {
        for (var doc in event.docs) {
          UserModelFromFirestore.fromFirestore(doc);
        }
      });
      return users;
    } catch (e) {
      throw Exception('Error fetching user: $e');
    }
  }

  Future<void> addToFavorites(String userId, String placeId) async {
    try {
      await _firestore.collection('users').doc(userId).update({
        'favoritePlaces': FieldValue.arrayUnion([placeId]),
      });
    } catch (e) {
      throw Exception('Error adding to favorites: $e');
    }
  }

  Future<void> removeFromFavorites(String userId, String placeId) async {
    try {
      await _firestore.collection('users').doc(userId).update({
        'favoritePlaces': FieldValue.arrayRemove([placeId]),
      });
    } catch (e) {
      throw Exception('Error removing from favorites: $e');
    }
  }

  Future<List<LandmarkModelFromFirestore>> getUserFavorites(
      String userId) async {
    try {
      final userDoc = await _firestore.collection('users').doc(userId).get();
      if (userDoc.exists && userDoc.data() != null) {
        List<String> favoritePlaceIds =
            List<String>.from(userDoc.data()!['favoritePlaces']);
        final landmarksSnapshot = await _firestore
            .collection('landmarks')
            .where(FieldPath.documentId, whereIn: favoritePlaceIds)
            .get();

        return landmarksSnapshot.docs
            .map((doc) => LandmarkModelFromFirestore.fromFirestore(doc))
            .toList();
      }
      return [];
    } catch (e) {
      throw Exception('Error fetching user favorites: $e');
    }
  }
}
