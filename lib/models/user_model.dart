class UserModel {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String image;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    this.image = "assets/images/no_images.png",
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'image': image,
    };
  }

  UserModel copyWith({int? id, String? name, String? email, String? phone}) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      image: image,
    );
  }
}
