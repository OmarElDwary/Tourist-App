import 'dart:convert';

class UserModel {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String image;
  String passwordHash;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    this.image = "assets/images/no_images.png",
    required this.passwordHash,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      image: json['image'] ?? "assets/images/no_images.png",
      passwordHash: json['passwordHash'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'image': image,
      'passwordHash': passwordHash,
    };
  }

  UserModel copyWith({
    int? id,
    String? name,
    String? email,
    String? phone,
    String? image,
    String? passwordHash,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      image: image ?? this.image,
      passwordHash: passwordHash ?? this.passwordHash,
    );
  }

  String userToString() => jsonEncode(toJson());

  factory UserModel.fromString(String source) {
    final json = jsonDecode(source) as Map<String, dynamic>;
    return UserModel.fromJson(json);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! UserModel) return false;
    return id == other.id &&
        name == other.name &&
        email == other.email &&
        phone == other.phone &&
        image == other.image;
  }

  @override
  int get hashCode {
    return Object.hash(id, name, email, phone, image);
  }
}
