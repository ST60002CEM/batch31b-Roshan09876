import 'package:job_finder/profile/domain/entity/profile_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'profile_api_model.g.dart';

@JsonSerializable()
class ProfileApiModel {
  @JsonKey(name: '_id')
  final String? freelancerId;
  final String firstName;
  final String lastName;
  final String email;
  final String password;

  ProfileApiModel(
      {this.freelancerId,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.password});

  //toEntity
  factory ProfileApiModel.toEntity(ProfileApiModel profileApiModel) {
    return ProfileApiModel(
        firstName: profileApiModel.firstName,
        lastName: profileApiModel.lastName,
        email: profileApiModel.email,
        password: profileApiModel.password);
  }

  //fromEntity
  factory ProfileApiModel.fromEntity(ProfileEntity profileEntity) {
    return ProfileApiModel(
        firstName: profileEntity.firstName,
        lastName: profileEntity.lastName,
        email: profileEntity.email,
        password: profileEntity.password);
  }


  //FromJSON
  factory ProfileApiModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileApiModelFromJson(json);

      //ToJSON
    Map<String, dynamic> toJson() => _$ProfileApiModelToJson(this);
}
