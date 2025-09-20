// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'source.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Source _$SourceFromJson(Map<String, dynamic> json) => _Source(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  type: json['type'] as String? ?? "m3u",
  contentType: json['contentType'] as String?,
  filePath: json['filePath'] as String?,
  template: json['template'] as String?,
  epgLink: json['epgLink'] as String?,
  url: json['url'] as String?,
  isActive: json['isActive'] as bool? ?? false,
  username: json['username'] as String?,
  password: json['password'] as String?,
  serverUrl: json['serverUrl'] as String?,
);

Map<String, dynamic> _$SourceToJson(_Source instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'type': instance.type,
  'contentType': instance.contentType,
  'filePath': instance.filePath,
  'template': instance.template,
  'epgLink': instance.epgLink,
  'url': instance.url,
  'isActive': instance.isActive,
  'username': instance.username,
  'password': instance.password,
  'serverUrl': instance.serverUrl,
};
