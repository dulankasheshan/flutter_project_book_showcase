import 'package:big_book/domain/models/CategortBookModel.dart';
import 'package:big_book/domain/usecases/fetch_this_category_book_usecase.dart';
import 'package:mobx/mobx.dart';
part 'book_store.g.dart';

class BookStore = _BookStore with _$BookStore;

abstract class _BookStore with Store {
  final FetchThisCategoryBookUsecase fetchThisCategoryBookUsecase;

  _BookStore(this.fetchThisCategoryBookUsecase);

  @observable
  String selectCategoryName = '';

  @observable
  late int bookId;

  @observable
  ObservableList<CategortBookModel> books = ObservableList<CategortBookModel>();

  @observable
  bool isLoading = false;

  @observable
  String errorMessage = '';

  @action
  void selectCategory(String name) {
    selectCategoryName = name;
  }

  @action
  void storeSelectBookId(int id) {
    bookId = id;
  }

  @action
  Future<void> fetchSelectCategoryBooks(String endpoint) async {
    isLoading = true;
    errorMessage = '';
    try {
      final fetchedBooks = await fetchThisCategoryBookUsecase.execute(endpoint);
      books = ObservableList.of(fetchedBooks);
    } catch (e) {
      errorMessage = 'Failed to fetch books';
    } finally {
      isLoading = false;
    }
  }
}
