import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/app_routes.dart';
import 'package:bookly_app/core/utils/service_locator.dart';
import 'package:bookly_app/features/home/data/repos/home_repo_implementation.dart';
import 'package:bookly_app/features/home/presentation/view_model/cubits/featured_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'features/home/presentation/view_model/cubits/newest_books_cubit/newest_books_cubit.dart';

class Bookly extends StatelessWidget {
  const Bookly({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              FeaturedBooksCubit(getIt.get<HomeImplementation>()),
        ),
        BlocProvider(
          create: (context) =>
              NewestBooksCubit(getIt.get<HomeImplementation>()),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRoutes.router,
        theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: kPrimaryColor,
            textTheme:
                GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme)),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
