// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attribute_file.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AttributeFile _$AttributeFileFromJson(Map<String, dynamic> json) =>
    _AttributeFile(
      fileId: (json['file_id'] as num?)?.toInt(),
      cdNumber: (json['cd_number'] as num?)?.toInt(),
      fileName: json['file_name'] as String?,
    );

Map<String, dynamic> _$AttributeFileToJson(_AttributeFile instance) =>
    <String, dynamic>{
      'file_id': instance.fileId,
      'cd_number': instance.cdNumber,
      'file_name': instance.fileName,
    };
