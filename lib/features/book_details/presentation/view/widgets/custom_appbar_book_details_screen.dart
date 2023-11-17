import 'package:flutter/material.dart';

class CustomAppBarBookDetailsScreen extends StatelessWidget {
  const CustomAppBarBookDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon: const Icon(Icons.close)),
        IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_cart_outlined))
      ],
    );
  }
}
