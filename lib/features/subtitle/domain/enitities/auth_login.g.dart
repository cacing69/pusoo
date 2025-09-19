// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_login.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuthLogin _$AuthLoginFromJson(Map<String, dynamic> json) => _AuthLogin(
  user: json['user'] == null
      ? null
      : AuthUser.fromJson(json['user'] as Map<String, dynamic>),
  baseUrl: json['base_url'] as String?,
  token: json['token'] as String?,
  status: (json['status'] as num?)?.toInt(),
);

Map<String, dynamic> _$AuthLoginToJson(_AuthLogin instance) =>
    <String, dynamic>{
      'user': instance.user,
      'base_url': instance.baseUrl,
      'token': instance.token,
      'status': instance.status,
    };
