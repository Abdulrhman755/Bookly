import 'package:bookly/Features/home/data/repos/home_repo_impl.dart';
import 'package:bookly/Features/search/data/repos/search_repo_impl.dart';
import 'package:bookly/core/utils/api_service.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getit = GetIt.instance;

void setupServiceLocator() {
  getit.registerSingleton<HomeRepoImpl>(HomeRepoImpl(ApiService(Dio())));
  getit.registerSingleton<SearchRepoImpl>(SearchRepoImpl(ApiService(Dio())));
}
