// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'xtream.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Xtream _$XtreamFromJson(Map<String, dynamic> json) => _Xtream(
  host: json['host'] as String? ?? "",
  username: json['username'] as String? ?? "",
  password: json['password'] as String? ?? "",
  port: (json['port'] as num?)?.toInt() ?? 0,
  type: json['type'] as String? ?? "",
  output: json['output'] as String? ?? "",
  isValid: json['isValid'] as bool? ?? false,
);

Map<String, dynamic> _$XtreamToJson(_Xtream instance) => <String, dynamic>{
  'host': instance.host,
  'username': instance.username,
  'password': instance.password,
  'port': instance.port,
  'type': instance.type,
  'output': instance.output,
  'isValid': instance.isValid,
};
