import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:job_finder/config/constant/api_endpoints.dart';
import 'package:job_finder/core/common/Failure.dart';
import 'package:job_finder/core/network/http_service.dart';
import 'package:job_finder/core/shared_pref/user_shared_pref.dart';
import 'package:job_finder/features/auth/data/models/auth_api_model.dart';
import 'package:job_finder/features/auth/domain/entity/auth_entity.dart';

final authRemoteDataSourceProvider = Provider<AuthRemoteDataSource>(
    (ref) => AuthRemoteDataSource(ref.read(httpServiceProvider)));

class AuthRemoteDataSource {
  final Dio dio;
  AuthRemoteDataSource(this.dio);

  // Converts an AuthEntity to an AuthApiModel before making the HTTP request.

  Future<Either<Failure, bool>> signUpFreelancer(AuthEntity freelancer) async {
    try {
      AuthApiModel authApiModel = AuthApiModel.fromEntity(freelancer);
      Response response = await dio.post(ApiEndpoints.signUp, data: {
        "firstName": authApiModel.firstName,
        "lastName": authApiModel.lastName,
        "email": authApiModel.email,
        "password": authApiModel.password,
      });
      if (response.statusCode == 200) {
        return const Right(true);
      } else {
        return Left(Failure(
            error: response.data['message'],
            statusCode: response.statusCode.toString()));
      }
    } on DioException catch (e) {
      return Left(Failure(
          error: e.error.toString(),
          statusCode: e.response!.statusCode.toString() ?? '0'));
    }
  }

  //Login AuthRemoteDataSource
  Future<Either<Failure, bool>> signInFreelancer(
      String email, String password) async {
    try {
      Response response = await dio.post(ApiEndpoints.signIn,
          data: {'email': email, 'password': password});
      if (response.statusCode == 200) {
        //Retriving Token
        String token = response.data['token'];
        await UserSharedPref().setUserToken(token);

        final storedToken = await UserSharedPref().setUserToken(token);
        print('Stored Token is: $storedToken');
        return const Right(true);
      } else {
        return Left(Failure(
            error: response.data['message'],
            statusCode: response.statusCode.toString()));
      }
    } on DioException catch (e) {
      return Left(
        Failure(
          error: e.error.toString(),
          statusCode: e.response?.statusCode.toString() ?? '0',
        ),
      );
    }
  }
}
