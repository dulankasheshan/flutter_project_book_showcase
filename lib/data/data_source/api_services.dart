import 'package:big_book/domain/models/CategortBookModel.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../domain/models/SimilarBookModel.dart';
import '../../domain/models/SingleBookModel.dart';

class ApiServices {
  final apiUrl = dotenv.env['API_URL'];
  final apiKey = dotenv.env['API_KEY'];

  late Dio _dio;

  ApiServices() {
    _dio = Dio(
      BaseOptions(
        baseUrl: apiUrl.toString(),
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 5),
        headers: {
          'Accept': 'application/json',
          'x-api-key': apiKey!,
        },
      ),
    );
  }

  //fetch book category using
  Future<List<CategortBookModel>> fetchCategoryBookList(String endpoint) async {
    try {
      final response = await _dio.get(endpoint);
      print('Endpoint: $endpoint');
      print('Status Code is: ${response.statusCode}');
      print('Fetch data: ${response.data}');

      if (response.statusCode == 200) {
        final List<dynamic> booksResponse = response.data['books'];
        print('List data: $booksResponse');

        List<CategortBookModel> books = [];

        booksResponse.forEach((bookList) {
          bookList.forEach((bookJson) {
            books.add(CategortBookModel.fromJson(bookJson));
          });
        });

        return books;
      } else {
        throw Exception(
            'Error Code: ${response.statusCode}\n Error Message: ${response.statusMessage}');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Error: $e');
    }
  }

  //fetch single book data
  Future<SingleBookModel> fetchSingleBookData(String endpoint) async {
    try {
      final response = await _dio.get(endpoint);
      if (response.statusCode == 200) {
        return SingleBookModel.fromJson(response.data);
      } else {
        throw Exception(
            'Error: ${response.statusCode} ${response.statusMessage}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<List<SimilarBookModel>> fetchSimilarBook(String endpoint) async {
    try {
      final response = await _dio.get(endpoint);
      if (response.statusCode == 200) {
        final List<dynamic> booksResponse = response.data['similar_books'];
        return booksResponse
            .map((bookJson) => SimilarBookModel.fromJson(bookJson))
            .toList();
      } else {
        throw Exception(
            'Error: ${response.statusCode} ${response.statusMessage}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
