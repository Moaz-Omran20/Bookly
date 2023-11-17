import 'package:bookly_app/features/home/presentation/view_model/cubits/newest_books_cubit/newest_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'best_seller_item.dart';

class BestSellerListView extends StatefulWidget {
  const BestSellerListView({Key? key}) : super(key: key);

  @override
  State<BestSellerListView> createState() => _BestSellerListViewState();
}

class _BestSellerListViewState extends State<BestSellerListView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<NewestBooksCubit>(context).fetchNewestBooks();
  }

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
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksSuccess) {
          ratings.shuffle();
          return SliverList(
            delegate: SliverChildBuilderDelegate(childCount: state.books.length,
                (context, index) {
              return  Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: BestSellerItem(
                  book: state.books[index],
                  rating:ratings[index],
                ),
              );
            }),
          );
        } else if (state is NewestBooksFailure) {
          return SliverToBoxAdapter(child: Text(state.errMessage));
        } else {
          return SliverToBoxAdapter(
              child: const Center(child: CircularProgressIndicator()));
        }
      },
    );
  }
}
