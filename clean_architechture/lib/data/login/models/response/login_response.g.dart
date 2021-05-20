// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) {
  return LoginResponse(
    userName: json['userName'] as String,
    email: json['email'] as String,
    phone: json['phone'] as String,
    createdAt: json['createdAt'] as String,
  );
}

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'userName': instance.userName,
      'email': instance.email,
      'phone': instance.phone,
      'createdAt': instance.createdAt,
    };
