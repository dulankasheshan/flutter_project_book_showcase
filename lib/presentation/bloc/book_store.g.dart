// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BookStore on _BookStore, Store {
  late final _$selectCategoryNameAtom =
      Atom(name: '_BookStore.selectCategoryName', context: context);

  @override
  String get selectCategoryName {
    _$selectCategoryNameAtom.reportRead();
    return super.selectCategoryName;
  }

  @override
  set selectCategoryName(String value) {
    _$selectCategoryNameAtom.reportWrite(value, super.selectCategoryName, () {
      super.selectCategoryName = value;
    });
  }

  late final _$booksAtom = Atom(name: '_BookStore.books', context: context);

  @override
  ObservableList<CategortBookModel> get books {
    _$booksAtom.reportRead();
    return super.books;
  }

  @override
  set books(ObservableList<CategortBookModel> value) {
    _$booksAtom.reportWrite(value, super.books, () {
      super.books = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_BookStore.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: '_BookStore.errorMessage', context: context);

  @override
  String get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$fetchSelectCategoryBooksAsyncAction =
      AsyncAction('_BookStore.fetchSelectCategoryBooks', context: context);

  @override
  Future<void> fetchSelectCategoryBooks(String endpoint) {
    return _$fetchSelectCategoryBooksAsyncAction
        .run(() => super.fetchSelectCategoryBooks(endpoint));
  }

  late final _$_BookStoreActionController =
      ActionController(name: '_BookStore', context: context);

  @override
  void selectCategory(String name) {
    final _$actionInfo = _$_BookStoreActionController.startAction(
        name: '_BookStore.selectCategory');
    try {
      return super.selectCategory(name);
    } finally {
      _$_BookStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectCategoryName: ${selectCategoryName},
books: ${books},
isLoading: ${isLoading},
errorMessage: ${errorMessage}
    ''';
  }
}
