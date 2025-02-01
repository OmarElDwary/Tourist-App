import 'package:cloud_firestore/cloud_firestore.dart';

class UserModelFromFirestore {
  final String? id;
  final String? name;
  final String? email;
  final String? phone;
  final String? image;
  final String? passwordHash;

  UserModelFromFirestore({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.image,
    this.passwordHash,
  });
  factory UserModelFromFirestore.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
  ) {
    final data = snapshot.data();
    return UserModelFromFirestore(
      id: snapshot.id,
      name: data?['name'],
      email: data?['email'],
      phone: data?['phone'],
      image: data?['image'],
      passwordHash: data?['passwordHash'],
    );
  }
  Map<String, dynamic> toFirestore() {
    return {
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (email != null) 'email': email,
      if (phone != null) 'phone': phone,
      if (image != null) 'image': image,
      if (passwordHash != null) 'passwordHash': passwordHash,
    };
  }
}
