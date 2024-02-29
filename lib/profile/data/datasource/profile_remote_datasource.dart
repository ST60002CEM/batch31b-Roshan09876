// import 'package:dartz/dartz.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:job_finder/config/constant/api_endpoints.dart';
// import 'package:job_finder/core/common/Failure.dart';
// import 'package:job_finder/core/network/http_service.dart';

// final profileRemoteDataSourceProvider = Provider<ProfileRemoteDataSource>(
//     (ref) => ProfileRemoteDataSource(ref.read(httpServiceProvider)));

// class ProfileRemoteDataSource {
//   final Dio _dio;
//   ProfileRemoteDataSource(this._dio);

//   //Making request for profile
//   Future<Either<Failure, Map<String, dynamic>>> getProfile() async {
//     try {
//       final response = await _dio.get(ApiEndpoints.userProfile);
//       print(response);
//       if (response.statusCode == 200) {
//         final userProfile = response.data['user'] as Map<String, dynamic>;
//         return Right(userProfile);
//       } else {
//         return Left(Failure(
//             error: response.data['message'],
//             statusCode: response.statusCode.toString()));
//       }
//     } on DioException catch (e) {
//       return Left(Failure(error: e.message.toString()));
//     }
//   }
// }
