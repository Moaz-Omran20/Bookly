import 'package:bookly_app/features/search/presentation/view/widgets/book_item_listView.dart';
import 'package:bookly_app/features/search/presentation/view/widgets/search_text_field.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SearchTextField(),
          const SizedBox(height: 15,),
          const Text(
            "Search Result",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          BookItemListView(),
        ],
      ),
    );
  }
}
