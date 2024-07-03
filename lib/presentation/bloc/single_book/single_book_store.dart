import 'package:flutter/material.dart';
import 'package:big_book/domain/usecases/fetch_single_book_usecase.dart';
import 'package:mobx/mobx.dart';

import '../../../domain/models/SingleBookModel.dart';

part 'single_book_store.g.dart';

class SingleBookStore = _SingleBookStore with _$SingleBookStore;

abstract class _SingleBookStore with Store {
  final FetchSingleBookUsecase fetchSingleBookUsecase;

  _SingleBookStore(this.fetchSingleBookUsecase);

  @observable
  SingleBookModel? bookData; // Make it nullable or initialize properly

  @observable
  bool isLoading = false;

  @observable
  String errorMessage = '';

  @observable
  late int bookId;

  @action
  void storeSelectBookId(int id) {
    bookId = id;
  }

  @action
  Future<void> fetchSingleBookData(String endpoint) async {
    isLoading = true;
    errorMessage = '';
    try {
      final fetchedBookData = await fetchSingleBookUsecase.execute(endpoint);
      bookData = fetchedBookData as SingleBookModel?;
    } catch (e) {
      errorMessage = 'Failed to fetch book';
    } finally {
      isLoading = false;
    }
  }
}
