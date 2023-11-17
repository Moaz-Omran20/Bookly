import 'package:bookly_app/core/utils/app_routes.dart';
import 'package:bookly_app/features/book_details/presentation/view_model/cubits/similar_books_cubit.dart';
import 'package:bookly_app/features/book_details/presentation/view_model/cubits/similar_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'book_item_suggestion.dart';

class SuggestionBooksListView extends StatelessWidget {
  const SuggestionBooksListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        if (state is SimilarBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .13,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: InkWell(
                    onTap: () {
                      GoRouter.of(context).push(AppRoutes.kBookDetailsView,
                          extra: state.books[index]);
                    },
                    child: BookItemSuggestion(state
                        .books[index].volumeInfo!.imageLinks!.thumbnail
                        .toString()),
                  ),
                );
              },
              itemCount: state.books.length,
            ),
          );
        } else if (State is SimilarBooksFailure) {
          return const Center(
              child: Text("UnExpected error , try again later"));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
