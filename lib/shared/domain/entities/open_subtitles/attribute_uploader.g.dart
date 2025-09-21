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
