// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JobApiModel _$JobApiModelFromJson(Map<String, dynamic> json) => JobApiModel(
      id: json['id'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      salary: json['salary'] as int,
      location: json['location'] as String,
      availabe: json['availabe'] as bool,
      jobType: json['jobType'] as String,
    );

Map<String, dynamic> _$JobApiModelToJson(JobApiModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'salary': instance.salary,
      'location': instance.location,
      'availabe': instance.availabe,
      'jobType': instance.jobType,
    };
