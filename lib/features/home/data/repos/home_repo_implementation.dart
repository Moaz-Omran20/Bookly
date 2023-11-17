import 'package:bookly_app/core/failure/failures.dart';
import 'package:bookly_app/core/utils/api_services.dart';
import 'package:bookly_app/features/home/data/models/BookModel.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeImplementation implements HomeRepo {
  final ApiService apiService;

  HomeImplementation(this.apiService);

  @override
  Future<Either<Failure, List<BookModel>>> fetchNewestBooks() async {
    try {
      var data = await apiService.get(
          endpoint:
              "volumes?Filtering=free-ebooks&q=programming&Sorting=newest");
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

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() async{

    try {
      var data = await apiService.get(
          endpoint:
          "volumes?Filtering=free-ebooks&q=science&Sorting=relevance");
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

  @override
  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks() async{
    try {
      var data = await apiService.get(
          endpoint:
          "volumes?Filtering=free-ebooks&q=general&Sorting=relevance");
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
