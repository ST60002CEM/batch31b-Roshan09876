import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:job_finder/core/common/Failure.dart';
import 'package:job_finder/features/pagination/data/model/job_api_model.dart';
import 'package:mockito/annotations.dart';
import 'package:job_finder/features/pagination/domain/usecase/get_applied_job_usecase.dart';
import 'package:job_finder/features/pagination/domain/usecase/get_job_usecase.dart';
import 'package:job_finder/features/pagination/domain/usecase/job_usecase.dart';
import 'package:job_finder/features/pagination/presentation/view_model/job_view_model.dart';
import 'package:mockito/mockito.dart';

import 'job_unit_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<GetJobuseCase>(), // Corrected type here
  MockSpec<JobUseCase>(),
  MockSpec<GetAppliedJobUseCase>()
])
void main() {
  late GetJobuseCase mockGetJobUseCase;
  late JobUseCase mockJobUseCase;
  late GetAppliedJobUseCase mockGetAppliedJobUseCase;
  late ProviderContainer container;

  setUpAll(() {
    mockGetJobUseCase = MockGetJobuseCase();
    mockJobUseCase = MockJobUseCase();
    mockGetAppliedJobUseCase = MockGetAppliedJobUseCase();
    container = ProviderContainer(overrides: [
      jobViewModelProvider.overrideWith((ref) => JobViewModel(
        mockJobUseCase, 
        mockGetJobUseCase, 
        mockGetAppliedJobUseCase)
      )
    ]);
  });

  test('Check for initial test', () async {
    final jobState = container.read(jobViewModelProvider);
    expect(jobState.isLoading, false);
    expect(jobState.applyLoading, false);
    expect(jobState.hasReachedmax, false);
  });


test('check job initial state', () async {
  when(mockGetJobUseCase.getJobs(1)).thenAnswer((_) async {
    return Right<Failure, List<JobApiModel>>([]);
  });

  await container.read(jobViewModelProvider.notifier).getJobs();
  final jobState = container.read(jobViewModelProvider);
  expect(jobState.isLoading, false);
  expect(jobState.hasReachedmax, false);
  expect(jobState.jobApiModel, isEmpty);
});




}
