// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchApiModel _$SearchApiModelFromJson(Map<String, dynamic> json) =>
    SearchApiModel(
      id: json['_id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      salary: json['salary'] as String,
      location: json['location'] as String,
      availabe: json['availabe'] as bool,
      jobType: json['jobType'] as String,
    );

Map<String, dynamic> _$SearchApiModelToJson(SearchApiModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'salary': instance.salary,
      'location': instance.location,
      'availabe': instance.availabe,
      'jobType': instance.jobType,
    };
