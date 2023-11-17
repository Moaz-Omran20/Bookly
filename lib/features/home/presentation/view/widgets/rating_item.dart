import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';

class RatingItem extends StatelessWidget {

  double rating;

  RatingItem({required this.rating});

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.star,
          color: Colors.yellow,
        ),
        Text(
        rating.toString(),
        style: AppStyles.titleMedium,
        ),
      ],
    );
  }
}
