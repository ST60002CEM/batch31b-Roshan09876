import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:job_finder/config/constant/api_endpoints.dart';
import 'package:job_finder/core/common/Failure.dart';
import 'package:job_finder/core/network/http_service.dart';
import 'package:job_finder/core/shared_pref/user_shared_pref.dart';
import 'package:job_finder/features/pagination/data/model/job_api_model.dart';

final jobRemoteDataSourceProvider = Provider((ref) {
  final _dio = ref.read(httpServiceProvider);
  final userSharedPref = ref.read(userSharedPrefsProvider);
  return JobRemoteDataSource(_dio, userSharedPref);
});

class JobRemoteDataSource {
  final Dio _dio;
  final UserSharedPref userSharedPref;

  JobRemoteDataSource(this._dio, this.userSharedPref);

  //making get request to get pagination data from backend
  Future<Either<Failure, List<JobApiModel>>> getJobs(int page) async {
    print("GETTING JOBS");
    try {
      final response = await _dio.get(ApiEndpoints.getJob, queryParameters: {
        'page': page,
      });
      print(response.data);
      print(response);
      final List<dynamic> data = response.data['showJob'];
      final post = data.map((json) => JobApiModel.fromJson(json)).toList();
      return Right(post);
    } on DioException catch (e) {
      return Left(Failure(error: e.message.toString()));
    }
  }

  //making get request to apply jobs
  Future<Either<Failure, bool>> appyJobs(JobApiModel jobApiModel) async {
    print("GETTING JOBS");
    String token = '';
    await userSharedPref
        .getUserToken()
        .then((value) => value.fold((l) => null, (r) => token = r!));
    // print('Token is $token');
    print('Job api model $jobApiModel');
    try {
      final response = await _dio.post(ApiEndpoints.applyJobs,
          data: jobApiModel,
          options: Options(headers: {'Authorization': 'Bearer $token'}));
      print(response.data);
      print(response);
      if (response.statusCode == 200) {
        return const Right(true);
      } else {
        return Left(Failure(
            error: response.data['message'],
            statusCode: response.statusCode.toString()));
      }
    } on DioException catch (e) {
      return Left(Failure(error: e.message.toString()));
    }
  }

  //Getting user Job History
  Future<Either<Failure, List<JobApiModel>>> getappliedJobs(String userId) async {
    print("GETTING APPLIED JOBS");
    try {
      final response = await _dio
          .get(ApiEndpoints.getuserjobs.replaceFirst(':id', userId.toString()));
      print(response.data);
      print(response);
      final List<dynamic> data = response.data['jobHistory'];
      // final post = data.map((json) => JobApiModel.fromJson(json)).toList();
         final List<JobApiModel> jobList = data.map((json) => JobApiModel.fromJson(json)).toList();
      return Right(jobList);
    } on DioException catch (e) {
      return Left(Failure(error: e.message.toString()));
    }
  }
}
