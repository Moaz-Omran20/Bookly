import 'package:bookly_app/core/utils/app_images.dart';
import 'package:bookly_app/core/utils/app_routes.dart';
import 'package:bookly_app/features/home/data/models/BookModel.dart';
import 'package:bookly_app/features/home/presentation/view/widgets/rating_item.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/styles.dart';

class BestSellerItem extends StatelessWidget {
  BookModel book;
  double rating;

  BestSellerItem({required this.book, required this.rating});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(context).push(AppRoutes.kBookDetailsView, extra: book);
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: CachedNetworkImage(
                width: MediaQuery.of(context).size.width * .27,
                fit: BoxFit.fill,
                imageUrl: book.volumeInfo?.imageLinks?.thumbnail??"",
                errorWidget: (context, url, error) => Image.asset(
                  AppImages.errorImage,
                  width: MediaQuery.of(context).size.width * .27,
                ),
              ),
            ),
            const SizedBox(
              width: 50,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .6,
                    child: Text(
                      book.volumeInfo?.title.toString() ?? "",
                      style: AppStyles.titleLarge,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    book.volumeInfo?.authors.toString() ?? "",
                    style: AppStyles.titlesmall.copyWith(color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  Row(
                    children: [
                      const Text(
                        "Free",
                        style: AppStyles.titleLarge,
                      ),
                      const Spacer(),
                      RatingItem(rating: rating),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
