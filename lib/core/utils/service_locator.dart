import 'package:bookly_app/features/home/data/repos/home_repo_implementation.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/search/data/repos/search_implementation.dart';
import 'api_services.dart';

final getIt = GetIt.instance;

void setUp() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<HomeImplementation>(
      HomeImplementation(getIt.get<ApiService>()));
  getIt.registerSingleton<SearchImplementation>(
      SearchImplementation(getIt.get<ApiService>()));
}
