import 'package:big_book/presentation/bloc/book_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../widgets/categories_list_screen/book_card.dart';
import '../../../domain/usecases/fetch_single_book_usecase.dart';

class CategoriesBookListScreen extends StatefulWidget {
  final BookStore bookStore;
  final FetchSingleBookUsecase fetchSingleBookUsecase;

  const CategoriesBookListScreen({
    required this.bookStore,
    required this.fetchSingleBookUsecase,
    Key? key,
  }) : super(key: key);

  @override
  State<CategoriesBookListScreen> createState() =>
      _CategoriesBookListScreenState();
}

class _CategoriesBookListScreenState extends State<CategoriesBookListScreen> {

  @override
  void initState() {
    super.initState();
    widget.bookStore.fetchSelectCategoryBooks(
        '/search-books?query=${widget.bookStore.selectCategoryName}');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(onPressed: (){
                    Navigator.pop(context);
                  }, icon: Icon(Icons.arrow_back)),

                  Observer(
                    builder: (_) {
                      return Center(
                        child: Text(
                          widget.bookStore.selectCategoryName,
                          style: const TextStyle(
                            color: Colors.deepPurple,
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      );
                    },
                  ),

                  //hide icon
                  Opacity(
                    opacity: 0,
                      child: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back))),

                ],
              ),
            ),

            // Book list
            Expanded(
              child: Observer(
                builder: (_) {
                  if (widget.bookStore.isLoading) {
                    return const Center(
                      child: CircularProgressIndicator.adaptive(),
                    );
                  } else if (widget.bookStore.errorMessage.isNotEmpty) {
                    return Center(
                      child: Text(widget.bookStore.errorMessage),
                    );
                  } else if (widget.bookStore.books.isEmpty) {
                    return const Center(
                      child: Text('No books found.'),
                    );
                  } else {
                    return GridView.count(
                      crossAxisCount: 2,
                      children: List.generate(
                        widget.bookStore.books.length,
                            (index) {
                          return BookCard(
                            id: widget.bookStore.books[index].id,
                            bookImageUrl: widget.bookStore.books[index].image,
                            bookName: widget.bookStore.books[index].title,
                            fetchSingleBookUsecase: widget.fetchSingleBookUsecase,
                          );
                        },
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
