import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/search/data/repos/search_repo.dart';
import 'package:meta/meta.dart';

import '../../../../home/data/models/BookModel.dart';

part 'searched_books_state.dart';

class SearchedBooksCubit extends Cubit<SearchedBooksState> {
  SearchedBooksCubit(this.searchRepo) : super(SearchedBooksInitial());

  final SearchRepo searchRepo;

  Future<void> fetchSearchedBooks(String searchedBooks) async {
    emit(SearchedBooksLoading());
    var result = await searchRepo.fetchSearchedBooks(searchedBooks);
    result.fold((failure) {
      emit(SearchedBooksFailure(failure.errMessage));
    }, (books) {
      emit(SearchedBooksSuccess(books));
    });
  }
}
