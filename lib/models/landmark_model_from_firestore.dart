import 'package:cloud_firestore/cloud_firestore.dart';

class LandmarkModelFromFirestore {
  final String? id;
  final String? name;
  final String? image;
  final String? government;
  final bool? isFavorite;
  final String? lat;
  final String? long;

  LandmarkModelFromFirestore({
    this.id,
    this.name,
    this.image,
    this.government,
    this.isFavorite,
    this.lat,
    this.long,
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
      isFavorite: data?['isFavorite'],
      lat: data?['lat'],
      long: data?['long'],
    );
  }
  Map<String, dynamic> toFirestore() {
    return {
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (image != null) 'image': image,
      if (government != null) 'government': government,
      if (isFavorite != null) 'isFavorite': isFavorite,
      if (lat != null) 'lat': lat,
      if (long != null) 'long': long,
    };
  }
}
