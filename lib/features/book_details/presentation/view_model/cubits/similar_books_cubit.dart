import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../../home/data/models/BookModel.dart';
import '../../../../home/data/repos/home_repo.dart';
part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this.homeRepo) : super(SimilarBooksInitial());
  final HomeRepo homeRepo;

  Future<void> fetchSimilarBooks() async {
    emit(SimilarBooksLoading());
    var result = await homeRepo.fetchSimilarBooks();
    result.fold((failure) {
      emit(SimilarBooksFailure(failure.errMessage));
    }, (books) {
      emit(SimilarBooksSuccess(books));
    });
  }
}
