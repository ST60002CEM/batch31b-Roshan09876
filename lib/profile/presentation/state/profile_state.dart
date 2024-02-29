import 'package:job_finder/features/auth/domain/entity/auth_entity.dart';

class ProfileState {
  final bool isLoading;
  final String? error;
  final bool? showMessage;
  final AuthEntity currentUser;

  ProfileState({required this.isLoading, this.error, this.showMessage, required this.currentUser});

  factory ProfileState.initial() {
    return ProfileState(
      isLoading: false,
      error: null,
      showMessage: false,
      currentUser: AuthEntity(
        firstName: "firstName", 
        lastName: "lastName", 
        email: "email",
         password: "password")
    );
  }

  ProfileState copyWith({
    bool? isLoading,
    String? error,
    bool? showMessage,
  }) {
    return ProfileState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      showMessage: showMessage ?? this.showMessage,
      currentUser: currentUser ?? this.currentUser,
    );
  }

  @override
  String toString() => 'ProfileState(isLoading: $isLoading, error: $error, currentUser: $currentUser)';
}
