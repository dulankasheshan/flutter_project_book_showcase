import 'package:big_book/presentation/bloc/book_store.dart';
import 'package:big_book/presentation/screens/categories_book_list_screen.dart';
import 'package:flutter/material.dart';

import '../../../domain/usecases/fetch_single_book_usecase.dart';

class CategoryCard extends StatelessWidget {
  final String categoryName;
  final Color boxColor;
  final BookStore bookStore;
  final FetchSingleBookUsecase fetchSingleBookUsecase;


  CategoryCard({
    required this.categoryName,
    required this.boxColor,
    required this.bookStore,
    required this.fetchSingleBookUsecase,

    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: () {
          bookStore.selectCategory(categoryName);
          bookStore.fetchSelectCategoryBooks('/search-books?query=${bookStore.selectCategoryName}');
          Navigator.of(context).push(MaterialPageRoute(builder: (_) {
            return CategoriesBookListScreen(bookStore: bookStore,
              fetchSingleBookUsecase: fetchSingleBookUsecase,

            );
          }));
        },
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: boxColor,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Center(
              child: Text(
                textAlign: TextAlign.center,
                categoryName,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
