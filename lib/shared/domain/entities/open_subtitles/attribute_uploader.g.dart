// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attribute_uploader.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AttributeUploader _$AttributeUploaderFromJson(Map<String, dynamic> json) =>
    _AttributeUploader(
      uploaderId: (json['uploader_id'] as num?)?.toInt(),
      name: json['name'] as String?,
      rank: json['rank'] as String?,
    );

Map<String, dynamic> _$AttributeUploaderToJson(_AttributeUploader instance) =>
    <String, dynamic>{
      'uploader_id': instance.uploaderId,
      'name': instance.name,
      'rank': instance.rank,
    };
