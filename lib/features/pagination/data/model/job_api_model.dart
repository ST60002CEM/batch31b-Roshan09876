import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'job_api_model.g.dart';

@JsonSerializable()
class JobApiModel extends Equatable {
  final int id;
  final String title;
  final String description;
  final int salary;
  final String location;
  final bool availabe;
  final String jobType;

  JobApiModel(
      { 
        required this.id,
      required this.title,
      required this.description,
      required this.salary,
      required this.location,
      required this.availabe,
      required this.jobType});

      //From JSON
      factory JobApiModel.fromJson(Map<String, dynamic> json)=> _$JobApiModelFromJson(json);

      //To JSON
      Map<String, dynamic> toJson() => _$JobApiModelToJson(this);

  @override
  List<Object?> get props =>
      [id, title, description, salary, location, availabe, jobType];
}
