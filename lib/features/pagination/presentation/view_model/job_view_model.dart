import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:job_finder/features/pagination/data/model/job_api_model.dart';
import 'package:job_finder/features/pagination/domain/usecase/get_applied_job_usecase.dart';
import 'package:job_finder/features/pagination/domain/usecase/get_job_usecase.dart';
import 'package:job_finder/features/pagination/domain/usecase/job_usecase.dart';
import 'package:job_finder/features/pagination/presentation/state/job_state.dart';

final jobViewModelProvider =
    StateNotifierProvider<JobViewModel, JobState>((ref) {
  final jobuseCase = ref.read(jobUseCaseProvider);
  final getjobuseCase = ref.read(getJobUseCaseProvider);
  final getapplyJobs = ref.read(getAppliedJobUseCaseProvider);
  return JobViewModel(jobuseCase, getjobuseCase, getapplyJobs);
});

class JobViewModel extends StateNotifier<JobState> {
  // final JobRemoteDataSource jobRemoteDataSource;
  final GetJobuseCase getJobuseCase;
  final JobUseCase jobUseCase;
  final GetAppliedJobUseCase getAppliedJobUseCase;
  JobViewModel(this.jobUseCase, this.getJobuseCase, this.getAppliedJobUseCase) : super(JobState.initial());

  Future getJobs() async {
    state = state.copyWith(isLoading: true);
    final currentState = state;
    final page = currentState.page + 1;
    final jobs = currentState.jobApiModel;
    final hasReachedmax = currentState.hasReachedmax;
    if (!hasReachedmax) {
      final result = await getJobuseCase.getJobs(page);
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
    final result = await getAppliedJobUseCase.applyJobs(jobApiModel);
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



//   Future getAppliedJobs(String userId) async {
//   state = state.copyWith(isLoading: true);
//   final currentState = state;
//   final page = currentState.page + 1;
//   final jobs = currentState.jobApiModel;
//   final result = await jobUseCase.getAppliedJobs(userId); // Pass userId to the use case method
//   result.fold(
//     (failure) => state = state.copyWith(isLoading: false), // Handle failure case
//     (data) {
//       if (data.isEmpty) {
//         state = state.copyWith(hasReachedmax: true);
//       } else {
//         state = state.copyWith(
//           jobApiModel: [...jobs, ...data],
//           page: page,
//           isLoading: false,
//         );
//       }
//     },
//   );
// }