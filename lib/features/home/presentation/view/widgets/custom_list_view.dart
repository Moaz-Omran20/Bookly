import 'package:bookly_app/core/utils/app_routes.dart';
import 'package:bookly_app/features/home/presentation/view_model/cubits/featured_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../data/models/BookModel.dart';
import 'book_item.dart';

class CustomListView extends StatefulWidget {
  const CustomListView({super.key});

  @override
  State<CustomListView> createState() => _CustomListViewState();
}

class _CustomListViewState extends State<CustomListView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<FeaturedBooksCubit>(context).fetchFeaturedBooks();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .3,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: InkWell(
                    onTap: () {
                      GoRouter.of(context)
                          .push(AppRoutes.kBookDetailsView, extra: state.books[index]);
                    },
                    child: BookItem(
                        bookImageUrl: state
                            .books[index].volumeInfo!.imageLinks!.thumbnail!),
                  ),
                );
              },
              itemCount: state.books.length,
              scrollDirection: Axis.horizontal,
            ),
          );
        } else if (state is FeaturedBooksFailure) {
          return Text(state.errMessage);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
