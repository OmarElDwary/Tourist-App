import 'dart:convert';

class LandmarkModel {
  final String id;
  final String image;
  final String name;
  final String description;
  final String government;
  final double latitude;
  final double longitude;

  LandmarkModel({
    required this.id,
    required this.image,
    required this.name,
    required this.description,
    required this.government,
    required this.latitude,
    required this.longitude,
  });

  factory LandmarkModel.fromJson(Map<String, dynamic> json) {
    return LandmarkModel(
      id: json['id'].toString(),
      image: json['image'] ?? '',
      name: json['name'] ?? 'Unknown',
      description: json['description'] ?? 'No description available',
      government: json['government'] ?? 'Unknown',
      latitude: (json['latitude'] as num?)?.toDouble() ?? 0.0,
      longitude: (json['longitude'] as num?)?.toDouble() ?? 0.0,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'description': description,
      'government': government,
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  @override
  String toString() => jsonEncode(toJson());
}
