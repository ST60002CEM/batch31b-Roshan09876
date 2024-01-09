import 'package:equatable/equatable.dart';

class AuthEntity extends Equatable {
  final String? freelancerId;
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String? image;

  AuthEntity(
      {this.freelancerId,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.password,
      this.image});

  @override
  // TODO: implement props
  List<Object?> get props =>
      [freelancerId, firstName, lastName, email, password, image];
}
