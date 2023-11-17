import 'package:bookly_app/features/search/presentation/view_model/cubits/searched_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../home/presentation/view/widgets/best_seller_item.dart';

class BookItemListView extends StatelessWidget {
  List<double>ratings = [
    2,
    2.5,
    3,
    3.5,
    4,
    4.3,
    4.2,
    4.1,
    4.7,
    4.8,
    5,
    3.2,
    3.1,
    3.3,
    3.7,
    3.9,
    2.8,
    2.9
  ];

  BookItemListView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchedBooksCubit, SearchedBooksState>(
      builder: (context, state) {
        ratings.shuffle();
        if (state is SearchedBooksSuccess) {
          return Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: BestSellerItem(book: state.books[index], rating: ratings[index]),
                );
              },
              itemCount: state.books.length,
            ),
          );
        } else if (state is SearchedBooksFailure) {
          return const Center(child: Text("No Results"));
        }else if(state is SearchedBooksInitial)
          {
            return const Center(child: Text("No Results"));
          }
        else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
