import 'package:job_finder/features/search/data/model/search_api_model.dart';

class SearchState {
  final List<SearchApiModel> searchApiModel;
  final bool hasReachedmax;
  final int page;
  final bool isLoading;

  SearchState(
      {required this.searchApiModel,
      required this.hasReachedmax,
      required this.page,
      required this.isLoading});

  factory SearchState.initial() {
    return SearchState(
        searchApiModel: [], hasReachedmax: false, page: 0, isLoading: false);
  }
  SearchState copyWith({
    List<SearchApiModel>? searchApiModel,
    bool? hasReachedmax,
    int? page,
    bool? isLoading,
  }) {
    return SearchState(
        searchApiModel: searchApiModel ?? this.searchApiModel,
        hasReachedmax: hasReachedmax ?? this.hasReachedmax,
        page: page ?? this.page,
        isLoading: isLoading ?? this.isLoading);
  }
}
