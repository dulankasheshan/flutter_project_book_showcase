import 'package:big_book/data/data_source/api_services.dart';
import 'package:big_book/domain/models/SimilarBookModel.dart';
import 'package:big_book/presentation/widgets/single_book_data_card/book_data_container.dart';
import 'package:big_book/presentation/widgets/single_book_data_card/similar_book_card.dart';
import 'package:flutter/material.dart';

import '../../domain/usecases/fetch_single_book_usecase.dart';
import '../bloc/single_book/single_book_store.dart';

class SingleBookDataScreen extends StatefulWidget {
  final SingleBookStore singleBookStore;
  final FetchSingleBookUsecase fetchSingleBookUsecase;

  SingleBookDataScreen({
    required this.singleBookStore,
    required this.fetchSingleBookUsecase,
    super.key,
  });

  @override
  State<SingleBookDataScreen> createState() => _SingleBookDataScreenState();
}

class _SingleBookDataScreenState extends State<SingleBookDataScreen> {
  final ApiServices apiServices = ApiServices();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //back button
          IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon: Icon(Icons.arrow_back)),
          
          Expanded(
            child: SingleChildScrollView(
                child: Column(
              children: [
            
            
            
                FutureBuilder(
                    future: apiServices
                        .fetchSingleBookData('/${widget.singleBookStore.bookId}'),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator.adaptive(),
                        );
                      } else {
                        if (snapshot.hasError) {
                          return Center(
                            child: Text('Error: ${snapshot.error}'),
                          );
                        } else if (snapshot.hasData) {
                          final bookData = snapshot.data!;
                          return BookDataContainer(
                            imageUrl: bookData.image,
                            bookName: bookData.title,
                            authorName: bookData.authors
                                .map((author) => author.name)
                                .join(', '),
                            rating: bookData.rating,
                            publishDate: bookData.publishDate.toString(),
                            numberOfPage: bookData.numberOfPages,
                            description: bookData.description,
                          );
                        } else {
                          return const Center(
                            child: Text('Have Some error!'),
                          );
                        }
                      }
                    }),
            
                const SizedBox(
                  height: 20,
                ),
                const Divider(),
                const SizedBox(
                  height: 10,
                ),
                //Similar books
                const Center(
                  child: Text(
                    'Similar books',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                ),
            
                //Similar book list
                const SizedBox(
                  height: 20,
                ),
                FutureBuilder(
                  future: apiServices
                      .fetchSimilarBook('/${widget.singleBookStore.bookId}/similar'),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator.adaptive(),
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text('${snapshot.error}'),
                      );
                    } else if (snapshot.hasData) {
                      final List<SimilarBookModel> similarBooks = snapshot.data!;
                      return SizedBox(
                        height: 300,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: similarBooks.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SimilarBookCard(
                                id: similarBooks[index].id,
                                bookImageUrl: similarBooks[index].image,
                                bookName: similarBooks[index].title,
                                subtitle: similarBooks[index].subtitle,
                                fetchSingleBookUsecase: widget.fetchSingleBookUsecase,
                              ),
                            );
                          },
                        ),
                      );
                    } else {
                      return const Center(
                        child: Text('Have some error!'),
                      );
                    }
                  },
                ),
              ],
            )),
          ),
        ],
      ),
    ));
  }
}
