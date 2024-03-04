// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:job_finder/features/search/data/datasource/search_remote_datasource.dart';
// import 'package:job_finder/features/search/data/model/search_api_model.dart';
// import 'package:job_finder/features/search/presentation/state/search_state.dart';

// final searchViewModelProvider =
//     StateNotifierProvider<SearchViewModel, SearchState>((ref) {
//   final searchRemoteDataSource = ref.read(searchRemoteDataSourceProvider);
//   return SearchViewModel(searchRemoteDataSource);
// });

// class SearchViewModel extends StateNotifier<SearchState> {
//   final SearchRemoteDataSource searchRemoteDataSource;

//   SearchViewModel(this.searchRemoteDataSource) : super(SearchState.initial());

//   Future getSeacrhJobs(String text) async {
  
//     final currentState = state;
//     final page = currentState.page + 1;
//     final jobs = currentState.searchApiModel;
//     final hasReachedmax = currentState.hasReachedmax;
//     if (!hasReachedmax) {
//       state = state.copyWith(isLoading: true);
//       final result = await searchRemoteDataSource.searchJobs(text);
//       result.fold(
//           (Failure) => state =
//               state.copyWith(isLoading: true, hasReachedmax: false), (data) {
//           state.copyWith(searchApiModel:[]);
//           jobs.clear();
//           List<SearchApiModel> allDataList = [...jobs, ...data];
//           print("SEARCH DATA 12333::${allDataList}");
//           state = state.copyWith(
//             searchApiModel: allDataList,
//             page: page,
//             isLoading: false,
//           );
//         // }
//       });

//     }
//   }
// }


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

  Future<void> getSearchJobs(String text) async {
    if(text.isEmpty) {
      state.copyWith(searchApiModel: [], isLoading: false);
      return;
    }
    final currentState = state;
    final page = currentState.page + 1;
    final jobs = currentState.searchApiModel;
    final hasReachedmax = currentState.hasReachedmax;
    if (!hasReachedmax) {
      state = state.copyWith(isLoading: true);
      final result = await searchRemoteDataSource.searchJobs(text);
      result.fold(
        (Failure) => state = state.copyWith(isLoading: false, hasReachedmax: true),
        (data) {
          final allDataList = [...jobs, ...data];
          state = state.copyWith(
            searchApiModel: allDataList,
            page: page,
            isLoading: false,
            hasReachedmax: data.isEmpty
          );
        },
      );
    }
  }
}
