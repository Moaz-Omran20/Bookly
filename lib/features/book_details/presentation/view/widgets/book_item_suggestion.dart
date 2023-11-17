import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_images.dart';

class BookItemSuggestion extends StatelessWidget {
  String similarBoxUrl;

  BookItemSuggestion(this.similarBoxUrl);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: CachedNetworkImage(
        width: MediaQuery.of(context).size.width * .2,
        imageUrl: similarBoxUrl,
        errorWidget: (context, url, error) => Image.asset(AppImages.errorImage),
      ),
    );
  }
}
