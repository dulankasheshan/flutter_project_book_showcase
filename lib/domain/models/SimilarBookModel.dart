class SimilarBookModel {
  final int id;
  final String title;
  final String? subtitle;
  final String image;

  SimilarBookModel({
    required this.id,
    required this.title,
    this.subtitle,
    required this.image,
  });

  factory SimilarBookModel.fromJson(Map<String, dynamic> json) {
    return SimilarBookModel(
      id: json['id'],
      title: json['title'],
      subtitle: json['subtitle'],
      image: json['image'],
    );
  }
}
