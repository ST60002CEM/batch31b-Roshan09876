import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:job_finder/core/common/Failure.dart';
import 'package:job_finder/features/auth/data/repositories/auth_repository.dart';

final userNotifierProvider = Provider.autoDispose(
    (ref) => UserNotifier(ref.read(authRepositoryProvider)));

class UserNotifier extends StateNotifier {
  final AuthRepository _authRepository;

  UserNotifier(this._authRepository) : super(null);

  // Future<void> register(Map<String, dynamic> userData) async {
  //   await _authRepository.register(userData);
  //   // After a successful registration, you might want to update the user state.
  // }
  Future<Either<Failure, bool>> register(Map<String, dynamic> userData) async{
    try{
      final registerResult = await _authRepository.register(userData);
     return Right(true);
    } catch(e){
      return Left(Failure(error: e.toString()));
    }
  }
}
