import 'package:equatable/equatable.dart';

class JobEntity extends Equatable {
  final String? id;
  final String? title;
  final String? description;
  final String? salary;
  final String? location;
  final bool? available;
  final String? jobType;

  JobEntity(
      {required this.id,
      required this.title,
      required this.description,
      required this.salary,
      required this.location,
      required this.available,
      required this.jobType});

  @override
  List<Object?> get props =>
      [id, title, description, salary, location, available, jobType];
}
