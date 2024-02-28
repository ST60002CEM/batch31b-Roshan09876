import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:job_finder/features/search/data/datasource/search_remote_datasource.dart';
import 'package:job_finder/features/search/presentation/state/search_state.dart';

final searchViewModelProvider =
    StateNotifierProvider<SearchViewModel, SearchState>((ref) {
  final searchRemoteDataSource = ref.read(searchRemoteDataSourceProvider);
  return SearchViewModel(searchRemoteDataSource);
});

class SearchViewModel extends StateNotifier<SearchState> {
  final SearchRemoteDataSource searchRemoteDataSource;

  SearchViewModel(this.searchRemoteDataSource) : super(SearchState.initial());

  Future getSeacrhJobs(String text) async {
    state = state.copyWith(isLoading: true);
    final currentState = state;
    final page = currentState.page + 1;
    final jobs = currentState.searchApiModel;
    final hasReachedmax = currentState.hasReachedmax;
    if (!hasReachedmax) {
      final result = await searchRemoteDataSource.searchJobs(text);
      result.fold(
          (Failure) => state =
              state.copyWith(isLoading: true, hasReachedmax: false), (data) {
        if (data.isEmpty) {
          state = state.copyWith(hasReachedmax: true);
        } else {
          state = state.copyWith(
            searchApiModel: [...jobs, ...data],
            page: page,
            isLoading: false,
          );
        }
      });
    }
  }
}
