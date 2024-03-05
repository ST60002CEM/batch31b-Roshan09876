import 'package:job_finder/features/auth/domain/entity/auth_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'auth_api_model.g.dart';

@JsonSerializable()
class AuthApiModel {
  @JsonKey(name: '_id')
  final String? freelancerId;
  final String firstName;
  final String lastName;
   final String location;
  final String phoneNum;
  final String email;
  final String password;

  AuthApiModel(
      {required this.freelancerId,
      required this.firstName,
      required this.lastName,
      required this.location, 
      required this.phoneNum, 
      required this.email,
      required this.password});

  //toEntity
  factory AuthApiModel.toEntity(AuthApiModel apiModel) {
    return AuthApiModel(
        freelancerId: apiModel.freelancerId,
        firstName: apiModel.firstName,
        lastName: apiModel.lastName,
        location: apiModel.location,
        phoneNum: apiModel.phoneNum,
        email: apiModel.email,
        password: apiModel.password);
  }

  //From Entiry
  factory AuthApiModel.fromEntity(AuthEntity authEntity) {
    return AuthApiModel(
        freelancerId: authEntity.freelancerId,
        firstName: authEntity.firstName,
        lastName: authEntity.lastName,
        location: authEntity.location,
        phoneNum: authEntity.phoneNum,
        email: authEntity.email,
        password: authEntity.password);
  }

  AuthEntity toEntity() => AuthEntity(
      freelancerId: freelancerId,
      firstName: firstName,
      lastName: lastName,
      location: location,
      phoneNum: phoneNum,
      email: email,
      password: password);

  //FromJSON
  factory AuthApiModel.fromJson(Map<String, dynamic> json) =>
      _$AuthApiModelFromJson(json);

  //ToJSON
  Map<String, dynamic> toJson() => _$AuthApiModelToJson(this);
}
