import 'package:cloud_firestore/cloud_firestore.dart';

class LandmarkModelFromFirestore {
  final String? id;
  final String? name;
  final String? image;
  final String? government;
  final String? description;
  final bool? isFavorite;

  LandmarkModelFromFirestore({
    this.id,
    this.name,
    this.image,
    this.government,
    this.description,
    this.isFavorite,
  });
  factory LandmarkModelFromFirestore.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
  ) {
    final data = snapshot.data();
    return LandmarkModelFromFirestore(
      id: snapshot.id,
      name: data?['name'],
      image: data?['image'],
      government: data?['government'],
      description: data?['description'],
      isFavorite: data?['isFavorite'],
    );
  }
  Map<String, dynamic> toFirestore() {
    return {
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (image != null) 'image': image,
      if (government != null) 'government': government,
      if (description != null) 'description': description,
      if (isFavorite != null) 'isFavorite': isFavorite,
    };
  }
}
