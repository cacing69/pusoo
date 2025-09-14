// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playlist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Playlist _$PlaylistFromJson(Map<String, dynamic> json) => _Playlist(
  id: json['id'] as String? ?? null,
  name: json['name'] as String? ?? null,
  type: json['type'] as String? ?? null,
  epgLink: json['epgLink'] as String? ?? null,
  url: json['url'] as String? ?? null,
  isActive: json['isActive'] as bool? ?? false,
);

Map<String, dynamic> _$PlaylistToJson(_Playlist instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'type': instance.type,
  'epgLink': instance.epgLink,
  'url': instance.url,
  'isActive': instance.isActive,
};
