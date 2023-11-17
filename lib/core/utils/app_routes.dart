import 'package:bookly_app/core/utils/service_locator.dart';
import 'package:bookly_app/features/book_details/presentation/view_model/cubits/similar_books_cubit.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:bookly_app/features/home/data/repos/home_repo_implementation.dart';
import 'package:bookly_app/features/home/presentation/view/home_view.dart';
import 'package:bookly_app/features/home/presentation/view/widgets/best_seller_item.dart';
import 'package:bookly_app/features/home/presentation/view/widgets/home_view_body.dart';
import 'package:bookly_app/features/search/presentation/view/search_view.dart';
import 'package:bookly_app/features/search/presentation/view_model/cubits/searched_books_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/book_details/presentation/view/book_details_view.dart';
import '../../features/home/data/models/BookModel.dart';
import '../../features/search/data/repos/search_implementation.dart';
import '../../features/splash/presentation/view/splash_view.dart';

abstract class AppRoutes {
  static const String kHomeView = '/homeView';
  static const String kBookDetailsView = '/bookDetailsView';
  static const String kSearchView = '/searchView';

  // GoRouter configuration
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: '/homeView',
        builder: (context, state) => const HomeViewBody(),
      ),
      GoRoute(
        path: '/bookDetailsView',
        builder: (context, state) =>
            BlocProvider(
                create: (context) =>
                    SimilarBooksCubit(getIt.get<HomeImplementation>()),
                child: BookDetailsView(state.extra as BookModel)),
      ),
      GoRoute(
        path: '/searchView',
        builder: (context, state) =>
            BlocProvider(
              create: (context) => SearchedBooksCubit(getIt.get<SearchImplementation>()),
              child: const SearchView(),
            ),
      ),
    ],
  );
}
