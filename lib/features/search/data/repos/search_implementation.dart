import 'package:bookly_app/core/utils/api_services.dart';
import 'package:bookly_app/features/search/data/repos/search_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/failure/failures.dart';
import '../../../home/data/models/BookModel.dart';

class SearchImplementation implements SearchRepo
{

  final ApiService apiService;

  SearchImplementation(this.apiService);

  @override
  Future<Either<Failure, List<BookModel>>> fetchSearchedBooks(String searchedBook) async{

    try {
      var data = await apiService.get(
          endpoint:
          "volumes?Filtering=free-ebooks&q=$searchedBook&Sorting=relevance");
      List<BookModel> books = [];
      for (var item in data["items"]) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } on Exception catch (e) {
      if(e is DioException)
      {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure("Unexpected error ,please try again later"));

    }


  }



}