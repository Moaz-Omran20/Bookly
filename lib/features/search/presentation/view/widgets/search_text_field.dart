import 'package:bookly_app/features/search/presentation/view_model/cubits/searched_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchTextField extends StatelessWidget {

  late String searchedBook;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: (value) {
        searchedBook = value;
        BlocProvider.of<SearchedBooksCubit>(context).fetchSearchedBooks(value);
      },
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.white),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(12),
        ),
        hintText: "Search",
        suffixIcon: IconButton(
          onPressed: () {
            BlocProvider.of<SearchedBooksCubit>(context).fetchSearchedBooks(searchedBook);
          },
          icon: const Icon(Icons.search),
        ),
      ),
    );
  }
}
