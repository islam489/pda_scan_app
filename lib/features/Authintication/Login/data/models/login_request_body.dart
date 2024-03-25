import 'package:json_annotation/json_annotation.dart';

part 'login_request_body.g.dart';

@JsonSerializable()
class LoginRequestBody {
  String? username;
  String? password;

  LoginRequestBody({this.username, this.password});

  Map<String, dynamic> toJson() => _$LoginRequestBodyToJson(this);
}