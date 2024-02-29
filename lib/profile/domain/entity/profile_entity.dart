import 'package:equatable/equatable.dart';

class ProfileEntity extends Equatable {
  final String? freelancerId;
  final String firstName;
  final String lastName;
  final String email;
  final String password;

  ProfileEntity(
      {this.freelancerId,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.password});

  @override
  List<Object?> get props =>
      [freelancerId, firstName, lastName, email, password];
}
