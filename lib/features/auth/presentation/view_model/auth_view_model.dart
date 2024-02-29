import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:job_finder/config/common/snackbar/my_snackbar.dart';
import 'package:job_finder/config/router/app_routes.dart';
import 'package:job_finder/features/auth/domain/entity/auth_entity.dart';
import 'package:job_finder/features/auth/domain/usecases/login_usecase.dart';
import 'package:job_finder/features/auth/domain/usecases/profile_usecase.dart';
import 'package:job_finder/features/auth/domain/usecases/signup_usecase.dart';
import 'package:job_finder/features/auth/presentation/state/auth_state.dart';

final authViewModelProvider = StateNotifierProvider<AuthViewModel, AuthState>(
    (ref) => AuthViewModel(ref.read(signUpUseCaseProvider),
        ref.read(loginUseCaseProvider), ref.read(profileUseCaseProvider)));

class AuthViewModel extends StateNotifier<AuthState> {
  final SignUpUseCase signUpUseCase;
  final LoginUseCase loginUseCase;
  final ProfileUseCase profileUseCase;

  AuthViewModel(this.signUpUseCase, this.loginUseCase, this.profileUseCase)
      : super(AuthState.initial());

  Future<void> signUpFreelancer(
      AuthEntity authEntity, BuildContext context) async {
    state = state.copyWith(isLoading: true);
    final result = await signUpUseCase.signUpFreelancer(authEntity);
    state = state.copyWith(isLoading: false);
    result.fold(
      (failure) => state = state.copyWith(
        error: failure.error,
        showMessage: true,
      ),
      (success) {
        state = state.copyWith(isLoading: false, showMessage: true);
        Navigator.popAndPushNamed(context, AppRoute.loginviewRoute);
      },
    );
    resetMessage();
  }

  Future<void> signInFreelancer(
      BuildContext context, String email, String password) async {
    state = state.copyWith(isLoading: true);
    final result = await loginUseCase.signInFreelancer(email, password);
    state = state.copyWith(isLoading: false);
    result.fold(
      (failure) {
        state = state.copyWith(
          error: failure.error,
          showMessage: true,
        );

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red, // Background color of the snackbar
            content: Text(
              failure.error, // Display the error message from the backend
              style: TextStyle(color: Colors.white), // Text color
            ),
            duration: Duration(seconds: 3), // Duration to display the snackbar
            behavior: SnackBarBehavior
                .floating, // Make the snackbar float above the bottom navigation bar
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                  top: Radius.circular(10)), // Rounded corners
            ),
          ),
        );
      },
      (success) {
        state = state.copyWith(
          isLoading: false,
          showMessage: true,
          error: null,
        );
        Navigator.popAndPushNamed(context, AppRoute.homeViewRoute);
      },
    );
  }

  void reset() {
    state = state.copyWith(
      isLoading: false,
      error: null,
      imageName: null,
      showMessage: false,
    );
  }

  Future<void> getUser(BuildContext context, String email) async {
    state = state.copyWith(isLoading: true);

    var data = await profileUseCase.getUser(email);

    data.fold(
      (failure) {
        state = state.copyWith(isLoading: false, error: failure.error);
        showSnackBar(
          message: 'Invalid Credentials',
          context: context,
          color: Colors.red,
        );
      },
      (success) {
        state = state.copyWith(isLoading: false, error: null);
      },
    );
  }

  void resetMessage() {
    state = state.copyWith(
        showMessage: false, imageName: null, error: null, isLoading: false);
  }
}
