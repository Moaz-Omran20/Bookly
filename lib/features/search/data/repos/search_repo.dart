import 'package:dartz/dartz.dart';

import '../../../../core/failure/failures.dart';
import '../../../home/data/models/BookModel.dart';

abstract class SearchRepo
{

  Future<Either<Failure,List<BookModel>>>fetchSearchedBooks(String searchedBook);


}