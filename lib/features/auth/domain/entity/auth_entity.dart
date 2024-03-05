import 'package:equatable/equatable.dart';

class AuthEntity extends Equatable {
  final String? freelancerId;
  final String firstName;
  final String lastName;
  final String location;
  final String phoneNum;
  final String email;
  final String password;
  final String? image;

  AuthEntity(
      {this.freelancerId,
      required this.firstName,
      required this.lastName,
      required this.location,
      required this.phoneNum,
      required this.email,
      required this.password,
      this.image});

  @override
  List<Object?> get props =>
      [freelancerId, firstName, lastName, email, password, image];
}
