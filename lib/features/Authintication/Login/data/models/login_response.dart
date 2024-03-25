import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  String? username;
  String? accessToken;
  int? id;
  String? name;

  LoginResponse({this.username, this.accessToken, this.id, this.name});

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}