import 'package:bookly_app/core/utils/app_images.dart';
import 'package:bookly_app/features/book_details/presentation/view/widgets/custom_appbar_book_details_screen.dart';
import 'package:bookly_app/features/book_details/presentation/view/widgets/suggestion_books_listview.dart';
import 'package:bookly_app/features/home/data/models/BookModel.dart';
import 'package:bookly_app/features/home/presentation/view/widgets/book_item.dart';
import 'package:bookly_app/features/home/presentation/view/widgets/rating_item.dart';
import 'package:flutter/material.dart';
import 'book_item_suggestion.dart';
import 'books_action.dart';

class BookDetailsViewBody extends StatefulWidget {
  BookModel bookModel;
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

  BookDetailsViewBody(this.bookModel);

  @override
  State<BookDetailsViewBody> createState() => _BookDetailsViewBodyState();
}

class _BookDetailsViewBodyState extends State<BookDetailsViewBody> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.ratings.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CustomAppBarBookDetailsScreen(),
                const SizedBox(height: 25),
                BookItem(
                    bookImageUrl:
                        widget.bookModel.volumeInfo?.imageLinks?.thumbnail.toString()??""),
                const SizedBox(
                  height: 40,
                ),
                Text(widget.bookModel.volumeInfo!.title.toString(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  "${widget.bookModel.volumeInfo?.authors??"Empty"}",
                  style: const TextStyle(fontSize: 16, color: Colors.grey),
                ),
                const SizedBox(
                  height: 14,
                ),
                RatingItem(rating: widget.ratings[0]),
                const SizedBox(
                  height: 25,
                ),
                 BooksAction(widget.bookModel),
                const SizedBox(
                  height: 49,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "You can also like ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                SuggestionBooksListView(),
              ],
            ),
          ),
        )
      ],
    );
  }
}
