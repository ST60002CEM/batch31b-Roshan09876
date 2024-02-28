import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:job_finder/features/pagination/data/datasource/job_remote_datasource.dart';
import 'package:job_finder/features/pagination/presentation/state/job_state.dart';

final jobViewModelProvider =
    StateNotifierProvider<JobViewModel, JobState>((ref) {
  final jobRemoteDataSource = ref.read(jobRemoteDataSourceProvider);
  return JobViewModel(jobRemoteDataSource);
});

class JobViewModel extends StateNotifier<JobState> {
  final JobRemoteDataSource jobRemoteDataSource;
  JobViewModel(this.jobRemoteDataSource) : super(JobState.initial());

  Future getJobs() async {
    state = state.copyWith(isLoading: true);
    final currentState = state;
    final page = currentState.page + 1;
    final jobs = currentState.jobApiModel;
    final hasReachedmax = currentState.hasReachedmax;
    if (!hasReachedmax) {
      final result = await jobRemoteDataSource.getJobs(page);
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

  Future<void> getJobById(int jobId) async {
  state = state.copyWith(isLoading: true);
  final currentState = state;
  final jobs = currentState.jobApiModel;
  final hasReachedmax = currentState.hasReachedmax;
  if (!hasReachedmax) {
    final result = await jobRemoteDataSource.getJobById(jobId);
    result.fold(
      (failure) {
        state = state.copyWith(isLoading: false, hasReachedmax: false);
        // Handle failure (e.g., show error message)
      },
      (job) {
        state = state.copyWith(
          jobApiModel: [...jobs, job],
          isLoading: false,
          hasReachedmax: true, // Assuming a single job is always fetched
        );
      },
    );
  }
}

  Future resetState() async{
    state = JobState.initial();
    getJobs();
  }
}
