import 'dart:ffi';

import 'package:bookly_app/features/home/data/models/BookModel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_images.dart';

class BookItem extends StatelessWidget {
  String bookImageUrl;

  BookItem({required this.bookImageUrl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: CachedNetworkImage(
        width: MediaQuery.of(context).size.width * .4,
        imageUrl: bookImageUrl,
        fit: BoxFit.fill,
        errorWidget: (context, url, error) {
          return Image.asset(AppImages.errorImage);
        },
      ),
    );
  }
}
