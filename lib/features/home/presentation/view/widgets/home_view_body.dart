import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/presentation/view/widgets/best_seller_listview.dart';
import 'package:flutter/material.dart';
import 'custom_app_bar.dart';
import 'custom_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(12),
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomAppBar(),
                  CustomListView(),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      "Best seller",
                      style: AppStyles.titleMedium,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            BestSellerListView(),
          ],
        ),
      ),
    );
  }
}
