import 'package:clean_architechture/domain/login/entities/user_entitiy.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  @override
  final String token;
  final String oneSignal_AppID;

  LoginResponse({
    required this.token,
    required this.oneSignal_AppID,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}
