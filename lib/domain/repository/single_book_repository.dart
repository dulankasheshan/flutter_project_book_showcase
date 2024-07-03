import 'package:big_book/domain/models/SingleBookModel.dart';

abstract class SingleBookRepository {
  Future<SingleBookModel> fetchSingleBook(String endpoint);
}
