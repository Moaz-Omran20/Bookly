import 'package:bookly_app/features/book_details/presentation/view/widgets/custom_books_action_text_button.dart';
import 'package:bookly_app/features/home/data/models/BookModel.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BooksAction extends StatelessWidget {
  final BookModel book;

  BooksAction(this.book);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomBooksActionTextButton(
            onPressed: () {},
            text: "Free",
            textColor: Colors.black,
            backgroundColor: Colors.white,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16), bottomLeft: Radius.circular(16))),
        CustomBooksActionTextButton(
            onPressed: () async {
              Uri uri = Uri.parse(book!.volumeInfo!.previewLink??"https://www.google.com");
              if (await canLaunchUrl(uri)) {
                await launchUrl(uri);
              } else {}
            },
            text: "Free preview",
            textColor: Colors.white,
            backgroundColor: const Color(0xFFEF8262),
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16))),
      ],
    );
  }
}
