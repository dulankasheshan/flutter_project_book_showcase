import 'package:flutter/material.dart';
import '../../bloc/single_book/single_book_store.dart';
import '../../screens/single_book_data_screen.dart';
import '../../../domain/usecases/fetch_single_book_usecase.dart';

class BookCard extends StatelessWidget {
  final int id;
  final String bookImageUrl;
  final String bookName;
  final FetchSingleBookUsecase fetchSingleBookUsecase;

  BookCard({
    required this.id,
    required this.bookImageUrl,
    required this.bookName,
    required this.fetchSingleBookUsecase,
    Key? key,
  }) : super(key: key);

  late SingleBookStore singleBookStore =
      SingleBookStore(fetchSingleBookUsecase);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        singleBookStore.storeSelectBookId(id);
        Navigator.of(context).push(MaterialPageRoute(builder: (_) {
          return SingleBookDataScreen(
            singleBookStore: singleBookStore,
            fetchSingleBookUsecase: fetchSingleBookUsecase,
          );
        }));
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 150,
                width: 150,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    bookImageUrl,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: Text(
                  bookName,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
