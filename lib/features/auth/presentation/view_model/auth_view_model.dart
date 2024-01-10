import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:job_finder/features/auth/domain/entity/auth_entity.dart';
import 'package:job_finder/features/auth/domain/usecases/signup_usecase.dart';
import 'package:job_finder/features/auth/presentation/state/auth_state.dart';

final authViewModelProvider = StateNotifierProvider<AuthViewModel, AuthState>(
    (ref) => AuthViewModel(ref.read(signUpUseCaseProvider)));

class AuthViewModel extends StateNotifier<AuthState> {
  final SignUpUseCase signUpUseCase;

  AuthViewModel(this.signUpUseCase) : super(AuthState.initial());

  Future<void> signUpFreelancer(AuthEntity authEntity) async {
    state = state.copyWith(isLoading: true);
    final result = await signUpUseCase.signUpFreelancer(authEntity);
    state = state.copyWith(isLoading: false);
    result.fold(
      (failure) => state = state.copyWith(error: failure.error),
      (success) => state = state.copyWith(isLoading: false, showMessage: true),
    );
    resetMessage();
  }

  void reset() {
    state = state.copyWith(
      isLoading: false,
      error: null,
      imageName: null,
      showMessage: false,
    );
  }

  void resetMessage() {
    state = state.copyWith(
        showMessage: false, imageName: null, error: null, isLoading: false);
  }
}
