// import 'package:dartz/dartz.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:job_finder/config/constant/api_endpoints.dart';
// import 'package:job_finder/core/common/Failure.dart';
// import 'package:job_finder/core/network/http_service.dart';

// final authRepositoryProvider = Provider.autoDispose<AuthRepository>(
//     (ref) => AuthRepository(dio: ref.read(httpServiceProvider)));

// class AuthRepository {
//   final Dio _dio;

//   AuthRepository({required Dio dio}) : _dio = dio;

//   Future<Either<Failure, bool>> register(Map<String, dynamic> userData) async {
//     try {
//       var response = await _dio.post(ApiEndpoints.signUp, data: userData);
//       if (response.statusCode == 200) {
//         return const Right(true);
//       } else{
//         return Left(Failure(
//             error: response.statusMessage.toString(),
//             statusCode: response.statusCode.toString()));
//       }
//     } on DioException catch (e) {
//       return Left(Failure(error: e.response?.data['message']));
//     }
//   }
// }
 