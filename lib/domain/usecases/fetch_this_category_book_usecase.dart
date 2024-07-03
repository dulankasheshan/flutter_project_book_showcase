import 'package:big_book/domain/models/CategortBookModel.dart';
import 'package:big_book/domain/repository/category_button_click_repository.dart';

class FetchThisCategoryBookUsecase{
  final CategoryButtonClickRepository repository;

  FetchThisCategoryBookUsecase(this.repository);

  Future<List<CategortBookModel>> execute(String endpoint) async{
    return await repository.fetchThisCategoryBook(endpoint);
  }
}