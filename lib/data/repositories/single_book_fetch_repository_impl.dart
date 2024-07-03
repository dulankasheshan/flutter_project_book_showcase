import 'package:big_book/domain/repository/single_book_repository.dart';
import 'package:big_book/domain/models/SingleBookModel.dart';
import '../data_source/api_services.dart';

class SingleBookFetchRepositoryImpl implements SingleBookRepository {
  final ApiServices apiServices;

  SingleBookFetchRepositoryImpl(this.apiServices);

  @override
  Future<SingleBookModel> fetchSingleBook(String endpoint) async {
    try {
      final fetchedBookData = await apiServices.fetchSingleBookData(endpoint);
      return SingleBookModel.fromJson(fetchedBookData as Map<String, dynamic>);
    } catch (e) {
      throw Exception('Failed to fetch single book: $e');
    }
  }
}
