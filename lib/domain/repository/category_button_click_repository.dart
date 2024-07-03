
import 'package:big_book/domain/models/CategortBookModel.dart';

abstract class CategoryButtonClickRepository{
  Future<List<CategortBookModel>> fetchThisCategoryBook(String endpoint);
}