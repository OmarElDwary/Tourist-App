import 'dart:convert';

class LandmarkModel {
  final String id;
  final String image;
  final String name;
  final String description;
  final String government;

  LandmarkModel({
    required this.id,
    required this.image,
    required this.name,
    required this.description,
    required this.government,
  });

  factory LandmarkModel.fromJson(Map<String, dynamic> json) {
    return LandmarkModel(
      id: json['id'],
      image: json['image'],
      name: json['name'],
      description: json['description'],
      government: json['government'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'description': description,
      'government': government,
    };
  }

  @override
  String toString() => jsonEncode(toJson());
}
