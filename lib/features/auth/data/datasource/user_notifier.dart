import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:job_finder/features/auth/data/repositories/auth_repository.dart';

class UserNotifier extends StateNotifier{
  final AuthRepository _authRepository;

  UserNotifier(this._authRepository) : super(null);


  Future<void> register(Map<String, dynamic> userData) async {
    await _authRepository.register(userData);
    // After a successful registration, you might want to update the user state.
  }
}