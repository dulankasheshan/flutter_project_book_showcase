import 'package:big_book/domain/models/SingleBookModel.dart';
import 'package:big_book/domain/repository/single_book_repository.dart';

class FetchSingleBookUsecase{
  final SingleBookRepository repository;

  FetchSingleBookUsecase(this.repository);

  Future<SingleBookModel> execute(String endpoint) async{
    return await repository.fetchSingleBook(endpoint);
  }
}