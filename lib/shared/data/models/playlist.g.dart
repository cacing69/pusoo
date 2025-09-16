// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playlist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Playlist _$PlaylistFromJson(Map<String, dynamic> json) => _Playlist(
  id: json['id'] as String?,
  name: json['name'] as String?,
  type: json['type'] as String? ?? "m3u",
  contentType:
      $enumDecodeNullable(_$ContentTypeEnumMap, json['contentType']) ??
      ContentType.unknown,
  filePath: json['filePath'] as String?,
  template: json['template'] as String?,
  epgLink: json['epgLink'] as String?,
  url: json['url'] as String?,
  isActive: json['isActive'] as bool? ?? false,
  username: json['username'] as String?,
  password: json['password'] as String?,
  serverUrl: json['serverUrl'] as String?,
);

Map<String, dynamic> _$PlaylistToJson(_Playlist instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'type': instance.type,
  'contentType': _$ContentTypeEnumMap[instance.contentType]!,
  'filePath': instance.filePath,
  'template': instance.template,
  'epgLink': instance.epgLink,
  'url': instance.url,
  'isActive': instance.isActive,
  'username': instance.username,
  'password': instance.password,
  'serverUrl': instance.serverUrl,
};

const _$ContentTypeEnumMap = {
  ContentType.unknown: 'unknown',
  ContentType.live: 'live',
  ContentType.movie: 'movie',
  ContentType.series: 'series',
  ContentType.audio: 'audio',
  ContentType.vod: 'vod',
};
