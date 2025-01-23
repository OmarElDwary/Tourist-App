class LandmarkModel {
  final String id;
  final String imgUrl;
  final String title;
  final String description;

  LandmarkModel({
    required this.id,
    required this.imgUrl,
    required this.title,
    required this.description,
  });

  factory LandmarkModel.fromJson(Map<String, dynamic> json) {
    return LandmarkModel(
      id: json['id'],
      imgUrl: json['imgUrl'],
      title: json['title'],
      description: json['description'],
    );
  }
}
