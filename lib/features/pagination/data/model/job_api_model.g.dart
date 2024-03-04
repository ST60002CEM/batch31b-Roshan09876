// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JobApiModel _$JobApiModelFromJson(Map<String, dynamic> json) => JobApiModel(
      id: json['_id'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      salary: json['salary'] as String?,
      location: json['location'] as String?,
      available: json['available'] as bool?,
      jobType: json['jobType'] as String?,
    );

Map<String, dynamic> _$JobApiModelToJson(JobApiModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'salary': instance.salary,
      'location': instance.location,
      'available': instance.available,
      'jobType': instance.jobType,
    };
