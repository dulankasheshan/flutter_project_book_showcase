class SingleBookModel {
  final int id;
  final String title;
  final String image;
  final String openLibraryId;
  final String isbn10;
  final String isbn13;
  final List<Author> authors;
  final double publishDate;
  final double numberOfPages;
  final String description;
  final double rating;

  SingleBookModel({
    required this.id,
    required this.title,
    required this.image,
    required this.openLibraryId,
    required this.isbn10,
    required this.isbn13,
    required this.authors,
    required this.publishDate,
    required this.numberOfPages,
    required this.description,
    required this.rating,
  });

  factory SingleBookModel.fromJson(Map<String, dynamic> json) {
    return SingleBookModel(
      id: json['id'],
      title: json['title'],
      image: json['image'],
      openLibraryId: json['identifiers']['open_library_id'],
      isbn10: json['identifiers']['isbn_10'],
      isbn13: json['identifiers']['isbn_13'],
      authors: (json['authors'] as List<dynamic>)
          .map((authorJson) => Author.fromJson(authorJson))
          .toList(),
      publishDate: json['publish_date'],
      numberOfPages: json['number_of_pages'],
      description: json['description'],
      rating: json['rating']['average'],
    );
  }
}

class Author {
  final int id;
  final String name;

  Author({required this.id, required this.name});

  factory Author.fromJson(Map<String, dynamic> json) {
    return Author(
      id: json['id'],
      name: json['name'],
    );
  }
}
