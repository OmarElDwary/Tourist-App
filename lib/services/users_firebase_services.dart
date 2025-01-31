import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tourist_app/models/user_model.dart';

class UsersFirebaseServices {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> createUser(UserModel user) async {
    try {
      await _firestore
          .collection('users')
          .doc(user.id.toString())
          .set(user.toJson());
    } catch (e) {
      print('Error creating user: $e');
    }
  }

  Future<UserModel?> getUser(String id) async {
    try {
      final DocumentSnapshot documentSnapshot =
          await _firestore.collection('users').doc(id).get();
      if (documentSnapshot.exists) {
        return UserModel.fromJson(
            documentSnapshot.data() as Map<String, dynamic>);
      }
      return null;
    } catch (e) {
      print('Error fetching user: $e');
      return null;
    }
  }

  Future<void> addToFavorites(String userId, String placeId) async {
    try {
      await _firestore.collection('users').doc(userId).update({
        'favoritePlaces': FieldValue.arrayUnion([placeId]),
      });
    } catch (e) {
      print('Error adding to favorites: $e');
    }
  }

  Future<void> removeFromFavorites(String userId, String placeId) async {
    try {
      await _firestore.collection('users').doc(userId).update({
        'favoritePlaces': FieldValue.arrayRemove([placeId]),
      });
    } catch (e) {
      print('Error removing from favorites: $e');
    }
  }

  Future<List<String>> getUserFavorites(String userId) async {
    try {
      final userDoc = await _firestore.collection('users').doc(userId).get();
      if (userDoc.exists && userDoc.data() != null) {
        return List<String>.from(userDoc.data()!['favoritePlaces'] ?? []);
      }
      return [];
    } catch (e) {
      print('Error fetching user favorites: $e');
      return [];
    }
  }
}
