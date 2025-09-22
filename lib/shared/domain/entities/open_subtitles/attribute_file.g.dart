/*
 * Pusoo - IPTV Player
 * Copyright (C) 2025 Ibnul Mutaki <ibnuul@gmail.com>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 * See the GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program. If not, see <https://www.gnu.org/licenses/>.
 */


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
