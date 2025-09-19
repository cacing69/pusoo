// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subtitle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Subtitle _$SubtitleFromJson(Map<String, dynamic> json) => _Subtitle(
  id: json['id'] as String?,
  type: json['type'] as String?,
  attributes: json['attributes'],
  data: json['data'] as List<dynamic>?,
);

Map<String, dynamic> _$SubtitleToJson(_Subtitle instance) => <String, dynamic>{
  'id': instance.id,
  'type': instance.type,
  'attributes': instance.attributes,
  'data': instance.data,
};
