import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

//dart run build_runner build --delete-conflicting-outputs

@JsonSerializable()
class UserModel {
  final String firstName;
  final String lastName;
  final String email;
  final String password;

  UserModel(
      {required this.firstName,
      required this.lastName,
      required this.email,
      required this.password});

  //Creating factory constructor to make the instance of UserModel
  factory UserModel.fromJSON(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

      Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
