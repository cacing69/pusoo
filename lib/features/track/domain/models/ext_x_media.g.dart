// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ext_x_media.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ExtXMedia _$ExtXMediaFromJson(Map<String, dynamic> json) => _ExtXMedia(
  type: json['type'] as String? ?? "",
  groupId: json['groupId'] as String? ?? "",
  language: json['language'] as String? ?? "",
  name: json['name'] as String? ?? "",
  isDefault: json['isDefault'] as bool? ?? false,
  autoSelect: json['autoSelect'] as bool? ?? false,
  uri: json['uri'] as String? ?? "",
);

Map<String, dynamic> _$ExtXMediaToJson(_ExtXMedia instance) =>
    <String, dynamic>{
      'type': instance.type,
      'groupId': instance.groupId,
      'language': instance.language,
      'name': instance.name,
      'isDefault': instance.isDefault,
      'autoSelect': instance.autoSelect,
      'uri': instance.uri,
    };
