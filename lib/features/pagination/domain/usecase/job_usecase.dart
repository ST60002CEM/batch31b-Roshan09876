import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:job_finder/core/common/Failure.dart';
import 'package:job_finder/features/pagination/data/model/job_api_model.dart';
import 'package:job_finder/features/pagination/domain/entity/job_entity.dart';
import 'package:job_finder/features/pagination/domain/repository/job_repository.dart';

final jobUseCaseProvider = Provider.autoDispose<JobUseCase>(
    (ref) => JobUseCase(ref.read(jobRepositoryProvider)));

class JobUseCase {
  final JobRepository jobRepository;
  JobUseCase(this.jobRepository);

  Future<Either<Failure, List<JobApiModel>>> getJobs(int page) async {
    return await jobRepository.getjobs(page);
  }

  Future<Either<Failure, bool>> applyJobs(JobApiModel jobApiModel) async {
    return await jobRepository.applyJobs(jobApiModel);
  }

  Future<Either<Failure, List<JobApiModel>>> getAppliedJobs(
      {required String userId}) async {
    return await jobRepository.getuserjobs(userId);
  }
}
