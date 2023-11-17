part of 'similar_books_cubit.dart';

@immutable
abstract class SimilarBooksState {}

class SimilarBooksInitial extends SimilarBooksState {}
class SimilarBooksSuccess extends SimilarBooksState {
  List<BookModel>books;

  SimilarBooksSuccess(this.books);
}
class SimilarBooksFailure extends SimilarBooksState {
  String errMessage;

  SimilarBooksFailure(this.errMessage);
}
class SimilarBooksLoading extends SimilarBooksState {}
