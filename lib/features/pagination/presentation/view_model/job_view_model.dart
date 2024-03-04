import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:job_finder/features/pagination/data/model/job_api_model.dart';
import 'package:job_finder/features/pagination/domain/usecase/job_usecase.dart';
import 'package:job_finder/features/pagination/presentation/state/job_state.dart';

final jobViewModelProvider =
    StateNotifierProvider<JobViewModel, JobState>((ref) {
  final jobuseCase = ref.read(jobUseCaseProvider);
  return JobViewModel(jobuseCase);
});

class JobViewModel extends StateNotifier<JobState> {
  // final JobRemoteDataSource jobRemoteDataSource;
  final JobUseCase jobUseCase;
  JobViewModel(this.jobUseCase) : super(JobState.initial());

  Future getJobs() async {
    state = state.copyWith(isLoading: true);
    final currentState = state;
    final page = currentState.page + 1;
    final jobs = currentState.jobApiModel;
    final hasReachedmax = currentState.hasReachedmax;
    if (!hasReachedmax) {
      final result = await jobUseCase.getJobs(page);
      result.fold(
          (Failure) => state =
              state.copyWith(isLoading: true, hasReachedmax: false), (data) {
        if (data.isEmpty) {
          state = state.copyWith(hasReachedmax: true);
        } else {
          state = state.copyWith(
            jobApiModel: [...jobs, ...data],
            page: page,
            isLoading: false,
          );
        }
      });
    }
  }

  Future applyJob(JobApiModel jobApiModel) async {
    state = state.copyWith(applyLoading: true);
    final result = await jobUseCase.applyJobs(jobApiModel);
    result.fold((Failure) => state = state.copyWith(applyLoading: false),
        (data) {
      state = state.copyWith(applyLoading: true);
    });
  }

  Future getAppliedJobs(String userId) async {
    state = state.copyWith(isLoading: true);
    final currentState = state;
    final page = currentState.page + 1;
    final jobs = currentState.jobApiModel;
    final result = await jobUseCase.getAppliedJobs(userId: userId);
    result.fold(
        (Failure) => state =
            state.copyWith(isLoading: true, hasReachedmax: false), (data) {
      if (data.isEmpty) {
        state = state.copyWith(hasReachedmax: true);
      } else {
        state = state.copyWith(
          jobApiModel: [...jobs, ...data],
          page: page,
          isLoading: false,
        );
      }
    });
  }

  Future resetState() async {
    state = JobState.initial();
    getJobs();
  }
}
