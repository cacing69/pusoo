// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playlist_template.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PlaylistTemplate _$PlaylistTemplateFromJson(Map<String, dynamic> json) =>
    _PlaylistTemplate(
      name: json['name'] as String?,
      label: json['label'] as String?,
      knownHosts: (json['knownHosts'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$PlaylistTemplateToJson(_PlaylistTemplate instance) =>
    <String, dynamic>{
      'name': instance.name,
      'label': instance.label,
      'knownHosts': instance.knownHosts,
    };
