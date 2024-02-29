// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:job_finder/profile/data/datasource/profile_remote_datasource.dart';
// import 'package:job_finder/profile/presentation/state/profile_state.dart';

// final profielieModelProvider =
//     StateNotifierProvider<ProfileViewModel, ProfileState>((ref) {
//   final profileRemoteDataSource = ref.read(profileRemoteDataSourceProvider);
//   return ProfileViewModel(profileRemoteDataSource);
// });

// class ProfileViewModel extends StateNotifier<ProfileState> {
//   final ProfileRemoteDataSource profileRemoteDataSource;
//   ProfileViewModel(this.profileRemoteDataSource)
//       : super(ProfileState.initial());

//   Future getProfile() async {
//     state.copyWith(isLoading: true);
//     final currentState = state;
//     final result = await profileRemoteDataSource.getProfile();
//     result.fold(
//         (failure) => state = state.copyWith(
//               error: failure.error,
//               showMessage: true,
//             ), (success) {
//       state = state.copyWith(isLoading: false, showMessage: true);
//     });
//   }
// }
