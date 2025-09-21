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
