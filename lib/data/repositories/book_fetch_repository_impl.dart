import 'package:big_book/data/data_source/api_services.dart';
import 'package:big_book/domain/models/CategortBookModel.dart';
import '../../../domain/repository/category_button_click_repository.dart';

class BookFetchRepositoryImpl implements CategoryButtonClickRepository {
  final ApiServices apiServices;

  BookFetchRepositoryImpl(this.apiServices);

  @override
  Future<List<CategortBookModel>> fetchThisCategoryBook(String endpoint) async {
    return await apiServices.fetchCategoryBookList(endpoint);
  }


}
