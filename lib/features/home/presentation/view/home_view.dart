import 'package:bookly_app/core/utils/app_images.dart';
import 'package:bookly_app/features/home/presentation/view/widgets/home_view_body.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HomeViewBody(),
    );
  }
}
