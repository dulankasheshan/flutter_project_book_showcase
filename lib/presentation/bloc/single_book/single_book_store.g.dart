// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'single_book_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SingleBookStore on _SingleBookStore, Store {
  late final _$bookIdAtom =
      Atom(name: '_SingleBookStore.bookId', context: context);

  @override
  int get bookId {
    _$bookIdAtom.reportRead();
    return super.bookId;
  }

  bool _bookIdIsInitialized = false;

  @override
  set bookId(int value) {
    _$bookIdAtom.reportWrite(value, _bookIdIsInitialized ? super.bookId : null,
        () {
      super.bookId = value;
      _bookIdIsInitialized = true;
    });
  }

  late final _$_SingleBookStoreActionController =
      ActionController(name: '_SingleBookStore', context: context);

  @override
  void storeSelectBookId(int id) {
    final _$actionInfo = _$_SingleBookStoreActionController.startAction(
        name: '_SingleBookStore.storeSelectBookId');
    try {
      return super.storeSelectBookId(id);
    } finally {
      _$_SingleBookStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
bookId: ${bookId}
    ''';
  }
}
