import 'package:bookly/Features/search/data/repos/search_repo.dart';
import 'package:bookly/Features/search/presentation/manager/search_cubit/search_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepo) : super(SearchInitial());
  final SearchRepo searchRepo;

  Future<void> fetchSearchBooks({required String category}) async {
    emit(SearchLoading());
    var result = await searchRepo.fetchSearchBooks(category: category);
    result.fold(
      (failure) {
        emit(SearchFailure(failure.errorMessage));
      },
      (books) {
        emit(SearchSuccess(books));
      },
    );
  }
}
