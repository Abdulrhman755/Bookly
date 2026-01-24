import 'package:bookly/Features/home/data/data_sources/home_local_data_source.dart';
import 'package:bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly/Features/home/data/repos/home_repo.dart';
import 'package:bookly/constants.dart';
import 'package:bookly/core/errors/failures.dart';
import 'package:bookly/core/utils/api_service.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;
  final HomeLocalDataSource homeLocalDataSource;

  HomeRepoImpl({required this.apiService, required this.homeLocalDataSource});

  @override
  Future<Either<Failure, List<BookModel>>> fetchNewestBooks({
    int pageNumber = 0,
    String category = 'Computer Science',
  }) async {
    try {
      var data = await apiService.get(
        endpoint:
            'volumes?Filtering=free-ebooks&orderBy=newest&q=$category&startIndex=${pageNumber * 10}',
      );
      List<BookModel> books = [];
      if (data['items'] != null) {
        for (var item in data['items']) {
          books.add(BookModel.fromJson(item));
        }
      }
      if (pageNumber == 0) {
        if (books.isNotEmpty) {
          homeLocalDataSource.clearBox(kNewestBox);
          homeLocalDataSource.saveBooks(books, kNewestBox);
        } else {
          // Fallback to cache if API returns empty list for first page
          List<BookModel> booksList = homeLocalDataSource.fetchNewestBooks();
          if (booksList.isNotEmpty) {
            return Right(booksList);
          }
        }
      }
      return Right(books);
    } catch (e) {
      if (pageNumber == 0) {
        // Fallback to cache on error only for first page
        List<BookModel> booksList = homeLocalDataSource.fetchNewestBooks();
        if (booksList.isNotEmpty) {
          return Right(booksList);
        }
      }
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() async {
    try {
      List<String> categories = [
        'Programming',
        'Artificial Intelligence',
        'Data Science',
        'Cyber Security',
      ];
      categories.shuffle();
      var data = await apiService.get(
        endpoint: 'volumes?Filtering=free-ebooks&q=subject:${categories.first}',
      );
      List<BookModel> books = [];
      if (data['items'] != null) {
        for (var item in data['items']) {
          books.add(BookModel.fromJson(item));
        }
      }
      if (books.isNotEmpty) {
        homeLocalDataSource.clearBox(kFeaturedBox);
        homeLocalDataSource.saveBooks(books, kFeaturedBox);
        return Right(books);
      } else {
        // Fallback to cache if API returns empty list
        List<BookModel> booksList = homeLocalDataSource.fetchFeaturedBooks();
        if (booksList.isNotEmpty) {
          return Right(booksList);
        }
        return Left(ServerFailure('No books found'));
      }
    } catch (e) {
      if (e is DioException) {
        // Fallback to cache on error
        List<BookModel> booksList = homeLocalDataSource.fetchFeaturedBooks();
        if (booksList.isNotEmpty) {
          return Right(booksList);
        }
        return Left(ServerFailure.fromDioException(e));
      }
      // Fallback to cache on error
      List<BookModel> booksList = homeLocalDataSource.fetchFeaturedBooks();
      if (booksList.isNotEmpty) {
        return Right(booksList);
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks({
    required String category,
  }) async {
    try {
      var data = await apiService.get(
        endpoint: 'volumes?Filtering=free-ebooks&q=$category&sorting=relevance',
      );
      List<BookModel> books = [];
      if (data['items'] != null) {
        for (var item in data['items']) {
          books.add(BookModel.fromJson(item));
        }
      }
      return Right(books);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
