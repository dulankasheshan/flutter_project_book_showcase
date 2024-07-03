class CategortBookModel {
  late int id;
  late String title;
  late String image;

  CategortBookModel({
    required this.id,
    required this.title,
    required this.image,
  });

  factory CategortBookModel.fromJson(Map<String, dynamic> json) {
    return CategortBookModel(
      id: json['id'],
      title: json['title'],
      image: json['image'],
    );
  }
}
