import 'package:bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly/Features/home/data/repos/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.homeRepo) : super(NewestBooksInitial());
  final HomeRepo homeRepo;
  int _pageNumber = 0;
  bool _isLoading = false;
  final List<BookModel> _allBooks = [];
  String _selectedCategory = 'Computer Science';

  final List<String> _categories = [
    'Computer Science',
    'Health',
    'True Crime',
    'History',
    'Business',
    'Programming',
    'Novel',
  ];

  Future<void> fetchNewestBooks({bool fromScroll = false}) async {
    if (fromScroll) {
      if (_isLoading) return;
      _isLoading = true;
      _pageNumber++;
    } else {
      _pageNumber = 0;
      _allBooks.clear();
      _selectedCategory = (_categories..shuffle()).first;
      emit(NewestBooksLoading());
    }

    var result = await homeRepo.fetchNewestBooks(
      pageNumber: _pageNumber,
      category: _selectedCategory,
    );

    result.fold(
      (failure) {
        _isLoading = false;
        if (fromScroll) {
          // You might want to emit a separate error state for pagination failure
          // or just show a snackbar, but for now we keep the list state
        } else {
          emit(NewestBooksFailure(failure.errorMessage));
        }
      },
      (books) {
        _isLoading = false;
        _allBooks.addAll(books);
        emit(NewestBooksSuccess(List.from(_allBooks)));
      },
    );
  }
}
