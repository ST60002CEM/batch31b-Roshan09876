import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:job_finder/config/constant/api_endpoints.dart';
import 'package:job_finder/core/common/Failure.dart';
import 'package:job_finder/core/network/http_service.dart';
import 'package:job_finder/features/pagination/data/model/job_api_model.dart';

final jobRemoteDataSourceProvider = Provider((ref) {
  final _dio = ref.read(httpServiceProvider);
  return JobRemoteDataSource(_dio);
});

class JobRemoteDataSource {
  final Dio _dio;

  JobRemoteDataSource(this._dio);

  //making get request to get pagination data from backend
  Future<Either<Failure, List<JobApiModel>>> getJobs(
      int page) async {
        print("GETTING JOBS");
    try {
      final response = await _dio.get(ApiEndpoints.getJob,
          queryParameters: {'page': page,});
          print(response.data);
      print(response);
      final List<dynamic> data = response.data['showJob'];
      final post = data.map((json) => JobApiModel.fromJson(json)).toList();
      return Right(post);
    } on DioException catch (e) {
      return Left(Failure(error: e.message.toString()));
    }
  }

}
