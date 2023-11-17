import 'package:bookly_app/core/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/app_images.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            AppImages.logo,
            height: 20,
          ),
          IconButton(
            onPressed: () {
              GoRouter.of(context).push(AppRoutes.kSearchView);
            },
            icon: const Icon(Icons.search,size: 25,),
          ),
        ],
      ),
    );
  }
}