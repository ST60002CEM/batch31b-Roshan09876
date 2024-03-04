import 'package:equatable/equatable.dart';
import 'package:job_finder/features/pagination/domain/entity/job_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'job_api_model.g.dart';

@JsonSerializable()
class JobApiModel extends Equatable {
  @JsonKey(name: '_id')
  final String? id;
  final String? title;
  final String? description;
  final String? salary;
  final String? location;
  final bool? available;
  final String? jobType;

  JobApiModel(
      {required this.id,
      required this.title,
      required this.description,
      required this.salary,
      required this.location,
      required this.available,
      required this.jobType});

  //toEntity
  factory JobApiModel.toEntity(JobApiModel jobApiModel) {
    return JobApiModel(
        id: jobApiModel.id,
        title: jobApiModel.title,
        description: jobApiModel.description,
        salary: jobApiModel.salary,
        location: jobApiModel.location,
        available: jobApiModel.available,
        jobType: jobApiModel.jobType);
  }

  //From Entity
  factory JobApiModel.fromEntity(JobEntity jobEntity) {
    return JobApiModel(
        id: jobEntity.id,
        title: jobEntity.title,
        description: jobEntity.description,
        salary: jobEntity.salary,
        location: jobEntity.location,
        available: jobEntity.available,
        jobType: jobEntity.jobType);
  }

  //From JSON
  factory JobApiModel.fromJson(Map<String, dynamic> json) =>
      _$JobApiModelFromJson(json);

  //To JSON
  Map<String, dynamic> toJson() => _$JobApiModelToJson(this);

  @override
  List<Object?> get props =>
      [id, title, description, salary, location, available, jobType];
}
