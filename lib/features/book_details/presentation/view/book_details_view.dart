import 'package:bookly_app/features/book_details/presentation/view/widgets/book_details_view_body.dart';
import 'package:bookly_app/features/book_details/presentation/view_model/cubits/similar_books_cubit.dart';
import 'package:bookly_app/features/home/data/models/BookModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetailsView extends StatefulWidget {
  final BookModel bookModel;

  const BookDetailsView(this.bookModel, {super.key});

  @override
  State<BookDetailsView> createState() => _BookDetailsViewState();
}

class _BookDetailsViewState extends State<BookDetailsView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<SimilarBooksCubit>(context)
        .fetchSimilarBooks();
  }

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: BookDetailsViewBody(widget.bookModel),
      ),
    );
  }
}
