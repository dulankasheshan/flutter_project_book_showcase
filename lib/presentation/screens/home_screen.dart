import 'package:flutter/material.dart';
import 'package:big_book/presentation/bloc/book_store.dart';
import 'package:big_book/presentation/widgets/home_screen/category_card.dart';
import 'package:big_book/domain/models/CategoryModel.dart';
import 'package:big_book/domain/usecases/fetch_single_book_usecase.dart';
import 'package:big_book/domain/usecases/fetch_this_category_book_usecase.dart';
import 'package:big_book/data/data_source/api_services.dart';
import 'package:big_book/data/repositories/single_book_fetch_repository_impl.dart';

import '../../data/repositories/book_fetch_repository_impl.dart';
import '../../domain/repository/single_book_repository.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final ApiServices apiServices;
  late final BookFetchRepositoryImpl repository;
  late final FetchThisCategoryBookUsecase fetchThisCategoryBookUsecase;
  late final BookStore bookStore;
  late final FetchSingleBookUsecase fetchSingleBookUsecase;
  late final SingleBookRepository singleBookRepository;

  @override
  void initState() {
    super.initState();
    apiServices = ApiServices();
    repository = BookFetchRepositoryImpl(apiServices);
    fetchThisCategoryBookUsecase = FetchThisCategoryBookUsecase(repository);
    bookStore = BookStore(fetchThisCategoryBookUsecase);
    singleBookRepository = SingleBookFetchRepositoryImpl(apiServices);
    fetchSingleBookUsecase = FetchSingleBookUsecase(singleBookRepository);
  }

  @override
  Widget build(BuildContext context) {
    final List<CategoryModel> categories = [
      CategoryModel(categoryName: 'Action', boxColor: Colors.red),
      CategoryModel(categoryName: 'Adventure', boxColor: Colors.blue),
      CategoryModel(categoryName: 'Anthropology', boxColor: Colors.green),
      CategoryModel(categoryName: 'Astronomy', boxColor: Colors.orange),
      CategoryModel(categoryName: 'Archaeology', boxColor: Colors.purple),
      CategoryModel(categoryName: 'Architecture', boxColor: Colors.teal),
      CategoryModel(categoryName: 'Art', boxColor: Colors.indigo),
      CategoryModel(categoryName: 'Aviation', boxColor: Colors.amber),
      CategoryModel(categoryName: 'Biography', boxColor: Colors.cyan),
      CategoryModel(categoryName: 'Biology', boxColor: Colors.deepOrange),
      CategoryModel(categoryName: 'Business', boxColor: Colors.lime),
      CategoryModel(categoryName: 'Chemistry', boxColor: Colors.brown),
      CategoryModel(categoryName: 'Children', boxColor: Colors.lightBlue),
      CategoryModel(categoryName: 'Classics', boxColor: Colors.deepPurple),
      CategoryModel(categoryName: 'Contemporary', boxColor: Colors.pink),
      CategoryModel(categoryName: 'Cookbook', boxColor: Colors.blueGrey),
      CategoryModel(categoryName: 'Crafts', boxColor: Colors.redAccent),
      CategoryModel(categoryName: 'Crime', boxColor: Colors.tealAccent),
      CategoryModel(
          categoryName: 'Dystopia', boxColor: Colors.deepOrangeAccent),
      CategoryModel(categoryName: 'Economics', boxColor: Colors.amber),
      CategoryModel(categoryName: 'Education', boxColor: Colors.lightGreen),
      CategoryModel(categoryName: 'Engineering', boxColor: Colors.indigoAccent),
      CategoryModel(categoryName: 'Environment', boxColor: Colors.greenAccent),
      CategoryModel(categoryName: 'Erotica', boxColor: Colors.purpleAccent),
      CategoryModel(categoryName: 'Essay', boxColor: Colors.deepPurpleAccent),
      CategoryModel(categoryName: 'Fairy Tales', boxColor: Colors.blueAccent),
      CategoryModel(categoryName: 'Fantasy', boxColor: Colors.red.shade900),
      CategoryModel(categoryName: 'Fashion', boxColor: Colors.blue.shade900),
      CategoryModel(categoryName: 'Feminism', boxColor: Colors.pink.shade900),
      CategoryModel(categoryName: 'Fiction', boxColor: Colors.green.shade900),
      CategoryModel(categoryName: 'Finance', boxColor: Colors.purple.shade900),
      CategoryModel(categoryName: 'Folklore', boxColor: Colors.orange.shade900),
      CategoryModel(categoryName: 'Food', boxColor: Colors.amber.shade900),
      CategoryModel(categoryName: 'Gaming', boxColor: Colors.cyan.shade900),
      CategoryModel(categoryName: 'Gardening', boxColor: Colors.teal.shade900),
      CategoryModel(
          categoryName: 'Geography', boxColor: Colors.indigo.shade900),
      CategoryModel(categoryName: 'Geology', boxColor: Colors.lime.shade900),
      CategoryModel(
          categoryName: 'Graphic Novel', boxColor: Colors.blueGrey.shade900),
      CategoryModel(categoryName: 'Health', boxColor: Colors.redAccent),
      CategoryModel(categoryName: 'Historical', boxColor: Colors.tealAccent),
      CategoryModel(
          categoryName: 'Historical Fiction',
          boxColor: Colors.deepOrangeAccent.shade700),
      CategoryModel(categoryName: 'History', boxColor: Colors.amberAccent),
      CategoryModel(
          categoryName: 'Horror', boxColor: Colors.lightGreen.shade900),
      CategoryModel(
          categoryName: 'How To', boxColor: Colors.indigoAccent.shade700),
      CategoryModel(
          categoryName: 'Humor', boxColor: Colors.greenAccent.shade700),
      CategoryModel(
          categoryName: 'Inspirational',
          boxColor: Colors.purpleAccent.shade700),
      CategoryModel(
          categoryName: 'Journalism',
          boxColor: Colors.deepPurpleAccent.shade700),
      CategoryModel(categoryName: 'Law', boxColor: Colors.blueAccent.shade700),
      CategoryModel(
          categoryName: 'Literary Fiction', boxColor: Colors.red.shade900),
      CategoryModel(categoryName: 'Literature', boxColor: Colors.blue.shade900),
      CategoryModel(
          categoryName: 'Magical Realism', boxColor: Colors.pink.shade900),
      CategoryModel(categoryName: 'Manga', boxColor: Colors.green.shade900),
      CategoryModel(
          categoryName: 'Martial Arts', boxColor: Colors.purple.shade900),
      CategoryModel(
          categoryName: 'Mathematics', boxColor: Colors.orange.shade900),
      CategoryModel(categoryName: 'Medicine', boxColor: Colors.amber.shade900),
      CategoryModel(categoryName: 'Medieval', boxColor: Colors.cyan.shade900),
      CategoryModel(categoryName: 'Memoir', boxColor: Colors.teal.shade900),
      CategoryModel(categoryName: 'Mystery', boxColor: Colors.indigo.shade900),
      CategoryModel(categoryName: 'Mythology', boxColor: Colors.lime.shade900),
      CategoryModel(categoryName: 'Nature', boxColor: Colors.blueGrey.shade900),
      CategoryModel(
          categoryName: 'Nonfiction', boxColor: Colors.redAccent.shade700),
      CategoryModel(
          categoryName: 'Novel', boxColor: Colors.tealAccent.shade700),
      CategoryModel(
          categoryName: 'Occult', boxColor: Colors.deepOrangeAccent.shade700),
      CategoryModel(
          categoryName: 'Paranormal', boxColor: Colors.amberAccent.shade700),
      CategoryModel(
          categoryName: 'Parenting', boxColor: Colors.lightGreen.shade900),
      CategoryModel(
          categoryName: 'Philosophy', boxColor: Colors.indigoAccent.shade700),
      CategoryModel(
          categoryName: 'Physics', boxColor: Colors.greenAccent.shade700),
      CategoryModel(
          categoryName: 'Picture Book', boxColor: Colors.purpleAccent.shade700),
      CategoryModel(
          categoryName: 'Poetry', boxColor: Colors.deepPurpleAccent.shade700),
      CategoryModel(
          categoryName: 'Politics', boxColor: Colors.blueAccent.shade700),
      CategoryModel(categoryName: 'Programming', boxColor: Colors.red.shade900),
      CategoryModel(categoryName: 'Psychology', boxColor: Colors.blue.shade900),
      CategoryModel(categoryName: 'Reference', boxColor: Colors.pink.shade900),
      CategoryModel(
          categoryName: 'Relationships', boxColor: Colors.green.shade900),
      CategoryModel(categoryName: 'Religion', boxColor: Colors.purple.shade900),
      CategoryModel(categoryName: 'Romance', boxColor: Colors.orange.shade900),
      CategoryModel(
          categoryName: 'Science and Technology',
          boxColor: Colors.amber.shade900),
      CategoryModel(
          categoryName: 'Science Fiction', boxColor: Colors.cyan.shade900),
      CategoryModel(categoryName: 'Self Help', boxColor: Colors.teal.shade900),
      CategoryModel(
          categoryName: 'Short Stories', boxColor: Colors.indigo.shade900),
      CategoryModel(categoryName: 'Society', boxColor: Colors.lime.shade900),
      CategoryModel(
          categoryName: 'Sociology', boxColor: Colors.blueGrey.shade900),
      CategoryModel(categoryName: 'Space', boxColor: Colors.redAccent.shade700),
      CategoryModel(
          categoryName: 'Spirituality', boxColor: Colors.tealAccent.shade700),
      CategoryModel(
          categoryName: 'Sports', boxColor: Colors.deepOrangeAccent.shade700),
      CategoryModel(
          categoryName: 'Text Book', boxColor: Colors.amberAccent.shade700),
      CategoryModel(
          categoryName: 'Thriller', boxColor: Colors.lightGreen.shade900),
      CategoryModel(
          categoryName: 'Travel', boxColor: Colors.indigoAccent.shade700),
      CategoryModel(
          categoryName: 'True Crime', boxColor: Colors.greenAccent.shade700),
      CategoryModel(
          categoryName: 'War', boxColor: Colors.purpleAccent.shade700),
      CategoryModel(
          categoryName: 'Writing', boxColor: Colors.deepPurpleAccent.shade700),
      CategoryModel(
          categoryName: 'Young Adult', boxColor: Colors.blueAccent.shade700),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.book,
                color: Colors.deepPurple,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'BigBook',
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    color: Colors.deepPurple,
                    fontSize: 25),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Row(
              children: [
                Text(
                  'Book Genres',
                  style:
                  TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Divider(
                      height: 2,
                      thickness: 2,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              children: List.generate(
                categories.length,
                    (index) {
                  return CategoryCard(
                    categoryName: categories[index].categoryName,
                    boxColor: categories[index].boxColor,
                    bookStore: bookStore,
                    fetchSingleBookUsecase: fetchSingleBookUsecase,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
