import 'package:bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly/constants.dart';
import 'package:hive/hive.dart';

abstract class HomeLocalDataSource {
  List<BookModel> fetchFeaturedBooks();
  List<BookModel> fetchNewestBooks();
  void saveBooks(List<BookModel> books, String boxName);
  void clearBox(String boxName);
}

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  @override
  List<BookModel> fetchFeaturedBooks() {
    var box = Hive.box<BookModel>(kFeaturedBox);
    return box.values.toList();
  }

  @override
  List<BookModel> fetchNewestBooks() {
    var box = Hive.box<BookModel>(kNewestBox);
    return box.values.toList();
  }

  @override
  void saveBooks(List<BookModel> books, String boxName) {
    var box = Hive.box<BookModel>(boxName);
    box.addAll(books);
  }

  @override
  void clearBox(String boxName) {
    var box = Hive.box<BookModel>(boxName);
    box.clear();
  }
}
