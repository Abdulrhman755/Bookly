import 'package:bookly/Features/home/data/data_sources/home_local_data_source.dart';
import 'package:bookly/Features/home/data/repos/home_repo_impl.dart';
import 'package:bookly/Features/search/data/repos/search_repo_impl.dart';
import 'package:bookly/core/utils/api_service.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getit = GetIt.instance;

void setupServiceLocator() {
  getit.registerSingleton<ApiService>(ApiService(Dio()));
  getit.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      apiService: getit.get<ApiService>(),
      homeLocalDataSource: HomeLocalDataSourceImpl(),
    ),
  );
  getit.registerSingleton<SearchRepoImpl>(
    SearchRepoImpl(getit.get<ApiService>()),
  );
}
