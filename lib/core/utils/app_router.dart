import 'package:bookly/Features/home/presentation/views/book_details_view.dart';
import 'package:bookly/Features/home/presentation/views/home_view.dart';
import 'package:bookly/Features/search/presentation/views/search_view.dart';
import 'package:go_router/go_router.dart';
import 'package:bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly/Features/home/data/repos/home_repo_impl.dart';
import 'package:bookly/Features/home/presentation/manager/cubit/similar_books_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import '../../Features/Splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const String splashRoute = '/';
  static const String homeRoute = '/home';
  static const String bookDetailsRoute = '/bookDetails';
  static const String searchRoute = '/search';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: splashRoute,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(path: homeRoute, builder: (context, state) => const HomeView()),
      GoRoute(
        path: bookDetailsRoute,
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>;
          final bookModel = extra['book'] as BookModel;
          final heroTag = extra['heroTag'];
          return BlocProvider(
            create:
                (context) =>
                    SimilarBooksCubit(GetIt.instance.get<HomeRepoImpl>())
                      ..fetchSimilarBooks(
                        category:
                            bookModel.volumeInfo.categories?.first ??
                            'computer science',
                      ),
            child: BookDetailsView(bookModel: bookModel, heroTag: heroTag),
          );
        },
      ),
      GoRoute(
        path: searchRoute,
        builder: (context, state) => const SearchView(),
      ),
    ],
  );
}
